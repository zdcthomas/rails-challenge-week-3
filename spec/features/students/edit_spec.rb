require 'rails_helper'
describe 'A User' do
  describe 'visits students/:id/edit' do
    it 'should have a name field' do
      student = Student.new(name: "Johnny")
      visit edit_student_path student

      expect(page).to have_field('student[name]')
    end
    it 'should redirect to corresponding show page after submission' do
      student = Student.new(name: "Johnny")
      visit edit_student_path student

      name = 'Joe DiMaggio'
      fill_in 'student[name]', with: name
      click_on 'Submit'

      expect(current_path).to eq(student_path student)
    end
    it 'should show the student name after submission' do

      student = Student.new(name: "Johnny")
      visit edit_student_path student

      name = 'James Baldwin'
      fill_in 'student[name]', with: name
      click_on 'Submit'

      expect(page).to have_content(name)
    end
  end
end