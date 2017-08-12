class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :apisearches
  has_many :medsearches
  def admin?
    is_admin
  end

  def inspector?
    is_inspector
  end

end
