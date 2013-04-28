require 'spec_helper'
require 'pp'

describe MoviesController do
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
   
#    it 'should include rating and year' do
#     movie = FactoryGirl.build(:movie, :title => 'Milk')
#     # etc.
#    end
   it 'should render the similar directors template' do
     @source_movie.stub(:director).and_return("Chris Nolan")
     get 'similar', {:id => 2}
     response.should render_template('similar')
   end
   it "should redirect the user to the homepage if the director is nil" do
     @source_movie.stub(:director).and_return(nil)
     @source_movie.stub(:title).and_return("movie title")
     #pp james
     #source_director = mock(source_director)
     #source_director.stub!(:director) {nil}
     get 'similar', {:id => 2}   
       response.should be_redirect
   end
   
   it 'should return a @movie variable that contains all movies by the director of the movie with the id that was passed to the similar action.' do
     Movie.stub(:similar_dir) { 1 }
     get :similar , {:id => 1}
     #Movie.should_receive(:similar_dir).with(2)
     assigns.(@movies).should == 1
     #Movie.similiar_dir(2).
     #expect(response).to eq(@fake_results)
   end
   it 'should direct the user to the home page and only dispaying movies with the director from the previous show page.'
 end
end
