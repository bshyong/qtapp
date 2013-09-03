class Activity < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :creator, class_name: "User"
  has_many :timeblocks
  validates :name, presence: true

  # For a given user, returns
  # the total daily duration
  # for the activity in seconds
  #
  # @param user [User] specific user in question
  # @return [Fixnum] total daily duration in seconds
  def daily_duration(user)
    user.timeblocks
        .where(activity_id: self.id,
               created_at: (Date.today...Date.today+1))
        .sum(:duration)
  end

end
