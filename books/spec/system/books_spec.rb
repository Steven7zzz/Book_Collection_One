require 'rails_helper'

RSpec.describe 'Books', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'creates a new book and shows flash notice' do
    visit 'books/new'
  
    fill_in 'Title', with: 'Sample Title'
    fill_in 'Author', with: 'John Doe'
    fill_in 'Price', with: '19.99'
    fill_in 'Published Date', with: '2022-02-15'
  
    click_button 'Create Book'
  
    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_content('Sample Title')
    expect(page).to have_content('John Doe')
    expect(page).to have_content('19.99')
    expect(page).to have_content('2022-02-15')
  end

  it 'does not create a new book and shows flash notice for blank title' do
    visit 'books/new'

    fill_in 'Title', with: ''  # Provide a blank title
    fill_in 'Author', with: 'John Doe'
    fill_in 'Price', with: '19.99'
    fill_in 'Published Date', with: '2022-02-15'
    click_button 'Create Book'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content('Back to books')  
  end

  it 'creates a new book without author and shows flash notice' do
    visit 'books/new'
  
    fill_in 'Title', with: 'Sample Title'
    fill_in 'Author', with: ''
    fill_in 'Price', with: '19.99'
    fill_in 'Published Date', with: '2022-02-15'
  
    click_button 'Create Book'
  
    expect(page).to have_content("Author can't be blank")
  end

  it 'creates a new book without price and shows flash notice' do
    visit 'books/new'

    fill_in 'Title', with: 'Sample Title'  
    fill_in 'Author', with: 'John Doe'
    fill_in 'Price', with: ''
    fill_in 'Published Date', with: '2022-02-15'

    click_button 'Create Book'

    expect(page).to have_content("Price can't be blank")
  end

  it 'creates a new book without published date and shows flash notice' do
    visit 'books/new'
  
    fill_in 'Title', with: 'Sample Title'
    fill_in 'Author', with: 'John Doe'
    fill_in 'Price', with: '19.99'
    fill_in 'Published Date', with: ''

    click_button 'Create Book'
  
    expect(page).to have_content("Published date can't be blank")
  end
  
end
