class Activity < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :creator, class_name: "User"
  has_many :timeblocks
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def active?(user)
    !!user.timeblocks.where(activity_id: self.id, endtime: nil).exists?
  end

end
