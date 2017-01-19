class User < ActiveRecord::Base


  enum role: [:normal, :moderator, :admin]

  devise :database_authenticatable, :registerable, :validatable
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
  

end
