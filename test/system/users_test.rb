require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address 1", with: @user.address_1
    fill_in "Address 2", with: @user.address_2
    fill_in "Cuit", with: @user.cuit
    fill_in "Dni", with: @user.dni
    fill_in "First Name", with: @user.first_name
    fill_in "Last Name", with: @user.last_name
    fill_in "Mobile Number", with: @user.mobile_number
    fill_in "Phone Number", with: @user.phone_number
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address 1", with: @user.address_1
    fill_in "Address 2", with: @user.address_2
    fill_in "Cuit", with: @user.cuit
    fill_in "Dni", with: @user.dni
    fill_in "First Name", with: @user.first_name
    fill_in "Last Name", with: @user.last_name
    fill_in "Mobile Number", with: @user.mobile_number
    fill_in "Phone Number", with: @user.phone_number
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
