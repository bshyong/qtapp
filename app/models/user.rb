class User < ActiveRecord::Base

  has_and_belongs_to_many :activities
  has_many :timeblocks

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # For a given activity, returns
  # the total daily duration
  # for the activity in seconds
  #
  # @param activity [Activity] specific user in question
  # @return [Fixnum] total daily duration in seconds
  def daily_activity_duration(activity)
    self.timeblocks
        .where(activity_id: activity,
               created_at: (Date.today...Date.today+1))
        .sum(:duration) +
    ((Time.now - self.timeblocks
                       .where(activity_id: activity,
                       created_at: (Date.today...Date.today+1),
                       endtime: nil)
                       .first.starttime) rescue 0).to_i
  end

end
