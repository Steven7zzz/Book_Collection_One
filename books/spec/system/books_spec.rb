require 'rails_helper'

RSpec.describe 'Books', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'creates a new book and shows flash notice' do
    visit 'books/new'

    fill_in 'Title', with: 'Sample Title'
    click_button 'Create Book'

    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_content('Sample Title') 
  end

  it 'does not create a new book and shows flash notice for blank title' do
    visit 'books/new'

    fill_in 'Title', with: ''  # Provide a blank title
    click_button 'Create Book'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content('Back to books')  
  end
end
