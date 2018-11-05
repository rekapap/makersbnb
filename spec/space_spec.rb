require 'space'

describe Space do
  describe '::create' do
    it 'should add to databse and return instance' do
      space = Space.create(description: 'Two bed in Tooting', price: '100')
      persisted_data(table: 'spaces', id: space.id)
      expect(space).to be_a(Space)
    end
  end
end
