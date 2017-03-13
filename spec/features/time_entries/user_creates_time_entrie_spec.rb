require "rails_helper"

feature "User creates a Time Entry" do
  scenario "enters both date and length" do
    user = create(:user)
    login_as(user)
    visit new_time_entry_path

    fill_in "Length", with: "12"
    fill_in "Date", with: "23 November, 2016"
    expect { click_button "Create Time entry" }.
      to change(TimeEntry, :count).from(0).to(1)

    expect(page).to have_content "Time entry was successfully created."
  end
end
