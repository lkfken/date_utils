module DateUtils
  module Range
    def date_partitions(every: :month, step: 1)
      a = []
      while true
        begin_date = begin_date.nil? ? self.begin : begin_date.next_month(step)
        end_date = begin_date.next_month(step).prev_day
        end_date = end_date > self.end ? self.end : end_date
        if begin_date > self.end
          break
        else
          a << (begin_date..end_date)
        end
      end
      a
    end
  end
end
  