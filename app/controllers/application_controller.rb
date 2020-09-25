class ApplicationController < ActionController::Base
	before_action :set_action_cable_identifier
	before_action :authenticate_user!

	private

	def set_action_cable_identifier
	  cookies.encrypted[:session_id] = session.id.to_s
	end
end
