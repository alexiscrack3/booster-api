# typed: strict
# frozen_string_literal: true

require "test_helper"

class LanguagesServiceTest < ActiveSupport::TestCase
  extend T::Sig

  setup do
    @languages_service = T.let(LanguagesService.new, LanguagesService)
  end

  test "should get all languages" do
    result = @languages_service.find_all

    assert_equal Language.all, result.value
  end

  test "should get language by id" do
    language = T.let(languages(:one), Language)

    result = @languages_service.find(T.must(language.id))

    assert_equal language, result.value
  end

  test "should not get language by id when id does not exist" do
    expected = ServiceFailure::RecordNotFound.new("Language was not found")

    result = @languages_service.find(-1)

    assert_nil result.value
    assert_equal expected, result.failure
  end

  test "should create language" do
    params = {
      name: Faker::Nation.language,
    }

    assert_difference("Language.count", 1) do
      result = @languages_service.create(params)

      assert_equal params[:name], result.value.name
    end
  end

  # test "should not create language when it is not valid" do
  #   params = {
  #     name: nil,
  #   }
  #   expected = ServiceFailure::RecordInvalid.new("Language was not created")

  #   result = @languages_service.create(params)

  #   assert_equal expected, result.failure
  # end

  test "should update language" do
    language = languages(:one)
    params = {
      name: Faker::Nation.language,
    }

    result = @languages_service.update(language.id, params)

    assert_equal language.id, result.value.id
    assert_equal params[:name], result.value.name
  end

  # test "should not update language when it is not valid" do
  #   language = languages(:one)
  #   params = {
  #     name: nil,
  #   }
  #   expected = ServiceFailure::RecordInvalid.new("Language was not updated")

  #   result = @languages_service.update(language.id, params)

  #   assert_equal expected, result.failure
  # end

  test "should delete language" do
    language = languages(:one)

    assert_difference("Language.count", -1) do
      result = @languages_service.delete(language.id)

      assert_equal language, result.value
    end
  end

  test "should not delete language when it does not exist" do
    expected = ServiceFailure::RecordNotFound.new("Language was not found")

    result = @languages_service.delete(-1)

    assert_equal expected, result.failure
  end

  # test "should not delete language when something goes wrong" do
  #   language = languages(:one)
  #   expected = ServiceFailure::InternalServer.new("Language was not deleted")
  #   Language
  #     .stubs(:destroy)
  #     .with(language.id)
  #     .raises(StandardError, "This is an exception")

  #   result = @languages_service.delete(language.id)

  #   assert_equal expected, result.failure
  # end
end
