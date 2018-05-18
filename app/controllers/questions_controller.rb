class QuestionsController < ApplicationController
	before_filter :auth, only: [:create]

  def index
  	@question = Question.new
  end

	def create
		# @question = current_user.questions.build(params[:question])
		@question = current_user.questions.new(question_params)
		if @question.save
			flash[:success] = 'Su pregunta ha sido publicada!'
			redirect_to root_url
		else
			render 'index'
		end
	end

private

	  def question_params
	    params.require(:question).permit(:body)
	  end

end
