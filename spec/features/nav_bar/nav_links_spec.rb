require 'rails_helper'
describe 'A user' do
  context 'the nav_bar' do
    it 'should have a link to students index' do
      visit new_student_path

      expect(page).to have_link("Index")

      click_on "Index"
      
      expect(current_path).to eq(students_path)
    end
    it 'should have a link to create a new student' do
      visit students_path

      expect(page).to have_link("Index")

      click_on "New Student"
      
      expect(current_path).to eq(new_student_path)
    end
  end
end
