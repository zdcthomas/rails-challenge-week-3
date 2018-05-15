require 'rails_helper'
describe Address do
  describe 'validations' do
    context 'invalid attributes' do
      it 'should be invalid without street address' do
        address = Address.new(city: 'big city',
                              state: 'of being',
                              zip_code: 111111)

        expect(address).to be_invalid
      end
      it 'should be invalid without city' do
        address = Address.new(street_address:'1234 street road',
                              state: 'of being',
                              zip_code: 111111)

        expect(address).to be_invalid
      end
      it 'should be invalid without state' do
        address = Address.new(street_address:'1234 street road',
                              city: 'big city',
                              zip_code: 111111)

        expect(address).to be_invalid
      end
      it 'should be invalid without street zip code' do
        address = Address.new(street_address:'1234 street road',
                              city: 'big city',
                              state: 'of being')

        expect(address).to be_invalid
      end
    end
    context 'valid attributes' do
      it 'should be valid with a street adress, city, state, and zip code' do
        address = Address.new(street_address:'1234 street road',
                                      city: 'big city',
                                      state: 'of being',
                                      zip_code: 111111)
        expect(address).to be_valid
      end
    end
  end
end
