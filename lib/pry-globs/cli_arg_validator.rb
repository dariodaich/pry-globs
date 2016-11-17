class CLIArgValidator
  ERROR_MESSAGES = {
    options: "Only one option is supported: '-e (explanation)'.",
    identifiers: "Globs accepts only one argument: e.g. '$!'.",
    cli_args_empty: "You have to pass at least one argument and it has to be an identifier.",
  }

  attr_reader :cli_args

  def initialize(cli_args)
    @cli_args = cli_args
  end

  def args_invalid?
    cli_args_empty? || options_invalid? || identifiers_invalid?
  end

  def args_invalid_msg
    return ERROR_MESSAGES[:cli_args_empty] if cli_args_empty?

    [:options, :identifiers].each_with_object([]) do |elem, invalid_args|
      invalid_args << ERROR_MESSAGES[elem] if send("#{elem}_invalid?")
    end.join("\n\n")
  end

  private

  def options_invalid?
    cli_args.options.size > 1 || incorrect_option?
  end

  def incorrect_option?
    option_present? && cli_args.options.first != "-e"
  end

  def option_present?
    !cli_args.options.empty?
  end

  def identifiers_invalid?
    cli_args.identifiers.size != 1
  end

  def cli_args_empty?
    cli_args.empty?
  end
end
