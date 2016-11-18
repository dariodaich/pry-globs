RSpec.shared_context "Instantiate messangers", messangers: true do
  let(:valid_args_messanger) { CLIArgsMessages::ValidArgsMessanger.new }
  let(:error_messanger)      { CLIArgsMessages::ErrorMessanger.new }
  let(:identifier)           { Identifier::Messanger.new }
end
