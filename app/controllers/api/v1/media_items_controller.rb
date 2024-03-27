module Api
  module V1
    class MediaItemsController < ApplicationController
      before_action :set_lesson
      before_action :set_media_item, only: [:show, :update, :destroy]

      def index
        @media_items = @lesson.media_items.map do |media_item|
          {
            id: media_item.id,
            lesson_id: media_item.lesson_id,
            media_type: media_item.media_type,
            media_link: url_for(media_item.media_link), 
            created_at: media_item.created_at,
            updated_at: media_item.updated_at
          }
        end
        render json: @media_items
      end

      # GET /api/v1/lessons/:lesson_id/media_items/:id
      def show
        @media_item = {
          id: @media_item.id,
          lesson_id: @media_item.lesson_id,
          media_type: @media_item.media_type,
          media_link: url_for(@media_item.media_link), 
          created_at: @media_item.created_at,
          updated_at: @media_item.updated_at
        }
        render json: @media_item
      end

      # PATCH/PUT /api/v1/lessons/:lesson_id/media_items/:id
      def update
        if @media_item.update(media_item_params)
          render json: @media_item
        else
          render json: @media_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/lessons/:lesson_id/media_items/:id
      def destroy
        @media_item.destroy
        head :no_content
      end

      private

      def set_lesson
        @lesson = Lesson.find(params[:lesson_id])
      end

      def set_media_item
        @media_item = @lesson.media_items.find(params[:id])
      end

      def media_item_params
        params.require(:media_item).permit(:media_type, :media_link, :lesson_id)
      end
    end
  end
end
