require 'rails_helper'

RSpec.describe "Movies", type: :request do
  before do
    Movie.create(title: 'Finding Nemo', overview: 'A timid clownfish sets out on a journey to bring his son home.', director: 'Andrew Stanton')
    Movie.create(title: 'Godzilla vs. Kong', overview: 'The fearsome Godzilla and the mighty Kong--with humanity caught in the balance.', director: 'Adam Wingard')
  end

  describe "GET /movies" do
    it "returns an array of all movies" do
      # act
      get "/movies"

      # assert
      expect(response.body).to include_json([
        { id: a_kind_of(Integer), title: 'Finding Nemo', overview: 'A timid clownfish sets out on a journey to bring his son home.', director: 'Andrew Stanton' },
        { id: a_kind_of(Integer), title: 'Godzilla vs. Kong', overview: 'The fearsome Godzilla and the mighty Kong--with humanity caught in the balance.', director: 'Adam Wingard' }
      ])
    end
  end

  describe "POST /movies" do
    let!(:movie_params) { { title: 'The Ring', overview: 'A journalist must investigate a mysterious videotape which seems to cause the death of anyone one week to the day after they view it.', director: 'Gore Verbinski' } }

    

    it 'returns the movie data' do
      post '/movies', params: movie_params

      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        title: 'The Ring',
        overview: 'A journalist must investigate a mysterious videotape which seems to cause the death of anyone one week to the day after they view it.', 
        director: 'Gore Verbinski'
      })
    end

    it 'returns a status code of 201 (created)' do
      post '/movies', params: movie_params

      expect(response).to have_http_status(:created)
    end
  end
end
