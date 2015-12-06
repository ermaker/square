begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
  namespace :rubocop do
    desc "Run 'rubocop --auto-gen-config'"
    task :todo do
      sh 'rubocop --auto-gen-config'
    end
  end
rescue LoadError # rubocop:disable Lint/HandleExceptions
end
