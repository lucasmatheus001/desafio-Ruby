require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'create user' do 
      it 'should save successfully' do
        @user = create(:user)
        expect(@user).to be_valid
        expect(@user.save).to be_truthy
      end
    end
    
    context ' validates' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:cpf) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:birthday) }
    end

    context 'uniqueness' do
      it { is_expected.to validate_uniqueness_of(:cpf) }
      it { is_expected.to validate_uniqueness_of(:email) }
    end

    

  end
end
