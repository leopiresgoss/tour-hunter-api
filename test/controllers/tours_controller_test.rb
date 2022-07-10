require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:one)
  end

  test 'should get index' do
    get tours_url, as: :json
    assert_response :success
  end

  test 'should create tour' do
    assert_difference('Tour.count') do
      post tours_url, params: { tour: {} }, as: :json
    end

    assert_response :created
  end

  test 'should show tour' do
    get tour_url(@tour), as: :json
    assert_response :success
  end

  test 'should update tour' do
    patch tour_url(@tour), params: { tour: {} }, as: :json
    assert_response :success
  end

  test 'should destroy tour' do
    assert_difference('Tour.count', -1) do
      delete tour_url(@tour), as: :json
    end

    assert_response :no_content
  end
end
