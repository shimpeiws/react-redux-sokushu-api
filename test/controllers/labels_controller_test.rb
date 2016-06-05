require 'test_helper'

class LabelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @label = labels(:one)
  end

  test "should get index" do
    get labels_url
    assert_response :success
  end

  test "should create label" do
    assert_difference('Label.count') do
      post labels_url, params: { label: { color_code: @label.color_code, name: @label.name } }
    end

    assert_response 201
  end

  test "should show label" do
    get label_url(@label)
    assert_response :success
  end

  test "should update label" do
    patch label_url(@label), params: { label: { color_code: @label.color_code, name: @label.name } }
    assert_response 200
  end

  test "should destroy label" do
    assert_difference('Label.count', -1) do
      delete label_url(@label)
    end

    assert_response 204
  end
end
