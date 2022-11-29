class AttendancebooksController < ApplicationController
  def new
    @attendancebooks = Attendancebook.new
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
        Attendancebook.create(kid_id: kid_id, presence_or_absence: attendance, day: Date.today)
      end
      redirect_to teams_path, notice: "ok"
    else
      redirect_to team_path(id: team_id), notice: "ng"
    end
  end


  private

  # def attendancebook_params
  #   params.require(:attendancebook).permit(:day, :presence_or_absence, :kid_id)
  # end

end
