require 'yaml'

class Globs
  class << self

    def find(global_var)
      ruby_globals = load_yaml

      return "Unexisting identifier." unless ruby_globals.key?(global_var)

      ruby_globals.fetch(global_var)
    end

    def load_yaml
      global_variables_path = File.expand_path('../global_variables.yaml', __FILE__)
      @ruby_variables ||= YAML.load_file(global_variables_path)
    end
  end
end
