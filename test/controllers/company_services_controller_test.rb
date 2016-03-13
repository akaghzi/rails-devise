require 'test_helper'

class CompanyServicesControllerTest < ActionController::TestCase
  setup do
    @company_service = company_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_service" do
    assert_difference('CompanyService.count') do
      post :create, company_service: { company_id: @company_service.company_id, description: @company_service.description, service_id: @company_service.service_id }
    end

    assert_redirected_to company_service_path(assigns(:company_service))
  end

  test "should show company_service" do
    get :show, id: @company_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_service
    assert_response :success
  end

  test "should update company_service" do
    patch :update, id: @company_service, company_service: { company_id: @company_service.company_id, description: @company_service.description, service_id: @company_service.service_id }
    assert_redirected_to company_service_path(assigns(:company_service))
  end

  test "should destroy company_service" do
    assert_difference('CompanyService.count', -1) do
      delete :destroy, id: @company_service
    end

    assert_redirected_to company_services_path
  end
end
