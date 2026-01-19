class StatisticsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Генерируем рандомные данные для презентации
    @cycling_stats = generate_stats('cycling')
    @virtual_cycling_stats = generate_stats('virtual_cycling')
    
    @total_distance = @cycling_stats[:total_distance] + @virtual_cycling_stats[:total_distance]
    @total_duration = @cycling_stats[:total_duration] + @virtual_cycling_stats[:total_duration]
    @total_rides = @cycling_stats[:rides_count] + @virtual_cycling_stats[:rides_count]
    
    # Данные для графиков по месяцам
    @monthly_data = generate_monthly_data
  end

  private

  def generate_stats(category)
    {
      rides_count: rand(15..45),
      total_distance: rand(200..800),
      total_duration: rand(15..60),
      avg_speed: rand(18..28),
      max_speed: rand(35..55),
      total_elevation: rand(3000..12000),
      longest_ride: rand(30..80),
      avg_distance: rand(15..35)
    }
  end

  def generate_monthly_data
    months = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 
              'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь']
    
    current_month = Time.current.month
    last_6_months = []
    
    6.times do |i|
      month_index = (current_month - 6 + i) % 12
      last_6_months << {
        name: months[month_index],
        cycling: rand(30..150),
        virtual_cycling: rand(20..100)
      }
    end
    
    last_6_months
  end
end
