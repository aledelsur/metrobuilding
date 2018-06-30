require 'test_helper'

class Admin::ReceiptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_receipt = admin_receipts(:one)
  end

  test "should get index" do
    get admin_receipts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_receipt_url
    assert_response :success
  end

  test "should create admin_receipt" do
    assert_difference('Admin::Receipt.count') do
      post admin_receipts_url, params: { admin_receipt: { note: @admin_receipt.note, user_id: @admin_receipt.user_id, value: @admin_receipt.value } }
    end

    assert_redirected_to admin_receipt_url(Admin::Receipt.last)
  end

  test "should show admin_receipt" do
    get admin_receipt_url(@admin_receipt)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_receipt_url(@admin_receipt)
    assert_response :success
  end

  test "should update admin_receipt" do
    patch admin_receipt_url(@admin_receipt), params: { admin_receipt: { note: @admin_receipt.note, user_id: @admin_receipt.user_id, value: @admin_receipt.value } }
    assert_redirected_to admin_receipt_url(@admin_receipt)
  end

  test "should destroy admin_receipt" do
    assert_difference('Admin::Receipt.count', -1) do
      delete admin_receipt_url(@admin_receipt)
    end

    assert_redirected_to admin_receipts_url
  end
end
