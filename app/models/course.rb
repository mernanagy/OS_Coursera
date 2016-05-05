class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures,:dependent=>:delete_all
  mount_uploader :image, ImageUploader
  validates :title , :presence=>true
  validates :title , :uniqueness=>true
  validates :desc , :presence=>true
  validates :image , :presence=>true

end
