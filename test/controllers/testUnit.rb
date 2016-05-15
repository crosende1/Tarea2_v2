
require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase

def test "validar_usuario" do
    username = @tagsArreglo["data"][0]["username"]
    assert_equal(username, 'Ricardo')
end

def test "error400" do
    username = @tagsArreglo["data"][0]["username"]
    assert_equal(username, 'Ricardo')
end

end