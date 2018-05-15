require 'rails_helper'
describe 'A User' do
  describe 'visits students/new' do
    it 'should have a name field' do
      visit new_student_path 

      expect(page).to have_field('student[name]')
    end
    it 'should add a student to the database once a name is submitted' do
      visit new_student_path 
      name = 'JimBob'

      fill_in 'student[name]', with: name
      click_on 'Create'

      student = Student.find_by(name: name)
      expect(student.name).to eq(name)
    end
    it 'should redirect to the corresponding show page affter submission' do
      visit new_student_path 
      name = 'Garry'

      fill_in 'student[name]', with: name
      click_on 'Create'

      student = Student.find_by(name: name)
      expect(current_path).to eq(student_path student)
      expect(page).to have_content(name)
    end
  end
end