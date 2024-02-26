# typed: strict
# frozen_string_literal: true

module ServiceFailure
  class ArgumentNull < Failure; end

  class DuplicateKey < Failure; end

  class RecordInvalid < Failure; end

  class RecordNotFound < Failure; end

  class InternalServer < Failure; end
end
