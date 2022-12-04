class AttendancebooksController < ApplicationController
  def index
    @attendancebooks = Attendancebook.all
    if params[:day_data] && params[:class_name]
      # パラメータで届いた日にちに合致する出席簿情報
      the_day_attendance_datas = Attendancebook.where(start_time: params[:day_data])
      # パラメータで届いたクラス名に合致する子供の情報
      the_kids = Kid.where(team_id: "#{Team.find_by(name: params[:class_name]).id}")
      # パラメータで届いた日にちとクラス名に合致する出席簿情報
      @attendancebooks_teams = the_day_attendance_datas.where(kid_id: the_kids)
      @day_data = params[:day_data]
      @team_name = params[:class_name]
    end
  end

  def new
    @attendancebook = Attendancebook.new
    @team = Team.find(params[:team_id])
  end

  def create
    # @attendancebook = Attendancebook.create(attendancebook_params)
    # "attendancebook"=>{"13_presence_or_absence"=>"1", "team_id"=>"10"}
    team_id = params[:attendancebook][:team_id].to_i
    team = Team.find(team_id)
    # team.kid_ids #=> [13, 14] 
    # byebug
    unless params[:attendancebook].values.include?("")
      team.kid_ids.each do |kid_id|
        attendance = params[:attendancebook]["#{kid_id}_attendance"].to_i
        Attendancebook.create(kid_id: kid_id, presence_or_absence: attendance, start_time: Date.today)
      end
      redirect_to attendancebooks_path, notice: "出席確認できました！"
    else
      redirect_to team_path(id: team_id), notice: "もう一度確認してください！"
    end
  end


  private

  # def attendancebook_params
  #   params.require(:attendancebook).permit(:day, :presence_or_absence, :kid_id)
  # end

end
