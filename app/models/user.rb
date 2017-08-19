class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :country, presence: true
  validates :company, presence: true

  has_many :orders, dependent: :destroy
  has_many :apisearches, dependent: :destroy
  has_many :medsearches, dependent: :destroy
  def admin?
    is_admin
  end

  def inspector?
    is_inspector
  end

end
