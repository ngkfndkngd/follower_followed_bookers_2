class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
 
 # フォローするユーザーから中間テーブルへのアソシエーション
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  # フォローするユーザーからフォローされたユーザを取得する
  has_many :followers, through: :relationships, source: :followed
  
  # フォローされるユーザーから中間テーブルへのアソシエーション
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
  has_many :followeds, through: :reverse_of_relationships, source: :follower

 attachment :profile_image
 
  validates :name, presence: true, uniqueness: true,
                   length: { minimum: 2, maximum: 20 }
  
  validates :introduction, length: { maximum: 50 }
end
