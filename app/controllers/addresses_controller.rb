class AddressesController < ApplicationController

  def new
    @student = Student.find(params[:student_id])
    @address = Address.new
  end

  def create
    @student = Student.find(params[:student_id])
    @address = @student.addresses.new(address_params)
    if @address.save
      redirect_to student_path @address.student
    else
      redirect_to new_student_address_path
    end
  end
  private

  def address_params
    params.require(:address).permit(:street_address, :city, :description, :state, :zip_code, :student_id)
  end
end