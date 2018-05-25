# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  body        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # attr_accessor :body

  # validates :body, presence: true, length: {in: 2..255}
   validates :body, presence: true
end
