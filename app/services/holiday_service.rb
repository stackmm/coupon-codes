require "./app/services/nager_service.rb"

class HolidayService  
  def service
    NagerService.new
  end

  def next_three_holidays
    service.get_holidays.map do |holiday_data|
      Holiday.new(holiday_data)
    end
  end
end