module QuestionsHelper

	def on_your_questions_page?
		action_name == 'mis_preguntas'
	end

	def display_solved(question)
		(question.solved) ? ' - (Resuelta)' : ''		
	end

end
