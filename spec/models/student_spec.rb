require 'rails_helper'
describe Student do
  describe 'validations' do
    context 'invalid attributes' do
      it 'should be invalid without name' do
        student = Student.new

        expect(student).to be_invalid
      end
    end
    context 'valid attributes' do
      it 'should be valid with a name' do
        student = Student.new(name: 'Sam')

        expect(student).to be_valid
      end
    end
  end
  describe 'relationships' do
    context 'addresses' do
      it 'should have many addresses' do
        student = Student.new(name: 'Sam')

        expect(student).to respond_to(:addresses)
      end
    end
  end
end
