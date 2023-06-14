# spec/requests/books/index_spec.rb

RSpec.describe "GET /books", type: :request do
  let(:books) { app["persistence.rom"].relations[:books] }

  before do
    10.times do |n|
      books.insert(title: "Book #{n}", author: "Author #{n}")
    end
  end

  it "returns a list of books" do
    get "/books?page1&per_page=3"

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq("application/json; charset=utf-8")

    expect(JSON.parse(last_response.body)).to eq([
      { "title" => "Book 0", "author" => "Author 0" },
      { "title" => "Book 1", "author" => "Author 1" },
      { "title" => "Book 2", "author" => "Author 2" }
    ])
  end

  context 'when invalid page and per_page params are given' do
    it 'returns 422 unprocessable response' do
      get '/books?page=-1&per_page=300'

      expect(last_response).to be_unprocessable

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        "errors" => {
          "page" => ["must be greater than 0"],
          "per_page" => ["must be less than or equal to 100"]
        }
      )
    end
  end
end
