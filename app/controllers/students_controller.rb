class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show 
    @student = Student.find(params[:id])
  end 


  def new
    @student = Student.new
  end

  def create
    @student = Student.new(post_params(:first_name, :last_name))
    @student.save 
    redirect_to student_path(@student)
  end
  
  def edit
    @student = Student.find(params[:id])
  end 

  def update
    @student = Student.find(params[:id])
    @student.update(first_name: params[:school_class][:title], last_name: params[:school_class][:room_number])
    # binding.pry
  end

  private 
  def post_params(*args)
    params.require(:student).permit(*args)
  end 
end
