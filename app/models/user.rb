class User < ApplicationRecord
	has_many :todos
	has_many :movies
end
