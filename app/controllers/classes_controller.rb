class ClassesController < ApplicationController
	def show
		@group = Group.find(params[:id])
	end
end