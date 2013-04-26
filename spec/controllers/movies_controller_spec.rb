require 'spec_helper'

describe MoviesController do
  describe "find movies with the same director" do
   it 'should have a RESTful route' do
    pending("result.should match(/regex/)")
   end
   
   it 'it should call find_similar' do
     @fake_results = [mock('movie1'), mock('movie2')]
     Movie.should_receive(:similar_dir).with(2).
       and_return(@fake_results)
     get :find_similar, {:id => 2}
   end
   
   it 'should pass the id of current movie to the :source_movie key in params when the user clicks the link' do
   pending
   end
   
   it 'should render the similar directors template' do
     Movie = mock("Movie")
     Movie.stub(:similar_dir) {@fake_results}
     get :find_similar, {:id => 2}
     response.should render_template('find_similar')
   end
   
   it 'The @movie variable should contain only movies by a certain director.'
   it 'should direct the user to the home page and only dispaying movies with the director from the previous show page.'
 end
end
