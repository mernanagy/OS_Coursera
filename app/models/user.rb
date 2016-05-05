class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lectures,:dependent=>:delete_all
  has_many :courses,:dependent=>:delete_all
  has_many :comments,:dependent=>:delete_all
  acts_as_voter
  enum gender: { male:0, female:1}
  mount_uploader :image, ImageUploader
  validates :name , :presence=>true
  validates :image , :presence=>true
  validates :email , :presence=>true
end
