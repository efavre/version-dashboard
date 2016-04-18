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

  test "get index should return unique deploy" do
    deploy = deploys(:app1prod2)
    get :index
    assert_response 200
    assert response.body.include? deploy.application
    assert response.body.include? deploy.environment
    assert response.body.include? deploy.version
  end

  test "get index should return 2 applications deploys" do
    deploy = deploys(:app1prod2)
    deploy2 = deploys(:app2prod2)
    get :index
    assert_response 200
    assert response.body.include? deploy.application
    assert response.body.include? deploy.environment
    assert(response.body.include?(deploy.version), response.body)
    assert response.body.include? deploy2.application
    assert response.body.include? deploy2.environment
    assert(response.body.include?(deploy2.version), response.body)
  end

  test "get index should return latest deploy" do
    deploy = deploys(:app1prod1)
    deploy2 = deploys(:app1prod2)
    get :index
    assert_response 200
    assert response.body.include? deploy.application
    assert response.body.include? deploy.environment
    assert response.body.include? deploy2.version
    assert ! response.body.include?(deploy.version)
  end

  test "get index should return newly created deploy" do
    deploy = deploys(:app1prod1)
    deploy2 = deploys(:app1prod2)
    deploy3 = Deploy.create(application: deploy.application, environment: deploy.environment, version: "10.10.10")
    get :index
    assert_response 200
    assert response.body.include? deploy.application
    assert response.body.include? deploy.environment
    assert response.body.include? deploy3.version
    assert(! response.body.include?(deploy.version), response.body)
    assert ! response.body.include?(deploy2.version)
  end
end
