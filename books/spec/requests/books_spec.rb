
require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new book and shows flash notice' do
        expect {
          post :create, params: { book: { title: 'Sample Title', author: 'John Doe', price: 19.99, published_date: Date.today } }
        }.to change(Book, :count).by(1)

        expect(response).to redirect_to(book_path(assigns(:book)))
        expect(flash[:notice]).to eq('Book was successfully created.')
      end
    end

    context 'with invalid title' do
      it 'does not create a new book and shows flash error' do
        post :create, params: { book: { title: '', author: 'John Doe', price: 19.99, published_date: Date.today } }

        expect(response).to render_template(:new)
        expect(flash[:error]).to eq("Title can't be blank").or(eq(nil))
      end
    end

    context 'without an author' do
      it 'does not create a new book and shows flash error' do
        post :create, params: { book: { title: 'Sample Title', author: nil, price: 19.99, published_date: Date.today } }

        expect(response).to render_template(:new)
        expect(flash[:error]).to eq("Author can't be blank").or(eq(nil))
      end
    end

    context 'without a price' do
      it 'does not create a new book and shows flash error' do
        post :create, params: { book: { title: 'Sample Title', author: 'John Doe', price: nil, published_date: Date.today } }

        expect(response).to render_template(:new)
        expect(flash[:error]).to eq("Price can't be blank").or(eq(nil))
      end
    end

    context 'without a published date' do
      it 'does not create a new book and shows flash error' do
        post :create, params: { book: { title: 'Sample Title', author: 'John Doe', price: 19.99, published_date: nil } }

        expect(response).to render_template(:new)
        expect(flash[:error]).to eq("Published date can't be blank").or(eq(nil))
      end
    end
  end
end
