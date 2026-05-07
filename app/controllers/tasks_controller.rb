class TasksController < ApplicationController
def index
  @tasks = Task.all
  render "task/index"
end

def new
  render "task/new"
end
def show
end
end
