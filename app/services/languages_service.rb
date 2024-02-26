# typed: strict
# frozen_string_literal: true

class LanguagesService < ApplicationService
  sig { returns(Result[T::Array[Language]]) }
  def find_all
    Result.new(value: Language.all)
  end

  sig { params(id: T.any(String, Integer)).returns(Result[Language]) }
  def find(id)
    language = Language.find_by(id: id)
    if language.present?
      Result.new(value: language)
    else
      failure = ServiceFailure::RecordNotFound.new("Language was not found")
      Result.new(value: nil, failure: failure)
    end
  end

  sig { params(params: T::Hash[String, T.untyped]).returns(Result[Language]) }
  def create(params)
    language = Language.new(params)
    if language.save
      Result.new(value: language)
    else
      failure = ServiceFailure::RecordInvalid.new("Language was not created")
      Result.new(value: nil, failure: failure)
    end
  end

  sig do
    params(
      id: T.any(String, Integer),
      params: T::Hash[String, T.untyped],
    ).returns(Result[Language])
  end
  def update(id, params)
    club = Language.find_by(id: id)
    if club&.update(params)
      Result.new(value: club)
    else
      failure = ServiceFailure::RecordInvalid.new("Language was not updated")
      Result.new(value: nil, failure: failure)
    end
  end

  sig { params(id: T.any(String, Integer)).returns(Result[Language]) }
  def delete(id)
    Result.new(value: Language.destroy(id))
  rescue ActiveRecord::RecordNotFound
    failure = ServiceFailure::RecordNotFound.new("Language was not found")
    Result.new(value: nil, failure: failure)
  rescue => _
    failure = ServiceFailure::InternalServer.new("Language was not deleted")
    Result.new(value: nil, failure: failure)
  end
end
