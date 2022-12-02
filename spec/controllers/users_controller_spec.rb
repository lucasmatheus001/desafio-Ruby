require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  
    it 'responds a 200 response' do
      get :index
      # expect(response).to be_success
      expect(subject.status).to eq(200)
    end
  

end
