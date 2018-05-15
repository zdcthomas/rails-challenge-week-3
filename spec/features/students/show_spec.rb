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
    it 'should display all associated addresses' do
      student = Student.create!(name: 'Greg')
      address = student.addresses.create!(street_address:'1234 my kind of town',
                                          city: 'chicago is',
                                          state: 'waking up to',
                                          zip_code: 111111,
                                          description: "the city that never sleeps")
    
      visit student_path student
      expect(page).to have_content(address.street_address)
      expect(page).to have_content(address.city)
      expect(page).to have_content(address.state)
      expect(page).to have_content(address.zip_code)
      expect(page).to have_content(address.description)
    end
  end
end
