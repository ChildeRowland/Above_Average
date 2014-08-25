class User < ActiveRecord::Base

	has_many :profiles
	has_many :utilities
	has_many :recyclings
	has_many :travels

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
