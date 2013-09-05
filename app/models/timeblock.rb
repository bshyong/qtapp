class Timeblock < ActiveRecord::Base
  belongs_to :user

  after_save :calculate_duration, unless: Proc.new{|timeblock| timeblock.endtime.blank? || timeblock.duration.present?}

  def stop
    self.update_attribute(:endtime, Time.now) if endtime.blank?
  end

  private

  def calculate_duration
    self.update_column(:duration, self.endtime-self.starttime)
  end

end
