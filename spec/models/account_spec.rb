require 'rails_helper'
RSpec.describe Account, type: :model do
  describe 'Validations' do
    context 'create account' do 
      it 'should save successfully' do
        user = create(:user)
        account = create(:account, user_id: user.id)
        expect(account).to be_valid
        expect(account.save).to be_truthy
      end
    end
    
    context ' validates' do
      it { is_expected.to validate_presence_of(:number) }
      it { is_expected.to validate_presence_of(:agency) }
      it { is_expected.to validate_presence_of(:status) }
    end
  end
end
