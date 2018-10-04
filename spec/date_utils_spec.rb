require "spec_helper"
require 'date'
class Date
  include DateUtils
end

describe DateUtils do
  it '#month_end' do
    date = Date.today
    date = Date.civil(date.year, date.month, -1)
    expect(Date.today.month_end).to eq(date)
  end

  it '#month_begin' do
    date = Date.today
    date = Date.civil(date.year, date.month, 1)
    expect(Date.today.month_begin).to eq(date)
  end

  # 10/1/2018 is Monday
  it '#next_monday' do
    date = Date.civil(2018, 10, 1)
    expect(date.next_monday).to eq(date)
  end

  # 10/1/2018 is Monday
  it '#next_monday' do
    date = Date.civil(2018, 10, 1)
    expect(date.next_monday(1)).to eq(date.next_day(7))
  end

  # 10/1/2018 is Monday
  it '#prev_monday' do
    date = Date.civil(2018, 10, 1)
    expect(date.prev_monday).to eq(date)
  end

  # 10/1/2018 is Monday
  it '#prev_monday' do
    date = Date.civil(2018, 10, 1)
    expect(date.prev_monday(1)).to eq(date.prev_day(7))
  end
end
