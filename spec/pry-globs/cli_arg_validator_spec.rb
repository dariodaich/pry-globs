require 'spec_helper'

RSpec.describe CLIArgValidator, messangers: true do
  subject(:cli_arg_validator) { CLIArgValidator.new(cli_arg) }
  let (:cli_arg) { double("CLIArg") }

  def stub_methods(obj, methods)
    methods.each do |method_name, return_value|
      allow(obj).to receive(method_name).and_return(return_value)
    end
  end

  describe "#args_invalid?" do
    context "with valid option passed" do
      context "with valid identifier" do
        it "returns false" do
          stub_methods(cli_arg, options: ["-e"], identifiers: ["$0"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(false)
        end
      end

      context "with invalid number of identifiers" do
        it "returns true" do
          stub_methods(cli_arg, options: ["-e"], identifiers: ["$0", "RUBY_VERSION"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(true)
        end
      end

      context "with malformed identifier" do
        it "returns true" do
          stub_methods(cli_arg, options: ["-e"], identifiers: ["InVaLid_ToKe$"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(true)
        end
      end
    end

    context "with invalid option passed" do
      context "with valid identifer" do
        it "returns true" do
          stub_methods(cli_arg, options: ["-a"], identifiers: ["$0"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(true)
        end
      end

      context "with invalid number of identifiers" do
        it "returns true" do
          stub_methods(cli_arg, options: ["-a"], identifiers: ["$0", "RUBY_VERSION"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(true)
        end
      end

      context "with malformed identifier" do
        it "returns true" do
          stub_methods(cli_arg, options: ["-a"], identifiers: ["InVaLid_ToKe$"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(true)
        end
      end
    end

    context "without option passed" do
      context "with valid identifer" do
        it "returns true" do
          stub_methods(cli_arg, options: [], identifiers: ["$0"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(false)
        end
      end

      context "with invalid number of identifiers" do
        it "returns true" do
          stub_methods(cli_arg, options: [], identifiers: ["$0", "RUBY_VERSION"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(true)
        end
      end

      context "with malformed identifier" do
        it "returns true" do
          stub_methods(cli_arg, options: [], identifiers: ["InVaLid_ToKe$"], empty?: false)
          expect(cli_arg_validator.args_invalid?).to be(true)
        end
      end
    end
  end

  describe "#args_invalid_msg" do
    context "with valid option passed" do
      context "with valid identifier" do
        it "returns correct message" do
          stub_methods(cli_arg, options: ["-e"], identifiers: ["$0"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq("")
        end
      end

      context "with invalid number of identifiers" do
        it "returns correct message" do
          stub_methods(cli_arg, options: ["-e"], identifiers: ["$0", "RUBY_VERSION"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.invalid_identifier_count)
        end
      end

      context "with malformed identifier" do
        it "returns correct message" do
          stub_methods(cli_arg, options: ["-e"], identifiers: ["InVaLid_ToKe$"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.invalid_identifier)
        end
      end
    end

    context "with invalid option passed" do
      context "with valid identifer" do
        it "returns correct message" do
          stub_methods(cli_arg, options: ["-a"], identifiers: ["$0"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.option_invalid)
        end
      end

      context "with invalid number of identifiers" do
        it "returns correct message" do
          stub_methods(cli_arg, options: ["-a"], identifiers: ["$0", "RUBY_VERSION"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.invalid_option_and_identifier_count)
        end
      end

      context "with malformed identifier" do
        it "returns correct message" do
          stub_methods(cli_arg, options: ["-a"], identifiers: ["InVaLid_ToKe$"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.invalid_option_and_malformed_identifier)
        end
      end
    end

    context "without option passed" do
      context "with valid identifer" do
        it "returns correct message" do
          stub_methods(cli_arg, options: [], identifiers: ["$0"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq("")
        end
      end

      context "with invalid number of identifiers" do
        it "returns correct message" do
          stub_methods(cli_arg, options: [], identifiers: ["$0", "RUBY_VERSION"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.invalid_identifier_count)
        end
      end

      context "with malformed identifier" do
        it "returns correct message" do
          stub_methods(cli_arg, options: [], identifiers: ["InVaLid_ToKe$"], empty?: false)
          expect(cli_arg_validator.args_invalid_msg).to eq(error_messanger.invalid_identifier)
        end
      end
    end
  end
end
