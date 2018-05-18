# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :string
#  solved     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
