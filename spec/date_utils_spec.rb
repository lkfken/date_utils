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

  end
end
