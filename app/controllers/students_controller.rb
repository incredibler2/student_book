class StudentsController < ApplicationController
		def new
			@student = Student.new
		end
	  def create
	    @student = Student.new(student_params)
	
	      if (@student.save)
	        redirect_to "/classes/1"
	    else
	      render  "/classes/show"
	    end
	  end

	 private
	   def student_params
	    params.require(:student).permit(:forename, :surname, :grade_predicted)
	  end
end
