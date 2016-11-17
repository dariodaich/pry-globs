require 'spec_helper'

RSpec.describe IdentifierTable do
  describe "#data" do
    it "converts YAML file into instance of Hash" do
      expect(subject.data).to be_an_instance_of(Hash)
    end

    context "when fetching constant data" do
      let(:constant_ruby_version) { subject.data["constants"]["RUBY_VERSION"] }

      it "fetches definition" do
        ruby_version_definition ="The ruby version string (VERSION was deprecated).\n"

        expect(constant_ruby_version["definition"]).to eq(ruby_version_definition)
      end

      it "fetches explanation" do
        def ruby_version_explanation
          <<~EXPLANATION
            Simply print out running version of Ruby.
            Does not provide information on patch.

            > p RUBY_VERSION # => "2.3.0"
          EXPLANATION
        end

        expect(constant_ruby_version["explanation"]).to eq(ruby_version_explanation)
      end
    end

    context "when fetching global variable data" do
      let(:current_script_name) { subject.data["global_variables"]["$0"] }

      it "fetches definition" do
        current_script_definition = "Contains the name of the script being executed. May be assignable.\n"

        expect(current_script_name["definition"]).to eq(current_script_definition)
      end

      it "fetches explanation" do
        def current_script_explanation
          <<~EXPLANATION
            If name of the current running Ruby script is "foobar.rb", then:

            > p $0 # => "foobar.rb"
          EXPLANATION
        end

        expect(current_script_name["explanation"]).to eq(current_script_explanation)
      end
    end
  end
end
