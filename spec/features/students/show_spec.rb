require 'rails_helper'
describe 'A User' do
  describe 'visits students/:id' do
    it 'should show the name of the student with that id' do
      student = Student.create!(name: 'Greg')

      visit student_path student

      expect(page).to have_content(student.name)
    end
    it 'should have a nav bar' do
      student = Student.create!(name: 'Greg')

      visit student_path student
      expect(page).to have_link("Index")
      expect(page).to have_link("New Student")
    end
  end
end
