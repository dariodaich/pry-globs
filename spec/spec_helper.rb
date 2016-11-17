pry_globs_dir    = File.expand_path('../../lib/pry-globs', __FILE__)
spec_support_dir = File.expand_path('../support', __FILE__)
$LOAD_PATH.unshift(pry_globs_dir, spec_support_dir)

require 'globs'
require 'cli_args_messages_helper'
require 'shared_messangers'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
  config.order = :random
  config.disable_monkey_patching!
  config.include CLIArgsMessages
  config.formatter = (config.files_to_run.one? ? 'd' : 'p')
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
