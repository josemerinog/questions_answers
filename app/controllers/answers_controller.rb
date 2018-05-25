class AnswersController < ApplicationController

	before_action :auth, only: [:create]

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.build(answer_params)
		@answer.user = current_user

		if @answer.save
			flash[:success] = 'Tu pregunta ha sido publicada!'
			redirect_to @question
			
		else
			render 'questions/show'
			
		end

	end

	private

	def answer_params
		params.require(:answer).permit(:body)
	end


end
