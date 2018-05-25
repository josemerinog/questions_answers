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

class Question < ApplicationRecord
  #attr_accessor :body, :solved
  belongs_to :user
  has_many :answers

  validates :body, presence: true, length: {in: 10..255}
  # validates :solved, inclusion: {in: [true, false]}

	self.per_page = 3

  def self.unsolved(params)
  	where(solved: false).paginate(page: params[:page]).order('created_at DESC')
  	#where(solved: false).paginate(page: params[:page].order('created_at DESC')
  	#.page(params[:page]).order('created_at DESC')
  end

end
