class User < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	belongs_to :city
  	belongs_to :country
	  
  	has_many :calls_made, :class_name => 'Call', :foreign_key => 'user_sender_id'
  	has_many :calls_received, :class_name => 'Call', :foreign_key => 'user_receiver_id'
  	

  	def interval_position call_datetime
		if call_datetime.hour < 8 then
			return 1
		elsif call_datetime >= call_datetime.change(hour: 8, minute: 0, second: 0 ) and call_datetime <= call_datetime.change(hour: 20, minute: 0, second: 0) then
			return 2
		else
			return 3
		end
  	end

  	def intervals_number start_call, end_call, initial_interval, final_interval
		days = (end_call.to_date - start_call.to_date).to_i
		total_intervals = (days + 1) * 3
		return (total_intervals - (initial_interval - 1)) - (3 - final_interval)
  	end

	def local_calls_bill start_call, end_call
		
		initial_interval = interval_position(start_call)
		final_interval = interval_position(end_call)
		intervals_number = intervals_number(start_call, end_call, initial_interval, final_interval)
	
		current_date = start_call
		current_interval = initial_interval

		cost = 0
		if intervals_number == 1 then
			minutes = minutes_difference(start_call, end_call)
			(current_interval == 2 and current_date.wday.between?(1, 5)) ? price = 0.20 : price = 0.10
			cost += minutes * price
		else
			i = 1
			while i < intervals_number do
				case current_interval
				when 1
					# llamar al calcular minutos y multiplicar por 0.10
					interval_limit = current_date.change(hour: 8, minute: 0, second: 0)
					minutes = minutes_difference(current_date, interval_limit)
					cost += minutes * 0.10
					current_interval = 2
					current_date = interval_limit
				when 2	
					# llamar al calcular minutos y multiplicar por 0.20 solo si es día de semana
					interval_limit = current_date.change(hour: 20, minute: 0, second: 0)
					minutes = minutes_difference(current_date, interval_limit)
					current_date.wday.between?(1, 5) ? price = 0.20 : price = 0.10
					cost += minutes * price
					current_date = interval_limit
					current_interval = 3
				when 3
					# llamar al calcular minutos y multiplicar por 0.10
					interval_limit = (current_date + 1.day).change(hour: 0, minute: 0, second: 0)
					minutes = minutes_difference(current_date, interval_limit)
					cost += minutes * 0.10
					current_interval = 1
					current_date = interval_limit 
				end
				i += 1
			end 
			# queda el último intervalo fuera a calcular
			(current_interval == 2 and current_date.wday.between?(1, 5)) ? price = 0.20 : price = 0.10
			minutes = minutes_difference(current_date, end_call)
			cost += minutes * price
		end
		return cost
  	end


	def minutes_difference date1, date2
		return ((date2 - date1) / 60).to_i
	end


  	def calls_bill(bill_month)
	  	local_calls_cost = 0
		national_calls_cost = 0
		international_call_cost = 0

		
    	self.calls_made.where("cast(strftime('%m', start) as int) = ?", bill_month).each do |call|
      		if self.country_id == call.user_receiver.country_id then
        		if self.city_id == call.user_receiver.city_id then  
          			#local call
					cost = local_calls_bill(call.start, call.end)
					local_calls_cost += cost
        		else 
          			#national call
					cost = minutes_difference(call.start, call.end) * call.user_receiver.city.price.to_f
					national_calls_cost += cost
        		end
      		else
        		# internacional call
				puts "--------"
				puts call.id.to_s
				puts "--------"
				cost = minutes_difference(call.start, call.end) * call.user_receiver.country.price.to_f
				international_call_cost += cost
      		end
    	end
		return Bill.new(
			self, 
			local_calls_cost.round(2), 
			national_calls_cost.round(2), 
			international_call_cost.round(2)
		)
  	end

end


class Bill
	def initialize(user, local_calls_cost, national_calls_cost, international_call_cost)
		@user = user
    	@local_calls_cost = local_calls_cost
    	@national_calls_cost = national_calls_cost
    	@international_call_cost = international_call_cost
  	end

	def user
		@user
	end

	def subscription
		@user.subscription.to_f
	end

	def local_calls_cost
		@local_calls_cost
	end

	def national_calls_cost
		@national_calls_cost
	end 

	def international_call_cost
		@international_call_cost
	end

	def national_and_international_cost
		self.national_calls_cost + self.international_call_cost
	end

	def total_cost
		self.local_calls_cost + self.national_calls_cost + self.international_call_cost + self.subscription
	end

end