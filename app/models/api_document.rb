# typed: strict
# frozen_string_literal: true

class ApiDocument
  extend T::Sig

  sig do
    params(
      data: T.untyped,
      errors: T::Array[ApiError],
    ).void
  end
  def initialize(data: nil, errors: [])
    @data = data
    @errors = errors
  end
end
