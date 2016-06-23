namespace :git do
  SOURCE_BRANCH = "source"
  DEPLOY_BRANCH = "gh-pages"
  DESTINATION_FOLDER = "_site"
  PROD_CONFIG_FILE = "_config_prod.yml"

  def git_source_branch?
    git_head = `git rev-parse --abbrev-ref HEAD`
    source = (git_head.strip == SOURCE_BRANCH)
  end

  def git_clean?
    git_state = `git status 2> /dev/null | tail -n1`
    clean = (git_state =~ /working directory clean/)
  end

  desc "Verify source branch"
  task :check_branch do
    unless git_source_branch?
      puts "Deploy not initiated from source branch. You should add `exclude: [Rakefile]` in _config.yml."
      puts "Checkout #{SOURCE_BRANCH} and deploy again."
      exit 1
    end
  end

  desc "Verify clean git state"
  task :check_git do
    unless git_clean?
      puts "Uncommitted changes. Commit or discard your changes and run deploy again."
      exit 1
    end
  end

  desc "Deploy to remote origin"
  task :deploy => [:check_branch, :check_git] do
    puts "Building Jekyll site"
    system "jekyll build --config _config.yml,#{PROD_CONFIG_FILE}"

    system "git checkout #{DEPLOY_BRANCH}"

    puts "Copying #{DESTINATION_FOLDER} to root"
    system "cp -r #{DESTINATION_FOLDER}/* . && rm -rf #{DESTINATION_FOLDER}"

    puts "Adding .nojekyll to root"
    system "touch .nojekyll"

    unless git_clean?
      puts "Pushing to #{DEPLOY_BRANCH}."
      system "git add -A && git commit -m \"Site updated at #{Time.now.utc}\""
      system "git push origin #{DEPLOY_BRANCH}"
    else
      puts "No changes found. Deploy aborted."
    end

    system "git checkout #{SOURCE_BRANCH}"
  end
end