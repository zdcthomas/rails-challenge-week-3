require 'rails_helper'
describe 'A User' do
  describe 'visits /students' do
    it 'should have a delete button for each student' do
      student1 = Student.create!(name: "Glenn")
      student2 = Student.create!(name: "Garry")
      student2 = Student.create!(name: "Ross")
      visit students_path

      within "#student_#{student1.id}" do
        expect(page).to have_button("Delete")
      end
      within "#student_#{student2.id}" do
        expect(page).to have_button("Delete")
      end
      within "#student_#{student3.id}" do
        expect(page).to have_button("Delete")
      end
    end
    context 'after clicking delete' do
      it 'should redirect to the students page' do
        student1 = Student.create!(name: "Glenn")
        student2 = Student.create!(name: "Garry")
        student2 = Student.create!(name: "Ross")

        visit students_path
        within "#student_#{student1.id}" do
          click_on"Delete"
        end

        expect(current_path).to eq(students_path)
      end
      it 'should remove only the corresponding studnets name from the index' do
        student1 = Student.create!(name: "Glenn")
        student2 = Student.create!(name: "Garry")
        student2 = Student.create!(name: "Ross")

        visit students_path
        within "#student_#{student1.id}" do
          click_on"Delete"
        end

        expect(page).to_not have_content(student1.name)
        expect(page).to have_content(student2.name)
        expect(page).to have_content(student3.name)
      end
    end
  end
end
