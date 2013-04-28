# in spec/factories/movie.rb
FactoryGirl.define do
  factory :movie do
    id 99
    title 'A Fake Title' # default values
    rating 'PG'
    director 'Chris Nolan'
    release_date { 10.years.ago }
  end
end