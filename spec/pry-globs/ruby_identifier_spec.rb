require 'spec_helper'

RSpec.describe RubyIdentifier do
  describe "#description" do
    let(:cli_args)            { instance_double("CLIArg") }
    let(:identifier_table)    { IdentifierTable.new }
    let(:definition)          { "Contains the name of the script being executed. May be assignable.\n" }
    let(:explanation)         { "If name of the current running Ruby script is \"foobar.rb\", then:\n\n> p $0 # => \"foobar.rb\"\n" }
    subject(:ruby_identifier) { RubyIdentifier.new(cli_args, identifier_table) }

    before { allow(cli_args).to receive(:valid).and_return({ identifier_token: "$0" }) }

    context "with option '-e'" do
      it "returns definition and explanation" do
        allow(cli_args).to receive(:option_present?).and_return(true)

        full_description = "#{definition}\n\n#{explanation}"
        expect(ruby_identifier.description).to eq(full_description)
      end
    end

    context "without option '-e'" do
      it "returns only definition" do
        allow(cli_args).to receive(:option_present?).and_return(false)

        expect(ruby_identifier.description).to eq(definition)
      end
    end
  end
end
