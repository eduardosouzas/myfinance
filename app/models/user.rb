class User < ActiveRecord::Base
  has_many :accounts
  has_one :profile_user

  validate :nested_attributes

  accepts_nested_attributes_for :profile_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nested_attributes
    if nested_attributes_blank?
        errors.add(:base, "É necessário preencher os campos Primeiro e segundo nomes")
    end
  end

  def nested_attributes_blank?
    self.profile_user.first_name.blank? && self.profile_user.second_name.blank?
  end
end
