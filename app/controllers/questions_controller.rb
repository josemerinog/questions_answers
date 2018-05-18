class QuestionsController < ApplicationController

  def index
  	@question = Question.new
  end

# private

# 	  def question_params
# 	    params.require(:question).permit(:body, :solved)
# 	  end

end
