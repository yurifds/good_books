require 'rails_helper'

RSpec.describe BooksController do
  login_user_admin

  describe "GET #index" do

    before { get :index }

    it 'assigns a new Book to @book' do
      expect(assigns(:book)).to be_a_new(Book)
    end

  end

end
