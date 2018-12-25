class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # def email_required?
  # 	false
  # end
  # def email_changed?
  # 	false
  # end

  has_many :books, dependent: :destroy

  attachment :user_image

  validates :name, presence: true, length: { maximum: 20 }
  # validates :email, presence: true
  validates :introduction, length: { maximum: 50 }


end
