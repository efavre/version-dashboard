require 'test_helper'

class DeploysControllerTest < ActionController::TestCase

  test "post proper deploy should create deploy" do
    deploy = deploys(:app1prod1)
    post :create, deploy: {application: deploy.application, environment: deploy.environment, version: deploy.version}
    assert_response :success
  end

  test "post improper deploy should not create deploy" do
    deploy = deploys(:app1prod1)
    post :create, deploy: {application: deploy.application, environment: deploy.environment}
    assert_response 400
  end

  test "get index should return one deploy" do
    
  end

end
