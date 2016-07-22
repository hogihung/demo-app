class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
         ##:trackable, :registerable

  validates :name, presence: true
  validates :email, presence: true
end
