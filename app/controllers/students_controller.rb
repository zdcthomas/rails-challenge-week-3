class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :destroy, :edit, :update]

  def show
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end
  
  def create
    student = Student.new(params[:student])
    if student.save
      redirect student_path student
    else
      redirect new_student_path
    end
  end
  
  def destroy
  end
  
  def edit
  end
  
  def update
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end