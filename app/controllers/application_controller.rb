class ApplicationController < ActionController::API
	SECRET = "yoursecretword"

	def authentication
		decode_data = decode_user_data(request.headers["token"])
		user_data = decode_data[0]["user_data"] unless !decode_data
		user = user_data
		if user
			return true
		else
			render json: { message: "invalid credentials" }
		end
	end

	def encode_user_data(payload)
		token = JWT.encode payload, SECRET, "HS256"
		return token
	end

	def decode_user_data(token)
		begin
			data = JWT.decode token, SECRET, true, { algorithm: "HS256" }
			return data
		rescue => e
			puts e
		end
	end

	# def validate_json_web_token
    #   token = request.headers[:token] || params[:token]
    #   begin
    #     @token = JsonWebToken.decode(token)
    #   rescue *ERROR_CLASSES => exception
    #     handle_exception exception
    #   end
    # end

	# def current_user
    #   @current_user ||= UserBlock::User.find(@token.id) if @token.present?
    # end

	def decode_user_data(token)
		begin
			JWT.decode token, SECRET, true, { algorithm: "HS256" }
		rescue => e
			puts e
		end
	end
end

