require 'rails_helper'

describe TeamsController, type: :controller do
  let(:teams) { create_list :team, 5 }
  let(:team) { create :team, name: 'Name'}
  let(:team_params) do
    {
      team: {
        name: "Name"
      }
    }
  end

  context 'GET :index' do
    before { get :index }

    it 'renders the action' do
      expect(response).to render_template(:index)
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns trust values' do
      expect(assigns(:teams)).to match_array(teams)
    end
  end

  context 'GET :show' do
    before { get :show, params: { id: team.id } }

    it 'renders the action' do
      expect(response).to render_template(:show)
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'POST :create' do
    subject { post :create, params: team_params }

    it 'saves the team' do
      expect { subject }.to change(Team, :count).by(1)
    end

    it 'redirect to project_path' do
      expect(subject).to redirect_to team_path(assigns(:team).id)
    end

    context 'with invalid params' do
      let(:team_params) do
        { team:  { name: 'N' } }
      end

      it 'does not save' do
        expect { subject }.not_to change(Team, :count)
      end

      it 'renders new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  context 'POST :update' do
    subject { put :update, params: params }
    let(:params) do
      {
        id: team.id,
        team: { name:"Title" }
      }
    end

    it 'updates team' do
      expect { subject }.to change { team.reload.name }.from("Name").to("Title")
    end

    it 'redirects to team_path' do
      expect(subject).to redirect_to team_path(assigns(:team).id)
    end

    context 'with invalid params' do
      let(:params) do
        {
          id: team.id,
          team: {
            name: "T"
          }
        }
      end

      it 'does not update' do
        expect { subject }.not_to change { team.reload.name }.from('Name')
      end

      it 'renders new template' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  context 'DELETE :delete' do
    subject { delete :destroy, params: params }

    let(:params) { { id: team.id } }

    before { team }

    it 'deletes from Team' do
      expect { subject }.to change(Team, :count).by(-1)
    end

    it 'redirects to items_path' do
      expect(subject).to redirect_to teams_path
    end
  end


end