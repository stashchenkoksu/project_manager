require 'rails_helper'

describe ProjectsController, type: :controller do
  let(:projects) { create_list :project, 5 }
  let(:project) { create :project, name: 'Name'}
  let(:project_params) do
    {
      project: {
        name: 'Name',
        summary: Faker::Lorem.sentence(word_count: 20),
        start_date: Date.new(2015, 0o5, 23),
        end_date: Date.new(2016, 0o5, 23)
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
      expect(assigns(:projects)).to match_array(projects)
    end
  end

  context 'GET :show' do
    before { get :show, params: { id: project.id } }

    it 'renders the action' do
      expect(response).to render_template(:show)
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'POST :create' do
    subject { post :create, params: project_params }

    it 'saves the project' do
      expect { subject }.to change(Project, :count).by(1)
    end

    it 'redirect to project_path' do
      expect(subject).to redirect_to project_path(assigns(:project).id)
    end

    context 'with invalid params' do
      let(:project_params) do
        { project: { name: 'Name' } }
      end

      it 'does not save' do
        expect { subject }.not_to change(Project, :count)
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
        id: project.id,
        project: { name: 'Title' }
      }
    end

    it 'updates project' do
      expect { subject }.to change { project.reload.name }.from('Name').to('Title')
    end

    it 'redirects to items_path' do
      expect(subject).to redirect_to project_path(assigns(:project).id)
    end

    context 'with invalid params' do
      let(:params) do
        {
          id: project.id,
          project: {
            name: 'Title',
            summary: 'lol'
          }
        }
      end

      it 'does not update' do
        expect { subject }.not_to change { project.reload.name }.from('Name')
      end

      it 'renders new template' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  context 'DELETE :delete' do
    subject { delete :destroy, params: params }

    let(:params) { { id: project.id } }

    before { project }

    it 'deletes from Project' do
      expect { subject }.to change(Project, :count).by(-1)
    end

    it 'redirects to items_path' do
      expect(subject).to redirect_to projects_path
    end
  end
end
