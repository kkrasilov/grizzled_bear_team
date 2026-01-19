class RatingsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Генерируем рандомный рейтинг участников для презентации
    @leaderboard = generate_leaderboard
    @current_user_position = find_current_user_position
    @filter = params[:filter] || 'all'
  end

  private

  def generate_leaderboard
    # Список участников команды
    team_members = [
      'Докучаев Михаил',
      'Смирнов Павел',
      'Вавилин Никита',
      'Красилов Константин',
      'Красилова Юлия',
      'Самсонов Роман',
      'Rudakov Artem',
      'Силин Данил',
      'Кочегаров Алексей',
      'Силина Александра'
    ]
    
    leaderboard = []
    
    # Добавляем текущего пользователя
    current_user_distance = rand(200..450)
    current_user_rides = rand(15..35)
    leaderboard << {
      position: nil, # будет рассчитано позже
      user: current_user,
      is_current_user: true,
      total_distance: current_user_distance,
      total_rides: current_user_rides,
      avg_speed: rand(20..28),
      total_duration: (current_user_distance / rand(20..25).to_f).round(1),
      points: calculate_points(current_user_distance, current_user_rides)
    }
    
    # Добавляем участников команды
    team_members.each do |member_name|
      distance = rand(150..550)
      rides = rand(10..40)
      
      leaderboard << {
        position: nil,
        name: member_name,
        is_current_user: false,
        total_distance: distance,
        total_rides: rides,
        avg_speed: rand(18..30),
        total_duration: (distance / rand(18..26).to_f).round(1),
        points: calculate_points(distance, rides)
      }
    end
    
    # Сортируем по очкам и присваиваем позиции
    leaderboard.sort_by! { |entry| -entry[:points] }
    leaderboard.each_with_index do |entry, index|
      entry[:position] = index + 1
    end
    
    leaderboard
  end

  def calculate_points(distance, rides)
    (distance * 2 + rides * 10).to_i
  end

  def find_current_user_position
    current_user_entry = @leaderboard.find { |entry| entry[:is_current_user] }
    current_user_entry ? current_user_entry[:position] : nil
  end
end
