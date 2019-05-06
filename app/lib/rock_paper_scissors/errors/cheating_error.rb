module RockPaperScissors
  module Errors
    class CheatingError < StandardError
      def initialize(shape:, message: 'A-ha! No cheating.')
        msg = message + " `#{shape}` is not a valid shape"
        super(msg)
      end
    end
  end
end