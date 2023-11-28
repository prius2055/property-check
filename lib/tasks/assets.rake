# lib/tasks/assets.rake

namespace :assets do
  Rake::Task["precompile"].enhance do
    # Any enhancements you want to add before assets precompilation
    # For example, you can run additional tasks or set environment variables.
  end
end
