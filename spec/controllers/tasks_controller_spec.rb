require 'rails_helper'

describe TasksController, type: :controller do
  let(:project) {create :project}
  let(:tasks) { create_list :task, 5, project: project }
  let(:task) { create :task, title: 'Name', project: project}
  let(:task_params) do
    {
      project_id: project.id,
      task: {
        title: 'Name',
        content: Faker::Lorem.sentence(word_count: 20),
        start_date: Date.new(2015, 0o5, 23),
        due_date: Date.new(2016, 0o5, 23),
        status: 'begin'

      }
    }
  end

  context 'GET :index' do
    before { get :index, params: { project_id: project.id } }

    it 'renders the action' do
      expect(response).to render_template(:index)
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns trust values' do
      expect(assigns(:tasks)).to match_array(tasks)
    end
  end

  context 'GET :show' do
    before { get :show, params: { id: task.id, project_id: project.id } }

    it 'renders the action' do
      expect(response).to render_template(:show)
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'POST :create' do
    subject { post :create, params: task_params}

    it 'saves the task' do
      expect { subject }.to change(Task, :count).by(1)
    end

    it 'redirect to task_path' do
      expect(subject).to redirect_to task_path(assigns(:task).id)
    end

    context 'with invalid params' do
      let(:task_params) do
        { project_id: project.id,
          task: { title: 'Name' } }
      end

      it 'does not save' do
        expect { subject }.not_to change(Task, :count)
      end

      it 'renders new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  context 'POST :update' do
    subject { put :update, params: params }
    let(:params) do
      { project_id: project.id,
        id: task.id,
        task: { title: 'Title' } }
    end

    it 'updates project' do
      expect { subject }.to change { task.reload.title }.from('Name').to('Title')
    end

    it 'redirects to items_path' do
      expect(subject).to redirect_to task_path(assigns(:task).id)
    end

    context 'with invalid params' do
      let(:params) do
        {
          project_id: project.id,
          id: task.id,
          task: {
            title: 'Title',
            content: 'lol'
          }
        }
      end

      it 'does not update' do
        expect { subject }.not_to change { task.reload.title }.from('Name')
      end

      it 'renders new template' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  context 'DELETE :delete' do
    subject { delete :destroy, params: params }

    let(:params) { { id: task.id, project_id: project.id } }

    before { task }

    it 'deletes from Project' do
      expect { subject }.to change(Task, :count).by(-1)
    end

    it 'redirects to items_path' do
      expect(subject).to redirect_to project_tasks_path(project_id: project.id)
    end
  end
end
