
require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new book and shows flash notice' do
        expect {
          post :create, params: { book: { title: 'Sample Title' } }
        }.to change(Book, :count).by(1)

        expect(response).to redirect_to(book_path(assigns(:book)))
        expect(flash[:notice]).to eq('Book was successfully created.')
      end
    end
  end
end
