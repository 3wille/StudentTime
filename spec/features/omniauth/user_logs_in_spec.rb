require "rails_helper"

feature "access top page" do
  scenario "can sign in user with Twitter account" do
    visit '/'

    expect(page).to have_content("Login")

    mock_auth_hash
    click_link "Login"

    expect(page).to have_content "Logout"
  end

  scenario "can handle authentication error" do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    visit '/'

    expect(page).to have_content("Login")

    click_link "Login"

    expect(page).to have_content('Authentication failed.')
  end
end
