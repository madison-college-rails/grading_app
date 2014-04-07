class ExamsController < ApplicationController
  expose(:exam) { Exam.where(id: params[:id]).first || Exam.new }

  def new
  end

  def create
    exam.assign_attributes(exam_params)
    if exam.save
      redirect_to exam_path(exam)
    else
      render :new
    end
  end

  def show
  end


  private

    def exam_params
      params.require(:exam).permit(:student_name, :answers)
    end
end