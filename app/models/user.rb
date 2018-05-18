# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
	has_many :questions
	# attr_accessor :username, :password, :password_confirmation
	has_secure_password

	validates :username, presence: true, uniqueness: {case_sensitive: false},
								length: { in: 4..12},
								format: { with: /\A[a-z][a-z0-9*\z]/, message: 'Unicamente letras minúsculas y números.'}
	validates :password, length: { in: 4..8 } 
	validates :password_confirmation, length: { in: 4..8 } 
end
