class QuestionsController < ApplicationController
	before_filter :auth, only: [:create]

  def index
  	@question = Question.new
  	@questions = Question.unsolved(params)
  end

	def create
		# @question = current_user.questions.build(params[:question])
		@question = current_user.questions.new(question_params)
		if @question.save
			flash[:success] = 'Su pregunta ha sido publicada!'
			# redirect_to root_url
			redirect_to @question 
		else
		  	@questions = Question.unsolved(params)
			render 'index'
		end
	end

	def show
		@question = Question.find(params[:id])
		
	end

private

	  def question_params
	    params.require(:question).permit(:body, :solved)
	  end

end
