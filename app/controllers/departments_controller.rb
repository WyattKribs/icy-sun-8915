class DepartmentsController < ApplicationController
  def new
  end
  def show
    @department = Department.find(params[:id])
  end
end
