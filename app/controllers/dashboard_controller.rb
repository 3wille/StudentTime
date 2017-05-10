class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @week_sum = entry_sum(week_entries)
    @month_sum = entry_sum(month_entries)
  end

  private

  def week_entries
    current_user.time_entries.where(
      date: Date.today.at_beginning_of_week..Date.today.at_end_of_week
    )
  end

  def month_entries
    current_user.time_entries.where(
      date: Date.today.at_beginning_of_month..Date.today.at_end_of_month
    )
  end

  def entry_sum(entries)
    entries.reduce(0) do |time_sum, entry|
      time_sum + entry.length
    end
  end
end
