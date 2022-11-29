class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    set_team
    @attendancebook = Attendancebook.new
    # @team.kids = Team.find(params[:id]).kid.name
  end

  def new
    @team = Team.new
    10.times { @team.kids.build }
  end

  def edit
    set_team
    @team.kids.build
    @team
  end

  def create
    @team = Team.new(team_params)
    if @team.save
    redirect_to teams_path, notice: "登録しました"
    else
    (2 - @team.kids.size).times{ @team.kids.build }
    render :new, status: :unprocessable_entity
    end
  end

  def update
    set_team
    if @team.update(team_params)
      redirect_to teams_path, notice: "編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_team
    @team.destroy
    redirect_to teams_path, notice: "削除しました。"
  end


  private

  def team_params
    params.require(:team).permit(:id, :name, kids_attributes: [:name, :id, :kid_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end
end

#kid.parent.email