module Identifier
  class Messanger
    def absent_global_var
      <<~MSG
        There is no information about '$xyz'.

        #{pr_request}
      MSG
    end

    def absent_constant
      <<~MSG
        There is no information about 'UNKNOWN_CONSTANT'.

        #{pr_request}
      MSG
    end

    private

    def pr_request
      "Please submit data and open a PR!"
    end
  end
end
