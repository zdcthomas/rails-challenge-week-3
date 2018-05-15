class AddStudentIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :student, foreign_key: true
  end
end
