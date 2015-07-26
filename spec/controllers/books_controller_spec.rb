require 'rails_helper'

RSpec.describe BooksController do

  login_user_admin

  describe "GET #index" do
    before { get :index }

    it 'assigns a new Book to @book' do
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "POST #create" do
    let(:category) { FactoryGirl.create(:category) }
    let(:book_params) do
      {
        book: {
          title: 'Conhecendo Ruby',
          author: 'Eustáquio',
          category_id: category.id,
          description: 'Livro ruby iniciante'
        }
      }
    end

    context 'with valid params' do
      it 'save a book' do
        expect {post :create, book_params}.to change { Book.count }.by(1)
      end
      it 'redirect to book index' do
        post :create, book_params
        expect(response).to redirect_to(books_path)
      end
    end

    context 'with invalid params' do
      it 'render index teamplate' do
        book_params[:book].merge!(title: '')
        post :create, book_params
        expect(response).to render_template(:index)
      end
    end
  end

  describe "GET #edit" do
    let(:edit_book) { FactoryGirl.create(:book) }

    it 'assigns edit_book to @book' do
      get :edit, id: edit_book.id
      expect(assigns(:book)).to eq(edit_book)
    end

  end

  describe "PUT #update " do

    let(:edit_book) { FactoryGirl.create(:book) }

    let(:book_params) do
      { author: 'Viny baggio' }
    end

    let(:params) do
      {
        id: edit_book.id,
        book: book_params
      }
    end

    before do
      allow(Book).to receive(:find).and_return(edit_book)
    end

    context 'with valid params' do
      it 'update author field' do
        expect { put :update, params }.to change(edit_book, :author)
      end

      it 'redirect to book index' do
        put :update, params
        expect(response).to redirect_to(books_path)
      end
    end

    context 'with invalid params' do
      it 'render edit template' do
        params[:book].merge!(author: '')
        put :update, params
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:remove_book) { FactoryGirl.create(:book) }

    it "remove book" do
      delete :destroy, id: remove_book.id
      expect(Book.where(id: remove_book.id)).to be_empty
    end
  end
end
