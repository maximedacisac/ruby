class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients, dependent: :destroy

  def fullname 
    self.firstname + " " + self.lastname 
  end


  include PgSearch::Model
  pg_search_scope :search_all, against: [:firstname, :lastname], using: { tsearch: { prefix: true } }
end

