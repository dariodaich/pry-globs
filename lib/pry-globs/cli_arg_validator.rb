class CLIArgValidator
  CONSTANT_TOKENS = ("A".."Z").to_a << "_"
  ERROR_MESSAGES = {
    "invalid_options"           => "Only one option is supported: '-e (explanation)'.",
    "invalid_identifier_count"  => "Globs accepts only one argument: e.g. '$!'.",
    "invalid_identifier_token"  => "Invalid Ruby identifier. It has to be valid global variable (\"$0\") or a valid constant token. (\"RUBY_VERSION\")",
    "invalid_argument_presence" => "You have to pass at least one argument and it has to be an identifier.",
  }

  attr_reader :cli_args

  def initialize(cli_args)
    @cli_args = cli_args
  end

  def args_invalid?
    invalid_argument_presence? || invalid_options? || identifiers_invalid?
  end

  def args_invalid_msg
    method_names = ["options", "identifier_count", "identifier_token", "argument_presence"]
    method_names.each_with_object([]) do |method, memo|
      method = "invalid_#{method}"
      memo << ERROR_MESSAGES[method] if send("#{method}?")
    end.join("\n\n")
  end

  private

  def invalid_options?
    cli_args.options.size > 1 || incorrect_option?
  end

  def incorrect_option?
    option_present? && cli_args.options.first != "-e"
  end

  def option_present?
    !cli_args.options.empty?
  end

  def identifiers_invalid?
    invalid_identifier_count? || malformed_identifier?
  end

  def invalid_identifier_count?
    cli_args.identifiers.size != 1
  end

  def invalid_identifier_token?
    !invalid_identifier_count? && malformed_identifier?
  end

  def malformed_identifier?
    !(valid_global_variable? || valid_ruby_constant?)
  end

  def cli_args_identifier
    @cli_args_identifier ||= cli_args.identifiers.first
  end

  def valid_global_variable?
    cli_args_identifier[0] == "$"
  end

  def valid_ruby_constant?
    cli_args_identifier.split(//).all? { |letter| CONSTANT_TOKENS.include? letter }
  end

  def invalid_argument_presence?
    cli_args.empty?
  end
end
