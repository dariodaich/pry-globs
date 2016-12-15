module Identifier
  class Messanger
    def absent_global_var
      <<~MSG
        There is no information about '$xyz'.

        Please submit data and open a PR!
      MSG
    end

    def absent_constant
      <<~MSG
        There is no information about 'UNKNOWN_CONSTANT'.

        Please submit data and open a PR!
      MSG
    end
  end
end
