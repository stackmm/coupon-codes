require "./app/services/nager_service.rb"

class HolidayService  
  def service
    NagerService.new
  end

  def next_three_holidays
    holidays = service.get_holidays.first(3)
  end
end