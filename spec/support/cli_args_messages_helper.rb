module CLIArgsMessages
  class ValidArgsMessanger
    attr_reader :definition, :explanation

    def initialize
      @definition  = "The exception information message set by ‘raise’."
      @explanation = "This is an explanation."
    end

    def description
      "#{definition}\n\n#{explanation}"
    end
  end

  class ErrorMessanger
    attr_reader :argument_missing, :option_invalid, :identifier_invalid

    def initialize
      @option_invalid     = "Only one option is supported: '-e (explanation)'."
      @identifier_invalid = "Globs accepts only one argument: e.g. '$!'."
      @argument_missing   = "You have to pass at least one argument and it has to be an identifier."
    end

    def all_args_invalid
      "#{option_invalid}\n\n#{identifier_invalid}"
    end
  end
end
