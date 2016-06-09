class User < ActiveRecord::Base

	has_many :activities, dependent: :nullify

	validates_presence_of :full_name, :email
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	validates_uniqueness_of :email
	has_secure_password

	def self.authenticate(email, password)
		user = find_by(email: email).
		       try(:authenticate, password)
	end

end
