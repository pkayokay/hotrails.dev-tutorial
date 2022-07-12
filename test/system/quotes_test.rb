require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  test "Creating a new quote" do
    visits quotes_path
    assert_selector "h1", text: "Quotes"

    click on "New quote"
    assert_selector "h1", text: "New quote"

    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
end
