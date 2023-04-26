json.extract! movie, :id, :title, :release_year, :synopsis, :origin_country, :length, :director, :genre, :created_at, :updated_at
json.url movie_url(movie, format: :json)
