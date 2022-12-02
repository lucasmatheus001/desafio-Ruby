require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save successfully' do
      @user = create(:user)
      expect(@user).to be_valid
      expect(@user.save).to be_truthy
    end

    it 'should not save if email nil' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without name' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without birthday' do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
    
  end
end
