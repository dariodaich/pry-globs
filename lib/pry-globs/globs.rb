# Stdlib
require 'yaml'

# pry-globs
require_relative 'cli_arg'
require_relative 'cli_arg_validator'
require_relative 'ruby_identifier'
require_relative 'identifier_table'
require_relative 'globs'

class Globs
  attr_reader :cli_args
  attr_accessor :ruby_identifier

  def initialize(args)
    @cli_args = CLIArg.new(args)
    @ruby_identifier = RubyIdentifier.new(cli_args, IdentifierTable.new)
  end

  def identifier_description
    return cli_args.invalid_msg       if cli_args.invalid?
    return ruby_identifier.absent_msg if ruby_identifier.absent_from_table?

    ruby_identifier.description
  end
end
