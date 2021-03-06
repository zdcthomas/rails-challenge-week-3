require 'rails_helper'
student = Student.new(name:'Allison')
describe Address do
  before(:each) do
    student = Student.create!(name:'Allison')
  end
  describe 'validations' do
    context 'invalid attributes' do
      it 'should be invalid without street address' do
        address = Address.new(city: 'big city',
                              state: 'of being',
                              zip_code: 111111,
                              description: "log cabin",
                              student_id: student.id)

        expect(address).to be_invalid
      end
      it 'should be invalid without city' do
        address = Address.new(street_address:'1234 street road',
                              state: 'of being',
                              zip_code: 111111,
                              description: "log cabin",
                              student_id: student.id)

        expect(address).to be_invalid
      end
      it 'should be invalid without state' do
        address = Address.new(street_address:'1234 street road',
                              city: 'big city',
                              zip_code: 111111,
                              description: "log cabin",
                              student_id: student.id)

        expect(address).to be_invalid
      end
      it 'should be invalid without zip code' do
        address = Address.new(street_address:'1234 street road',
                              city: 'big city',
                              state: 'of being',
                              description: "log cabin",
                              student_id: student.id)

        expect(address).to be_invalid
      end
      it 'should be invalid without description' do
        address = Address.new(street_address:'1234 street road',
                              city: 'big city',
                              state: 'of being',
                              description: "log cabin",
                              student_id: student.id)

        expect(address).to be_invalid
      end
    end
    context 'valid attributes' do
      it 'should be valid with a street adress, city, state, and zip code' do
        address = Address.new(street_address:'1234 street road',
                              city: 'big city',
                              state: 'of being',
                              zip_code: 111111,
                              description: "log cabin",
                              student_id: student.id)
        expect(address).to be_valid
      end
    end
    context 'relationships' do
      it 'should belong to a student' do
        address = Address.create(street_address:'1234 street road',
                                 city: 'big city',
                                 state: 'of being',
                                 zip_code: 111111,
                                 description: "log cabin",
                                 student_id: student.id)

        expect(address).to respond_to(:student)
      end
    end
  end
end
