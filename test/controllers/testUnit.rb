
require 'test_helper'
require 'test/unit'
require 'mates'

class testUnit < ActionController::TestCase

test "validar_usuario" do
    username = @tagsArreglo["data"][0]["username"]
    assert_equal(username, 'Ricardo')
end

test "error400" do
    get :httppartymetodo, access_token: "cata" 
    assert true

end

test "prueba_fallida" do
    assert false
end

test "suma" do
    assert_equal 4, Mates.run("2+2")
    assert_equal 4, Mates.run("1+3")
    assert_equal 5, Mates.run("5+0")
    assert_equal 0, Mates.run("-5 + 5")
end



end