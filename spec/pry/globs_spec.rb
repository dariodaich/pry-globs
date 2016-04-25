require 'spec_helper'

describe Globs do
  describe "loading YAML file with global variables" do
    it "will load it in as a hash" do
      ruby_globals = Globs.load_yaml

      expect(ruby_globals).to be_instance_of(Hash)
    end
  end

  describe "fetching description for a global variable" do
    it "will retrieve correct description" do
      glob_var_description = "Contains the name of the script being executed. May be assignable."

      expect(Globs.find("$0")).to eq(glob_var_description)
    end
  end
end
