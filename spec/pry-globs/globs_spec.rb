require 'spec_helper'

RSpec.describe Globs do
  subject(:globs) { Globs.new(user_input) }

  describe "#get_identifier_description", messangers: true do
    context "with valid option and argument" do
      let(:user_input) { ["-e", "$!"] }

      it "returns explanation and definition of an identifier" do
        expect(globs.get_identifier_description).to eq(valid_args_messanger.description)
      end
    end

    context "with option and without argument" do
      let(:user_input) { ["-e"] }

      it "returns warning that an identifier has to be passed" do
        expect(globs.get_identifier_description).to eq(error_messanger.identifier_invalid)
      end
    end

    context "without option and with argument" do
      let(:user_input) { ["$!"] }

      it "returns definition of an identifier" do
        expect(globs.get_identifier_description).to eq(valid_args_messanger.definition)
      end
    end

    context "without option and argument" do
      let(:user_input) { [] }

      it "returns warning that at least one argument has to be passed" do
        expect(globs.get_identifier_description).to eq(error_messanger.argument_missing)
      end
    end
  end
end
