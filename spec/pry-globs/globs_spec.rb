require 'spec_helper'

RSpec.describe Globs, messangers: true do
  describe "#identifier_description", messangers: true do
    context "with valid option" do
      context "with valid identifier" do
        it "returns correct message" do
          expect(Globs.new(["-e", "$!"]).identifier_description).to(
            eq(valid_args_messanger.description)
          )
        end
      end

      context "with invalid indentifier count" do
        it "returns correct message" do
          expect(Globs.new(["-e", "$!", "RUBY_VERSION"]).identifier_description).to(
            eq(error_messanger.invalid_identifier_count)
          )
        end
      end

      context "with malformed identifier" do
        it "returns correct message" do
          expect(Globs.new(["-e", "not_a_constant"]).identifier_description).to(
            eq(error_messanger.invalid_identifier)
          )
        end
      end
    end

    context "with invalid option" do
      context "with valid identifier" do
        it "returns correct message" do
          expect(Globs.new(["-a", "$!"]).identifier_description).to(
            eq(error_messanger.option_invalid)
          )
        end
      end

      context "with invalid indentifier count" do
        it "returns correct message" do
          expect(Globs.new(["-a", "$!", "RUBY_VERSION"]).identifier_description).to(
            eq(error_messanger.invalid_option_and_identifier_count)
          )
        end
      end

      context "with malformed identifier" do
        it "returns correct message" do
          expect(Globs.new(["-a", "not_a_constant"]).identifier_description).to(
            eq(error_messanger.invalid_option_and_malformed_identifier)
          )
        end
      end
    end

    context "without option" do
      context "with valid argument" do
        it "returns correct message" do
          expect(Globs.new(["$!"]).identifier_description).to(
            eq(valid_args_messanger.definition)
          )
        end
      end

      context "with invalid identifier count" do
        it "returns correct message" do
          expect(Globs.new(["$!", "RUBY_VERSION"]).identifier_description).to(
            eq(error_messanger.invalid_identifier_count)
          )
        end
      end

      context "with malformed identifier" do
        it "returns correct message" do
          expect(Globs.new(["INvalid_contaNT"]).identifier_description).to(
            eq(error_messanger.invalid_identifier)
          )
        end
      end
    end

    context "when ruby identifier is not present in the table" do
      context "when it is a global variable" do
        it "returns message informing of identifier's absence" do
          globs = Globs.new(["$xyz"])
          expect(globs.identifier_description).to eq(identifier.absent_global_var)
        end
      end

      context "when it is a constant" do
        it "returns message informing of identifier's absence" do
          globs = Globs.new(["UNKNOWN_CONSTANT"])
          expect(globs.identifier_description).to eq(identifier.absent_constant)
        end
      end
    end
  end
end
