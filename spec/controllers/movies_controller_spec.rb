require 'spec_helper'

describe MoviesController do
  describe "find movies with the same director" do
   it 'similar page should have a RESTful route' do
     { :get => "/movies/1/similar"}.
       should route_to(:controller => "movies", :action => "similar", :id => "1")
   end
      
   it 'it should call similar' do
     #Movie.should_receive(:find_all_by_director).with(@source_director).
     #response.should be_
     source_movie = mock("movie")
     source_movie.stub(:director) { "Nolan" }
     get :similar, {:id => 2}
     assigns(:similar).should == @movies
     #get :similar, {:id => 2}
   end
   
   it 'should pass the id of current movie to the :source_movie key in params when the user clicks the link' do
   pending
   end
   
   it 'should render the similar directors template' do
     Movie = mock("movie")
     Movie.stub(:similar_dir) {@fake_results}
     get :similar, {:id => 2}
     response.should render_template('similar')
   end
   it "should redirect the user to the homepage is the director is nil" do
     source_director = mock(source_director)
     source_director.stub(:director) {nil}
     { :get => "/movies/1/similar" }     
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
