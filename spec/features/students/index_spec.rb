require 'rails_helper'
describe 'A User' do
  describe 'visits /students' do
    it 'should show a list of all students names' do
      student1 = Student.create!(name: 'Greg')
      student1 = Student.create!(name: 'Martha')
      student1 = Student.create!(name: 'Gertrude')
      student1 = Student.create!(name: 'Marshall')

      visit students_path

      expect(page).to have_content(student1.name)
      expect(page).to have_content(student2.name)
      expect(page).to have_content(student3.name)
      expect(page).to have_content(student4.name)
    end
  end
end
