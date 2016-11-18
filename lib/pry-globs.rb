# Stdlib
require "yaml"

# Internal requires
require_relative "pry-globs/cli_arg"
require_relative "pry-globs/cli_arg_validator"
require_relative "pry-globs/ruby_identifier"
require_relative "pry-globs/identifier_table"
require_relative "pry-globs/globs"

Pry::Commands.create_command "globs" do
  description "Search for a description of Ruby's constants and global variables."

  def process
    output.puts Globs.new(args).get_identifier_description
  end
end
