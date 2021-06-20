class TodosController < ApplicationController

    def new
      @todo = Todo.new
    end

    def create
      @todo = Todo.new(todo_params)
      @todo.save
      if @todo.save
        flash[:notice] = "Task was created successfully!"
        redirect_to todo_path(@todo)
      else
        render 'new'
      end

      def show
        @todo = Todo.find(params[:id])
      end
    end



    private
      def todo_params
        params.require(:todo).permit(:name, :description)
      end
end