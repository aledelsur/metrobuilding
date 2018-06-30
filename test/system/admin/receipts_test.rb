require "application_system_test_case"

class Admin::ReceiptsTest < ApplicationSystemTestCase
  setup do
    @admin_receipt = admin_receipts(:one)
  end

  test "visiting the index" do
    visit admin_receipts_url
    assert_selector "h1", text: "Admin/Receipts"
  end

  test "creating a Receipt" do
    visit admin_receipts_url
    click_on "New Admin/Receipt"

    fill_in "Note", with: @admin_receipt.note
    fill_in "User", with: @admin_receipt.user_id
    fill_in "Value", with: @admin_receipt.value
    click_on "Create Receipt"

    assert_text "Receipt was successfully created"
    click_on "Back"
  end

  test "updating a Receipt" do
    visit admin_receipts_url
    click_on "Edit", match: :first

    fill_in "Note", with: @admin_receipt.note
    fill_in "User", with: @admin_receipt.user_id
    fill_in "Value", with: @admin_receipt.value
    click_on "Update Receipt"

    assert_text "Receipt was successfully updated"
    click_on "Back"
  end

  test "destroying a Receipt" do
    visit admin_receipts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receipt was successfully destroyed"
  end
end
