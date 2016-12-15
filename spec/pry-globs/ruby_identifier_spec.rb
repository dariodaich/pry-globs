require 'spec_helper'

RSpec.describe RubyIdentifier, messangers: true do
  let(:cli_args)            { instance_double("CLIArg") }
  let(:identifier_table)    { IdentifierTable.new }
  let(:definition)          { "Definition:\nContains the name of the script being executed. May be assignable.\n" }
  let(:explanation)         { "Explanation:\nIf name of the current running Ruby script is \"foobar.rb\", then:\n\n> p $0 # => \"foobar.rb\"\n" }
  subject(:ruby_identifier) { RubyIdentifier.new(cli_args, identifier_table) }

  describe "#description" do
    before do
      allow(cli_args).to receive(:valid).and_return({ identifier_token: "$0" })
    end

    context "with option -e" do
      it "returns definition and explanation" do
        allow(cli_args).to receive(:option_present?).and_return(true)

        full_description = "#{definition}\n#{explanation}"
        expect(ruby_identifier.description).to eq(full_description)
      end
    end

    context "without option -e" do
      it "returns only definition" do
        allow(cli_args).to receive(:option_present?).and_return(false)

        expect(ruby_identifier.description).to eq(definition)
      end
    end
  end

  describe "#included_in_table?" do
    context "when included in the table" do
      before do
        allow(cli_args).to receive(:valid).and_return({ identifier_token: "$!" })
      end

      it "returns true" do
        expect(ruby_identifier.absent_from_table?).to be false
      end
    end

    context "when not included in the table" do
      before do
        allow(cli_args).to receive(:valid).and_return({ identifier_token: "UNKNOWN_CONSTANT" })
      end

      it "returns false" do
        expect(ruby_identifier.absent_from_table?).to be true
      end
    end
  end

  describe "#absent_msg" do
    context "when identifier absent" do
      before do
        allow(cli_args).to receive(:valid).and_return({ identifier_token: "UNKNOWN_CONSTANT" })
      end

      it "returns message informing about absence of the identifier" do
        expect(ruby_identifier.absent_msg).to eq(identifier.absent_constant)
      end
    end

    context "when identifier not absent" do
      before do
        allow(cli_args).to receive(:valid).and_return({ identifier_token: "$!" })
      end

      it "returns empty string" do
        expect(ruby_identifier.absent_msg).to eq("")
      end
    end
  end
end
