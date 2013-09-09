class User < ActiveRecord::Base

  has_and_belongs_to_many :activities
  has_many :timeblocks

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_sleep_activity

  # For a given activity, returns
  # the total daily duration
  # for the activity in seconds
  #
  # @param activity [Activity] specific user in question
  # @return [Fixnum] total daily duration in seconds
  def daily_activity_duration(activity)
    self.timeblocks_today
        .where(activity_id: activity)
        .sum(:duration) +
    ((Time.now - self.timeblocks_today
                       .where(activity_id: activity,
                              endtime: nil)
                       .first.starttime rescue 0)).to_i
  end

  def timeblocks_today
    self.timeblocks
        .where(created_at: (Date.today...Date.today+2))
  end

  private

  def create_sleep_activity
    a = Activity.find_or_create_by_name("Sleep")
    self.activities << a unless self.activities.include?(a)
  end

end
