
require 'test_helper'
require 'test/unit'
require 'mates'

class testUnit < ActionController::TestCase

test "validar_usuario" do
    username = @tagsArreglo["data"][0]["username"]
    assert_equal(username, 'Ricardo')
end


test "should get index" do
   
    get :index
    assert_response :success
end


test "prueba_fallida" do
    assert false
end


test "error400" do
    post :tags #sin params
    assert_response 400
  
end

test "suma" do
    assert_equal 4, Mates.run("2+2")
    assert_equal 4, Mates.run("1+3")
    assert_equal 5, Mates.run("5+0")
    assert_equal 0, Mates.run("-5 + 5")
end

#Probar Método Request Web
test "requestWeb return content or false" do
	#Retorna False cuando el llamado es erroneo. Con método incorrecto
	assert_equal false, @controller.send(:requestWeb, 'POST', 'http://google.com'), "No recibe POST"
	#Retorna False cuando el llamado es erroneo. Con URL NO Json
	assert_equal false, @controller.send(:requestWeb, 'GET', 'http://google.com'), "No recibe POST"
	#Retorna Json Content cuando los parámetros están correctos.
	assert_not_equal false,  @controller.send(:requestWeb, 'GET', 'https://api.instagram.com/v1/tags/piscina?access_token=2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402')
end

end