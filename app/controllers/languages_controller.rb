# typed: strict
# frozen_string_literal: true

class LanguagesController < ApplicationController
  before_action :set_language, only: [:show]

  sig { void }
  def initialize
    super
    @languages_service = T.let(LanguagesService.new, LanguagesService)
    @result = T.let(Result.empty, Result[Language])
  end

  # GET /languages
  sig { void }
  def index
    result = @languages_service.find_all
    render(json: ApiDocument.new(data: result.value))
  end

  # GET /languages/1
  sig { void }
  def show
    if @result.success?
      render(json: ApiDocument.new(data: @result.value))
    else
      handle_error(@result.failure)
    end
  end

  # POST /languages
  sig { void }
  def create
    result = @languages_service.create(language_params.to_h)
    if result.success?
      render(
        json: ApiDocument.new(data: result.value),
        status: :created,
        location: result.value,
      )
    else
      handle_error(result.failure)
    end
  end

  # PATCH/PUT /languages/1
  sig { void }
  def update
    id = T.cast(params[:id], String)
    result = @languages_service.update(id, language_params.to_h)
    if result.success?
      render(json: ApiDocument.new(data: result.value))
    else
      handle_error(result.failure)
    end
  end

  # DELETE /languages/1
  sig { void }
  def destroy
    id = T.cast(params[:id], String)
    result = @languages_service.delete(id)
    if result.success?
      render(json: nil, status: :no_content)
    else
      handle_error(result.failure)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  sig { void }
  def set_language
    id = T.cast(params[:id], String)
    @result = @languages_service.find(id)
  end

  # Only allow a list of trusted parameters through.
  sig { returns(ActionController::Parameters) }
  def language_params
    params.require(:language).permit(:name)
  end
end
