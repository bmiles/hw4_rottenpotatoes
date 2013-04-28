require 'spec_helper'
require 'debugger'

describe MoviesController do
  describe "show movies" do
    it 'should call the show action when following a more details link' do
      #Movie = mock("Movie", :id => 6)
      Movie.stub(:find).with("6") {["Array"]}
      #debugger
      
      get 'show', {:id => 6}
      response.should be_success
      end
    end
  describe "find movies with the same director" do
   it 'similar page should have a RESTful route' do
     { :get => "/movies/1/similar"}.
       should route_to(:controller => "movies", :action => "similar", :id => "1")
   end
      
   it 'it should call similar' do
     @source_movie.stub!(:director).and_return("Nolan")
     get 'similar', {:id => 1}
     response.should be_success
   end
     
   
   it 'should pass the id of current movie to the :source_movie key in params when the user clicks the link' do
   pending
   end
   
   it 'should render the similar directors template' do
     @source_movie.stub(:director).and_return("Chris Nolan")
     get 'similar', {:id => 2}
     response.should render_template('similar')
   end
   it "should redirect the user to the homepage if the director is nil" do
     @source_movie.stub(:director).and_return(nil)
     @source_movie.stub(:title).and_return("movie title")
     get 'similar', {:id => 2}   
       response.should be_redirect
   end
   
   it 'should return a @movies variable that contains all movies by the director of the movie with the id that was passed to the similar action.' do
     @source_movie.stub(:director).and_return("Chris Nolan")
     get 'similar', {:id => 99}
     assigns(:similar).should == @movies
   end
 end
end
