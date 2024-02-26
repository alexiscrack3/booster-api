# typed: strict
# frozen_string_literal: true

class Result
  extend T::Sig
  extend T::Generic

  V = type_member

  sig { returns(V) }
  attr_accessor :value

  sig { returns(T.nilable(Failure)) }
  attr_accessor :failure

  sig do
    params(
      value: V,
      failure: T.nilable(Failure),
    ).void
  end
  def initialize(value:, failure: nil)
    @value = T.let(value, Result::V)
    @failure = failure
  end

  sig { returns(T::Boolean) }
  def success?
    @failure.nil?
  end

  sig { returns(T::Boolean) }
  def failure?
    !success?
  end

  sig { params(other: Result[V]).returns(T::Boolean) }
  def ==(other)
    @value == other.value
  end

  class << self
    extend T::Sig

    sig { returns(T.attached_class) }
    def empty
      new(value: nil, failure: nil)
    end
  end
end
