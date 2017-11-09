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
  has_many :andasearches, dependent: :destroy
  def admin?
    is_admin
  end

  def inspector?
    is_inspector
  end

  def self.to_csv(options = {})
    desired_columns = %w{id email created_at country company sign_in_count last_sign_in_at}
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |user|
        csv << user.attributes.values_at(*desired_columns)
      end
    end
  end

end
