class TimeblocksController < ApplicationController

  def start
    # stop all other activities
    current_user.timeblocks
                .where(endtime: nil)
                .map(&:stop)

    duration = params[:duration].blank? ? current_user.daily_activity_duration(params[:id]) : params[:duration]
    current_user.timeblocks << Timeblock.new(activity_id: params[:id], starttime: Time.now, last_duration: duration)

    respond_to do |format|
      format.json { render json: {response: "Activity #{params[:id]} started",
                                  path: stop_activity_url(params[:id]),
                                  stop: false},
                                  status: :ok}
    end
  end

  def stop
    t = current_user.timeblocks
                .where(endtime: nil,
                       activity_id: params[:id])
                .first
    t.update_attribute(:endtime, Time.now)
    t.update_column(:last_duration, params[:duration])
    respond_to do |format|
      format.json { render json: {response: "Activity #{params[:id]} stopped",
                                  path: start_activity_url(params[:id]),
                                  stop: true},
                                  status: :ok}
    end
  end

  def sleep

  end

end
