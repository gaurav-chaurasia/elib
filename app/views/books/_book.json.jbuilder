json.extract! book, :id, :title, :description, :auther, :quantity, :isbn, :created_at, :updated_at
json.url book_url(book, format: :json)
