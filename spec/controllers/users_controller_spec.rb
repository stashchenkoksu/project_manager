require 'rails_helper'

describe UsersController, type: :controller do
  let(:users) { create_list :user, 5 }
  let(:user) { create :user}

  context 'GET :index' do
    before { get :index }

    it 'renders the action' do
      expect(response).to render_template(:index)
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns trust values' do
      expect(assigns(:users)).to match_array(users)
    end
  end

  context 'GET :show' do
    before { get :show, params: { id: user.id } }

    it 'renders the action' do
      expect(response).to render_template(:show)
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end
  end
end
