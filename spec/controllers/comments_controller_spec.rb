require 'rails_helper'

describe CommentsController, type: :controller do
  login_user

  let(:project) { create :project }
  let(:comments) { create_list :comment, 5 }
  let(:comment) { create :comment}
  let(:comment_params) do
    {
      project_id: project.id,
      comment: {
        body: Faker::Hipster.sentence
      }
    }
  end

  context 'POST :create' do
    subject { post :create, params: comment_params }
    let!(:current_user) { create(:user) }

    it 'saves the project' do
      expect { subject }.to change(Comment, :count).by(1)
    end
  end

  context 'DELETE :delete' do
    subject { delete :destroy, params: params }

    let(:params) { { id: comment.id } }

    before { comment }

    it 'deletes from Comments' do
      expect { subject }.to change(Comment, :count).by(-1)
    end
  end
end
