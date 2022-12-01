require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save successfully' do
      @user = User.new(
        name: 'John',
        cpf: '12345678901',
        email: "lucas@example.com",
        birthday: '1990-01-01')
      expect(@user).to be_valid
      expect(@user.save).to be_truthy
    end
  end
end
