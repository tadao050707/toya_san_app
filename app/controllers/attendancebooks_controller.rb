class AttendancebooksController < ApplicationController
  def new
    @attendancebooks = Attendancebook.new
    
  end
end
