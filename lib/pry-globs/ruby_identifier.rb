class RubyIdentifier
  attr_reader :token_table, :cli_args

  def initialize(cli_args, identifier_table)
    @token_table = identifier_table
    @cli_args = cli_args
  end

  def description
    definition + explanation
  end

  private

  def token
    cli_args.valid[:identifier_token]
  end

  def identifier_type
    @identifier_type ||= (token[0] == "$" ? "global_variables" : "constants")
  end

  def definition
    token_data["definition"]
  end

  def token_data
    @token_data ||= token_table.data[identifier_type][token]
  end

  def explanation
    cli_args.option_present? ? "\n\n#{token_data["explanation"]}" : ''
  end
end
