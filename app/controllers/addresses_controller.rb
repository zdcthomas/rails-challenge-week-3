class AddressesController < ApplicationController
  
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])
    if @address.save
      redirect_to student_path @address.student
    else
      redirect_to new_student_address_path
    end
  end
end