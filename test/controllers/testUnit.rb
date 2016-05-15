
require 'test_helper'
require 'test/unit'
require 'mates'

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

end


#borrar
test "suma" do
    assert_equal 4, Mates.run("2+2")
    assert_equal 4, Mates.run("1+3")
    assert_equal 5, Mates.run("5+0")
    assert_equal 0, Mates.run("-5 + 5")
end


test "postoGetoFalso" do

    assert_equal false, @controller.send(:requestWeb, 'GET', 'http://facebook.com'), "GET incorrecto"
	assert_equal false, @controller.send(:requestWeb, 'POST', 'http://facebook.com'), "POST incorrecto"
	assert_not_equal false,  @controller.send(:requestWeb, 'POST', 'https://api.instagram.com/v1/tags/cata?access_token=291574189.1fb234f.7f6b4bb75bf94a8faf8e38818530beae')
end

end