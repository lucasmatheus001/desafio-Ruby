require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save successfully' do
      @user = create(:user)
      expect(@user).to be_valid
      expect(@user.save).to be_truthy
    end
  end
end
