module ReservationHelper
  def fetch_my_reservations
    sql = "SELECT r.id as reservation_id, r.package, r.tour_date_id,
    td.date as tour_date, t.id as tour_id, t.name as tour_name, 
    t.description as tour_description,
    t.price as tour_price, t.location as tour_location,
    u.id as user_id, u.full_name, u.email as user_email 
    FROM reservations  as r INNER JOIN          
    tour_dates as td ON r.tour_date_id=td.id INNER JOIN  
    tours as t ON td.tour_id=t.id  INNER JOIN
    users as u ON r.user_id=u.id        
    WHERE r.user_id = #{current_user.id}"
    ActiveRecord::Base.connection.execute(sql)   
  end
end
   
