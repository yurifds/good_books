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
    let(:book) { FactoryGirl.create(:book) }
    let(:root_comment) { FactoryGirl.create(:comment, commentable_id: book.id) }

    context 'with valid params' do

      let(:comment_params) do
        {
          comment: {
            body: 'First comment test!'
          },
          book_id: book.id,
          id: root_comment.id
        }
      end

      it 'create reply' do
        expect { xhr :post, :create_reply, comment_params }.to change { Comment.count }.by(2)
      end
    end

    context 'with invalid params' do
      let(:comment_params) do
        {
          comment: {
            body: ''
          },
          book_id: book.id,
          id: root_comment.id
        }
      end

      it 'create reply' do
        expect { xhr :post, :create_reply, comment_params }.to change { Comment.count }.by(1)
      end
    end
  end

  describe 'PUT #update' do
    let(:book) { FactoryGirl.create(:book) }
    let(:edit_comment) { FactoryGirl.create(:comment, commentable_id: book.id) }

    let(:comment_params) do
      {
        comment: {
          body: 'test'
        },
        book_id: book.id,
        id: edit_comment.id
      }
    end

    before do
      allow(Book).to receive(:find).and_return(book)
      allow(book).to receive_message_chain(:comment_threads, :find).and_return(edit_comment)
    end

    it 'update comment' do
      expect { xhr :put, :update, comment_params }.to change(edit_comment, :body)
    end
  end

  describe 'DELETE #destroy' do
    let(:book) { FactoryGirl.create(:book) }
    let(:destroy_comment) { FactoryGirl.create(:comment, commentable_id: book.id) }

    let(:url_params) do
      {
        book_id: book.id,
        id: destroy_comment.id
      }
    end

    it 'test' do
      xhr :delete, :destroy, url_params
      expect(Comment.where(id: destroy_comment.id)).to be_empty
    end
  end

  describe 'POST #like' do
    let(:book) { FactoryGirl.create(:book) }
    let(:comment) { FactoryGirl.create(:comment, commentable_id: book.id) }

    before do
      allow(Comment).to receive(:find).and_return(comment)
    end

    let(:url_params) do
      {
        id: comment.id
      }
    end

    it 'like comment' do
      xhr :post, :like, url_params
      expect(subject.current_user.voted_up_on? comment).to eql(true)
    end

    it 'unlike comment' do
      xhr :post, :like, url_params
      xhr :post, :like, url_params #unlike
      expect(subject.current_user.voted_up_on? comment).to eql(false)
    end
  end

end
