require 'coveralls'
require 'test_helper'
require 'test/unit'

class testUnit < ActionController::TestCase


test "DameUnindex" do
   
    get :index
    assert_response :success
end


test "error400" do
    post :tags 
    assert_response 400
  
end

test "cuentaFotos" do

    @tags_stats = HTTParty.get('https://api.instagram.com/v1/tags/cata/media/recent?access_token=291574189.1fb234f.7f6b4bb75bf94a8faf8e38818530beae&count=20')
    assert_equal 20, @tags_stats["data"].length
end


test "postoGetoFalso" do

    assert_equal false, @controller.send(:requestWeb, 'GET', 'http://facebook.com'), "GET incorrecto"
	assert_equal false, @controller.send(:requestWeb, 'POST', 'http://facebook.com'), "POST incorrecto"
	assert_not_equal false,  @controller.send(:requestWeb, 'POST', 'https://api.instagram.com/v1/tags/cata?access_token=291574189.1fb234f.7f6b4bb75bf94a8faf8e38818530beae')
end

end