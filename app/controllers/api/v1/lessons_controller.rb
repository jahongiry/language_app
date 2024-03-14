module Api
  module V1
    class LessonsController < ApplicationController
      before_action :set_lesson, only: [:show, :update, :destroy]

      # GET /api/v1/lessons
      def index
        @lessons = current_user.lessons
        render json: @lessons
      end

      # GET /api/v1/lessons/:id
      def show
        render json: @lesson
      end

      # POST /api/v1/lessons
      def create
        @lesson = current_user.lessons.build(lesson_params)

        if @lesson.save
          render json: @lesson, status: :created
        else
          render json: @lesson.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/lessons/:id
      def update
        if @lesson.update(lesson_params)
          render json: @lesson
        else
          render json: @lesson.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/lessons/:id
      def destroy
        @lesson.destroy
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_lesson
        @lesson = current_user.lessons.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def lesson_params
        params.require(:lesson).permit(:index, :title, :description, :completed, :score)
      end
    end
  end
end
