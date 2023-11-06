# frozen_string_literal: true

require 'date_utils/version'

# no comment
module DateUtils
  def months_in_between(date1, date2)
    (date2.year - date1.year) * 12 + date2.month - date1.month - (date2.day >= date1.day ? 0 : 1)
  end

  def day_in_sec
    24 * 60 * 60
  end

  def beginning_of_the_week(year:, month:, wday:, day: 1, hour: 8, min: 0, sec: 0, timezone: '-08:00')
    time = Time.new(year, month, day, hour, min, sec, timezone)
    time -= (time.wday - wday) * day_in_sec # Sunday is 0

    # if the date is falling into the previous month, add 7 days to it.
    time += 7 * day_in_sec until time.year == year && time.month == month

    time
  end

  def month_end
    Date.civil(year, month, -1)
  end

  def month_begin
    Date.civil(year, month, 1)
  end

  def year_begin
    Date.civil(year, 1, 1)
  end

  def year_end
    year_begin.next_year.prev_day
  end

  def next_monday(n = 0)
    raise ArgumentError, 'Cannot be less than zero' if n.negative?

    start_date = dup
    if n > 0
      advance = 7 * n
      start_date = start_date.next_day(advance)
    end
    start_date += 1 until start_date.wday == 1
    start_date
  end

  def prev_weekday(n = 1)
    return next_weekday(-n) if n.negative?

    start_date = dup.next_day

    (0..n).each do |_n|
      start_date -= 1
      start_date -= 1 while [0, 6].include?(start_date.wday)
    end
    start_date
  end

  def next_weekday(n = 1)
    return prev_weekday(-n) if n.negative?

    start_date = dup.prev_day

    (0..n).each do |_n|
      start_date += 1
      start_date += 1 while [0, 6].include?(start_date.wday)
    end
    start_date
  end

  def prev_monday(n = 1)
    raise ArgumentError, 'Cannot be less than zero' if n.negative?

    start_date = dup
    if n.positive?
      advance = 7 * n
      start_date = start_date.prev_day(advance)
    end
    start_date += 1 until start_date.wday == 1
    start_date
  end

  def within?(date_range)
    # Extract the month and day from both the given date and the date range.
    given_month = date.month
    given_day = date.day
    range_begin_month = date_range.begin.month
    range_begin_day = date_range.begin.day
    range_end_month = date_range.end.month
    range_end_day = date_range.end.day

    # Check if the given date's month and day are within the date range's month and day range, handling the year-end edge case.
    if range_begin_month > range_end_month
      (range_begin_month..12).include?(given_month) || (1..range_end_month).include?(given_month)
    else
      (range_begin_month..range_end_month).include?(given_month)
    end && (range_begin_day..range_end_day).include?(given_day)
  end

  def crontab_string
    time = self
    [time.min, time.hour, time.mday, time.month, time.wday].join(' ')
  end

  def to_str(format = :ymd)
    case format
    when :us
      strftime('%m/%d/%Y')
    when :ymd
      strftime('%Y%m%d')
    else
      raise "Unknown format #{format}"
    end
  end
end
