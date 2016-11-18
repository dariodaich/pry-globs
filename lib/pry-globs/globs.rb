class Globs
  attr_reader :cli_args
  attr_accessor :ruby_identifier

  def initialize(args)
    @cli_args = CLIArg.new(args)
    @ruby_identifier = RubyIdentifier.new(cli_args, IdentifierTable.new)
  end

  def get_identifier_description
    return cli_args.invalid_msg       if cli_args.invalid?
    return ruby_identifier.absent_msg if ruby_identifier.absent_from_table?

    ruby_identifier.description
  end

  private

  def identifier_table_path
    File.expand_path("../identifier_data.yaml", __FILE__)
  end
end
