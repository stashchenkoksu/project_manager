require 'rails_helper'

describe CommentsController, type: :controller do
  login_user

  context 'POST :create' do
    subject { post :create, params: comment_params }
    let!(:current_user) { create(:user) }

    context 'when comment project' do
      let(:project) { create :project }
      let(:comment_params) do
        {
          project_id: project.id,
          comment: {
            body: Faker::Hipster.sentence
          }
        }
      end

      it 'saves the project' do
        expect { subject }.to change(Comment, :count).by(1)
      end

      it 'redirects to the new comment' do
        expect(subject).to redirect_to project_path(assigns(:comment).commentable_id)
      end

      it 'returns 302' do
        expect(subject).to have_http_status(302)
      end

      it 'response returns 200 OK' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when comment comment' do
      let!(:comment) { create :comment}
      let(:comment_params) do
        {
          comment_id: comment.id,
          comment: {
            body: Faker::Hipster.sentence
          }
        }
      end

      it 'saves the comment' do
        expect { subject }.to change(Comment, :count).by(1)
      end

      it 'redirects to the new comment' do
        expect(subject).to redirect_to root_path
      end

      it 'returns 200 OK' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when comment task' do
      let(:task) { create :task }
      let(:comment_params) do
        {
          task_id: task.id,
          comment: {
            body: Faker::Hipster.sentence
          }
        }
      end

      it 'saves the project' do
        expect { subject }.to change(Comment, :count).by(1)
      end

      it 'redirects to the new comment' do
        expect(subject).to redirect_to task_path(assigns(:comment).commentable_id)
      end

      it 'returns 302' do
        expect(subject).to have_http_status(302)
      end

      it 'response returns 200 OK' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'DELETE :delete' do
    let(:comment) { create :comment}
    subject { delete :destroy, params: params }

    let(:params) { { id: comment.id } }

    before { comment }

    it 'deletes from Comments' do
      expect { subject }.to change(Comment, :count).by(-1)
    end
  end
end
