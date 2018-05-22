class QuestionsController < ApplicationController
	before_filter :auth, only: [:create, :mis_preguntas, :edit, :update]

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

	def mis_preguntas
		@questions = current_user.mis_preguntas(params)
	end

	def edit
		@question = current_user.questions.find(params[:id])
	end

	def update
		@question = current_user.questions.find(params[:id])

		if @question.update_attributes(question_params)
			flash[:success] = 'Su pregunta ha sido actualizada!'
			redirect_to @question
		else
			render 'edit'
		end

	end

private

	  def question_params
	    params.require(:question).permit(:body, :solved)
	  end

end
