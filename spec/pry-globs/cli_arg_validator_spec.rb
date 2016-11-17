require 'spec_helper'

RSpec.describe CLIArgValidator, messangers: true do
  let (:cli_arg) { double("CLIArg") }
  subject(:cli_arg_validator) { CLIArgValidator.new(cli_arg) }

  def stub_methods(obj, methods)
    methods.each do |method_name, return_value|
      allow(obj).to receive(method_name).and_return(return_value)
    end
  end

  context "when options and identifiers are valid" do
    before do
      stub_methods(cli_arg, options: ["-e"], identifiers: ["$0"], empty?: false)
    end

    describe "#args_invalid?" do
      it "checks if arguments passed are valid" do
        expect(cli_arg_validator.args_invalid?).to be(false)
      end
    end

    describe "#args_invalid_msg" do
      it "prints error messages" do
        expect(cli_arg_validator.args_invalid_msg).to eq("")
      end
    end
  end

  context "when no options are passed" do
    before do
      stub_methods(cli_arg, options: [], identifiers: ["$0"], empty?: false)
    end

    describe "#args_invalid?" do
      it "checks if arguments passed are valid" do
        expect(cli_arg_validator.args_invalid?).to be(false)
      end
    end

    describe "#args_invalid_msg" do
      it "prints error messages" do
        expect(cli_arg_validator.args_invalid_msg).to eq("")
      end
    end
  end

  context "when identifiers are invalid" do
    before do
      stub_methods(cli_arg, options: ["-e"], identifiers: [], empty?: false)
    end

    describe "#args_invalid?" do
      it "checks if arguments passed are valid" do
        expect(cli_arg_validator.args_invalid?).to be(true)
      end
    end

    describe "#args_invalid_msg" do
      it "prints error messages" do
        expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.identifier_invalid)
      end
    end
  end

  context "when options are invalid" do
    before do
      stub_methods(cli_arg, options: ["-a"], identifiers: ["$0"], empty?: false)
    end

    describe "#args_invalid?" do
      it "checks if arguments passed are valid" do
        expect(cli_arg_validator.args_invalid?).to be(true)
      end
    end

    describe "#args_invalid_msg" do
      it "prints error messages" do
        expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.option_invalid)
      end
    end
  end

  context "when options and identifiers are invalid" do
    before do
      stub_methods(cli_arg, options: ["-a"], identifiers: ["$0", "RUBY_VERSION"], empty?: false)
    end

    describe "#args_invalid?" do
      it "checks if arguments passed are valid" do
        expect(cli_arg_validator.args_invalid?).to be(true)
      end
    end

    describe "#args_invalid_msg" do
      it "prints error messages" do
        expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.all_args_invalid)
      end
    end
  end
end
