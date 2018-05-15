class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :destroy, :edit, :update]

  def show
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new()
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_path @student
    else
      redirect_to new_student_path
    end
  end
  
  def destroy
    @student.destroy

    redirect_to students_path
  end
  
  def edit
  end
  
  def update
    @student.update(student_params)
    if @student.save
      redirect_to student_path
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end