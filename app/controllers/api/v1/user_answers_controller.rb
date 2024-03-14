module Api
  module V1
    class UserAnswersController < ApplicationController
      before_action :set_user_answer, only: [:show, :update, :destroy]

      # GET /api/v1/user_answers
      def index
        @user_answers = current_user.user_answers
        render json: @user_answers
      end

      # GET /api/v1/user_answers/:id
      def show
        render json: @user_answer
      end

      # POST /api/v1/user_answers
      def create
        @user_answer = current_user.user_answers.build(user_answer_params)

        if @user_answer.save
          render json: @user_answer, status: :created
        else
          render json: @user_answer.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/user_answers/:id
      def update
        if @user_answer.update(user_answer_params)
          render json: @user_answer
        else
          render json: @user_answer.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/user_answers/:id
      def destroy
        @user_answer.destroy
        head :no_content
      end

      private

      def set_user_answer
        @user_answer = current_user.user_answers.find(params[:id])
      end

      def user_answer_params
        params.require(:user_answer).permit(:text, :question_id)
      end
    end
  end
end
