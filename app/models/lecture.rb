class Lecture < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :comments,:dependent=>:delete_all
  mount_uploader :attachment, FileUploader
  acts_as_votable
  validates :title , :presence=>true
  validates :content , :presence=>true
  validates :attachment , :presence=>true





end
