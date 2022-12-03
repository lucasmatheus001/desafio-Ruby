require 'rails_helper'
RSpec.describe AccountsController, type: :controller do
  describe 'as a Guest' do
    context 'GET #index' do
      it 'responds a 200 response' do
        get :index
        expect(subject.status).to eq(200)
      end
    end
  end

  describe 'As a Logged User' do
    before do
      @user = create(:user)
      @account = create(:account, user_id: @user.id)
    end

    it 'responds a 200 response' do
      sign_in @user
      get :show, params: { id: @account.id }
      expect(subject.status).to eq(200)
    end

    it 'render a :show template' do
      sign_in @user
      get :show, params: { id: @account.id }
      expect(response).to render_template(:show)
    end
  end
  
end
