require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase

  test "tenemos información" do
    post :parametros, {'tag' => 'chile', 'access_token' => '2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'}
    assert_response :success
  end

  test "deberíamos retornar bad request error" do
    post :parametros, {'tag' => 'chile'}
    assert_response :bad_request
  end

  #test "retornariamos json desde instagram URL" do
   # controller = ApplicationController.new
  #  uri = 'https://api.instagram.com/v1/tags/chile'
   # access_token = "2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402"
  #  uri2 = 'https://api.instagram.com/v1/tags/chile/media/recent?access_token='+ access_token.to_s
  #  result_data = {"meta"=> {"code"=> 200}, "data"=> {"media_count"=> 0, "name"=> "chile"}}
   # assert_equal(result_data, controller.get(uri2))
 # end

  

  
end