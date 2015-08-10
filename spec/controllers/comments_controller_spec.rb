require 'rails_helper'

RSpec.describe CommentsController do

  login_user_admin

  describe "POST #create" do
    let(:book) { FactoryGirl.create(:book) }
    context 'with valid params' do
      let(:comment_params) do
        {
          comment: {
            body: 'First comment test!'
          },
          book_id: book.id
        }
      end

      it 'create comment' do
        expect { xhr :post, :create, comment_params }.to change { Comment.count }.by(1)
      end
    end

    context 'with invalid params' do
      let(:comment_params) do
        {
          comment: {
            body: ''
          },
          book_id: book.id
        }
      end

      it 'with body empty' do
        expect { xhr :post, :create, comment_params }.to change { Comment.count }.by(0)
      end
    end
  end

  describe "POST #create_reply" do

    context 'with valid params' do

      it 'create reply' do

      end

    end
  end


end
