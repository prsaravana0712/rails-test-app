class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @question.options.build
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: "Successfully created question."
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question, notice: "Successfully updated question."
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_url, notice: "Successfully destroyed question."
  end

  private
    def question_params
      params.require(:question).permit(:title, options_attributes: [:id, :content, :_destroy])
    end

end
