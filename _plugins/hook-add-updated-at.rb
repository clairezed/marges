Jekyll::Hooks.register :studies, :pre_render do |study|

  # get the current post last modified time
  modification_time = File.mtime( study.path )

  # inject modification_time in post's datas.
  study.data['updated_at'] = modification_time

end