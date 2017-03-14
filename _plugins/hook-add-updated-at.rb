Jekyll::Hooks.register :studies, :pre_render do |study|

  # get the current post last modified time
  modification_time = File.mtime( study.path )
  puts study.path
  puts modification_time

  # inject modification_time in post's datas.
  study.data['updated_at'] = modification_time

end


Jekyll::Hooks.register :posts, :pre_render do |post|

  # get the current post last modified time
  modification_time = File.mtime( post.path )

  # inject modification_time in post's datas.
  post.data['updated_at'] = modification_time

end
