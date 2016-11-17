require "yaml"
require_relative "cli_arg"
require_relative "cli_arg_validator"
require_relative "ruby_identifier"
require_relative "identifier_table"

class Globs
  attr_reader :cli_args, :ruby_identifier

  def initialize(args)
    @cli_args = CLIArg.new(args)
    @ruby_identifier = RubyIdentifier.new(cli_args, IdentifierTable.new)
  end

  def get_identifier_description
    return cli_args.invalid_msg if cli_args.invalid?

    ruby_identifier.description
  end

  private

  def identifier_table_path
    File.expand_path("../identifier_data.yaml", __FILE__)
  end
end

# puts Globs.new(["-e", "HAHA"]).get_identifier_description
