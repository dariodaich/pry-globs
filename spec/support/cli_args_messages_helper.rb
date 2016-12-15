module CLIArgsMessages
  class ValidArgsMessanger
    attr_reader :definition, :explanation

    def initialize
      @definition  = "Definition:\nThe exception information message set by 'raise'.\n"
      @explanation =<<~EXPLANATION
        Explanation:
        It contains the exception when it is raised but not yet handled.
        In most cases it can be accessed within the 'rescue' clause.

        Given the following code..
        > begin
        >   5 / 0
        > rescue
        >   p $! # => #<ZeroDivisionError: divided by 0>
        > end

        Or when raising exception manually..
        > class MyError < StandardError
        > end
        >
        > begin
        >   raise MyError, "Raise it high."
        > rescue MyError
        >   p $!         # => #<MyError: Raise it high.>
        >   p $!.message # => "Raise it high."
        > end
      EXPLANATION
    end

    def description
      "#{definition}\n#{explanation}"
    end
  end

  class ErrorMessanger
    attr_reader :option_invalid,
      :invalid_identifier_count,
      :invalid_identifier,
      :argument_missing

    def initialize
      @option_invalid           = "Only one option is supported: '-e (explanation)'."
      @invalid_identifier_count = "Globs accepts only one argument: e.g. '$!'."
      @invalid_identifier       = "Invalid Ruby identifier. It has to be valid global variable (\"$0\") or a valid constant token. (\"RUBY_VERSION\")"
      @argument_missing         = "You have to pass at least one argument and it has to be an identifier."
    end

    def invalid_option_and_identifier_count
      "#{option_invalid}\n\n#{invalid_identifier_count}"
    end

    def invalid_option_and_malformed_identifier
      "#{option_invalid}\n\n#{invalid_identifier}"
    end
  end
end
