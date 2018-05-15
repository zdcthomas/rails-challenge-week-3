require 'rails_helper'
describe 'A User' do
  describe 'visits /students/:id/addresses/new' do
    it 'should have the neccesary fields' do
      student = Student.new(name: 'Sam')
      visit new_student_address student

      expect(page).to have_field('address[description]')
      expect(page).to have_field('address[street_address]')
      expect(page).to have_field('address[city]')
      expect(page).to have_field('address[state]')
      expect(page).to have_field('address[zip_code]')
    end
    it 'should redirect to students show page' do
      student = Student.new(name: 'Sam')
      description = 'Haunted'
      street_address = '1893 del monte'
      city = 'SpringField'
      zip_code = 11111
      visit new_student_address student


      fill_in 'address[description]', with: description
      fill_in 'address[street_address]', with: street_address
      fill_in 'address[city]', with: city
      fill_in 'address[zip_code]', with: zip_code
      click_on 'Create'

      expect(current_path).to eq(student_path student)
    end
    it 'should redirect to students show page' do
      student = Student.new(name: 'Sam')
      description = 'Haunted'
      street_address = '1893 del monte'
      city = 'SpringField'
      zip_code = 11111
      visit new_student_address student


      fill_in 'address[description]', with: description
      fill_in 'address[street_address]', with: street_address
      fill_in 'address[city]', with: city
      fill_in 'address[zip_code]', with: zip_code
      click_on 'Create'

      expect(page).to have_content(description)
      expect(page).to have_content(city)
      expect(page).to have_content(street_address)
      expect(page).to have_content(zip_code)
    end
  end
end