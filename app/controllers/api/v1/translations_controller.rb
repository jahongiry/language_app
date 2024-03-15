class Api::V1::TranslationsController < ApplicationController
  before_action :set_media_item
  before_action :set_translation, only: [:show, :update, :destroy]

  def index
    @translations = @media_item.translations
    render json: @translations
  end

  def show
    render json: @translation
  end


  def create
    @translation = @media_item.translations.new(translation_params.to_h)

    if @translation.save
      render json: @translation, status: :created
    else
      render json: @translation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @translation.update(translation_params)
      render json: @translation
    else
      render json: @translation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @translation.destroy
  end

  private

  def set_media_item
    @media_item = MediaItem.find(params[:media_item_id])
  end

  def set_translation
    @translation = @media_item.translations.find(params[:id])
  end

  def translation_params
    params.require(:translation).tap do |whitelisted|
      whitelisted[:array_of_objects] = parse_array_of_objects(params[:translation][:array_of_objects])
    end.permit(:other_attributes, array_of_objects: [:key])
  end

  def parse_array_of_objects(array_of_objects_param)
    return [] if array_of_objects_param.blank?

    if array_of_objects_param.is_a?(String)
      JSON.parse(array_of_objects_param)
    elsif array_of_objects_param.is_a?(Array)
      array_of_objects_param
    else
      raise "Unexpected format for array_of_objects"
    end
  rescue JSON::ParserError => e
    Rails.logger.error "Error parsing 'array_of_objects': #{e.message}"
    []
  end
end