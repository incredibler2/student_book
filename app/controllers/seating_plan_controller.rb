class SeatingPlanController < ApplicationController
	include SeatingPlanHelper
	def index()
		@student_list = Hash.new
		@seats_x = params[:seats_x]
		@seats_y = params[:seats_y]
		@available_seats = params[:available_seats]
		@class_name = params[:class_name]
		@student_num = params[:student_num].to_i
		@gender_sort = params[:gender_option]
		decision = params[:process_option]


		# 0 are available seats.
		@seats_x = @seats_x.to_i + 2
		@seats_y = @seats_y.to_i + 2
		@available_seats = @available_seats.to_i

		@no_seat = "\u25CB"
		@yes_seat = "\u25C9"
		if @available_seats >= (@seats_x-2) * (@seats_y-2)
			"error"
		else
			"continue"
		end

		@seat_layout = seat_layout(class_layout)
		@printed_layout = print_layout(@seat_layout)

		puts "lalalala"
		puts @student_num
		puts decision


		if not(@student_num.nil?)

			for i in 1..@student_num
				@s_list = student_list_params(i)
			end
			puts @s_list
			puts 'hope'
			@s_list_dup = @s_list.dup
			if not(decision.nil?)
			
				if decision.strip.upcase== 'M'
					@seat_layout = manual_list(@seat_layout, @s_list_dup)
					main_loop = false
				elsif decision.strip.upcase == "A"
					@seat_layout = algorithm(@seat_layout, @s_list_dup)
					main_loop = false
				else
					puts "Did not understand, Do again."
				end
			end
		end
	


	end
end