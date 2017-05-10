require "rails_helper"

feature "User visits their dashboard" do
  scenario "sees their work time in the current week" do
      user = create(:user)
      create(:time_entry, user: user, length: 4)
      login_as(user)
      visit dashboard_path

      expect(page).to have_content("4/20")
  end
end
