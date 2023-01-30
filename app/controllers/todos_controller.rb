class TodosController < ApplicationController
	before_action :authentication
	def index
		@todos = Todo.all
		render json: @todos
	end


	def show
		@todo=Todo.find(params[:id])
		render json: @todo

	end

	def new
		@todo = Todo.new
	end


	def create
		@todo= Todo.new(todo_params)
		if @todo.save
			render json: @todo, status: 201
		else
			render json: {erors: @todo.errors_full_messages}, status: 503
		end
	end

	def edit
		@todo = Todo.find(params[:id])
	end


    def update
    	@todo = Todo.find(params[:id])
    	if @todo.update(todo_params)
    		render json: @todo, statuu: 201
    	else
    		render json: {erors: @todo.errors_full_messages}, status: 503
    	end
    end

    def destroy
    	@todo = Todo.find(params[:id])
    	if @todo.destroy
        	render json: {messages: "successfull destroye"}
      end
    end
    private
    def todo_params
    	params.require(:todo).permit(:title, :user_id)
    end
end


