require "date_utils/version"

module DateUtils
  def day_in_sec
    24 * 60 * 60
  end

  def beginning_of_the_week(year:, month:, day: 1, hour: 8, min: 0, sec: 0, wday:, timezone: '-08:00')
    time = Time.new(year, month, day, hour, min, sec, timezone)
    time = time - (time.wday - wday) * day_in_sec # Sunday is 0

    # if the date is falling into the previous month, add 7 days to it.
    until time.year == year && time.month == month
      time += 7 * day_in_sec
    end

    time
  end

  def month_end
    Date.civil(self.year, self.month, -1)
  end

  def month_begin
    Date.civil(self.year, self.month, 1)
  end

  def next_monday(n = 0)
    raise ArgumentError, "Cannot be less than zero" if n < 0
    start_date = self.dup
    if n > 0
      advance = 7 * n
      start_date = start_date.next_day(advance)
    end
    start_date += 1 until start_date.wday == 1
    start_date
  end

  def prev_monday(n = 0)
    raise ArgumentError, "Cannot be less than zero" if n < 0
    start_date = self.dup
    if n > 0
      advance = 7 * n
      start_date = start_date.prev_day(advance)
    end
    start_date += 1 until start_date.wday == 1
    start_date
  end

  def crontab_string
    time = self
    [time.min, time.hour, time.mday, time.month, time.wday].join(' ')
  end
    
  def to_str(format: :us)
    case format
    when :us
      self.strftime('%m/%d/%Y')
    else
      self.to_s
    end
  end
end
