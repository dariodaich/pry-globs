class CLIArg
  attr_reader :options, :identifiers
  attr_accessor :validator

  def initialize(args)
    @args        = args
    @options     = fetch_options
    @identifiers = fetch_identifiers
    @validator   = CLIArgValidator.new(self)
  end

  def invalid_msg
    validator.args_invalid_msg
  end

  def invalid?
    validator.args_invalid?
  end

  def valid
    @valid ||= { option: option, identifier_token: identifier }
  end

  def option_present?
    !valid[:option].empty?
  end

  def empty?
    args.empty?
  end

  private

  attr_reader :args

  def fetch_options
    args.select { |arg| arg[0] == '-' }
  end

  def fetch_identifiers
    args.select { |arg| arg[0] != '-' }
  end

  def option
    options.first || ''
  end

  def identifier
    identifiers.first
  end
end
