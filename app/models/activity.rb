class Activity < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :creator, class_name: "User"
  validates :name, presence: true

end
