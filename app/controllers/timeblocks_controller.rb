class TimeblocksController < ApplicationController

  def start
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
                .where(created_at: Date.today..Date.today+1,
                  activity_id: params[:id],
                  endtime: nil)
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

end
