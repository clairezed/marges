module Jekyll
  module Algolia
    module Hooks
      # Hook pour exlure les pages /tags et /lubies générées automatiquement
      def self.should_be_excluded?(filepath)
        # Do not index blog posts from 2015
        p filepath
        return true if filepath =~ %r{lubies/}
        return true if filepath =~ %r{tags/}
        false
      end
    end
  end
end
