require 'spec_helper'

RSpec.describe CLIArg do
  let(:args)        { ["-e", "$0"] }
  subject(:cli_arg) { CLIArg.new(args) }

  def expect_method_on_cli_validator(method)
    @cli_arg_validator = instance_double("CLIArgValidator")
    subject.validator = @cli_arg_validator

    expect(@cli_arg_validator).to receive(method)
  end

  describe "#options" do
    let(:args) { ["-e", "-a", "$0", "RUBY_VERSION"] }

    it "collects options" do
      expect(cli_arg.options).to eq(["-e", "-a"])
    end
  end

  describe "#identifiers" do
    let(:args) { ["-e", "-a", "$0", "RUBY_VERSION"] }

    it "collects arguments" do
      expect(cli_arg.identifiers).to eq(["$0", "RUBY_VERSION"])
    end
  end

  describe "#invalid_msg" do
    before { expect_method_on_cli_validator(:args_invalid_msg) }

    it "sends #args_invalid_msg to instance of CLIArgValidator" do
      subject.invalid_msg
    end
  end

  describe "#invalid?" do
    before { expect_method_on_cli_validator(:args_invalid?) }

    it "sends #args_invalid? to instance of CLIArgValidator" do
      subject.invalid?
    end
  end

  describe "#valid" do
    context "with option and argument" do
      let(:args) { ["-e", "$0"] }

      it "has both option and identifier token" do
        expect(cli_arg.valid).to eq({ option: "-e", identifier_token: "$0" })
      end
    end

    context "with option and without argument" do
      let(:args) { ["-e"] }

      it "has option, but not identifier token" do
        expect(cli_arg.valid).to eq({ option: "-e", identifier_token: nil })
      end
    end

    context "without option and with argument" do
      let(:args) { ["$0"] }

      it "has empty option and identifier token" do
        expect(cli_arg.valid).to eq({ option: "", identifier_token: "$0" })
      end
    end

    context "without option and argument" do
      let(:args) { [] }

      it "has empty option and no identifier token" do
        expect(cli_arg.valid).to eq({ option: "", identifier_token: nil })
      end
    end
  end

  describe "#option_present?" do
    context "with given option" do
      let(:args) { ["-e", "$0"] }

      it "will return true" do
        expect(cli_arg.option_present?).to be true
      end
    end

    context "without an option" do
      let(:args) { ["$0"] }

      it "will return false" do
        expect(cli_arg.option_present?).to be false
      end
    end
  end
end
