require 'rake/extensiontask'

task build: :compile

Rake::ExtensionTask.new('rails_malloc_trim') do |ext|
  ext.lib_dir = 'lib/rails_malloc_trim'
end

task default: %i[clobber compile]
