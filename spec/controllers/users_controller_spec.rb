require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe 'as a Guest' do
    context 'GET #index' do
      it 'responds a 200 response' do
        get :index
        expect(subject.status).to eq(200)
      end
      
      it 'responds a 302 response' do
        user = create(:user)
        get :show, params: { id: user.id }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'As a Logged User' do
    before do
      @user = create(:user)
    end

    it 'responds a 200 response' do
      sign_in @user
      get :show, params: { id: @user.id }
      expect(subject.status).to eq(200)
    end

    it 'render a :show template' do
      sign_in @user
      get :show, params: { id: @user.id }
      expect(response).to render_template(:show)
    end
  end
  
end
