class AskQuestionController < ApplicationController
  def index
    @ask_questions = AskQuestions.all
  end

  def show
    @ask_question = AskQuestion.find(params[:id])
  end

  def new
    @ask_question = AskQuestion.new
  end

  def create
    @ask_question = AskQuestion.new
    @ask_question.title = params[:ask_question][:title]
    @ask_question.body = params[:ask_question][:body]
    @ask_question.resolved = params[:ask_question][:resolved]

    if @ask_question.saved
      flash[:notice] = "Question was saved."
      redirect_to @ask_question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def edit
    @ask_question = AskQuestion.find(params[:id])
  end

  def update
    @ask_question = AskQuestion.find(params[:id])
    @ask_question.title = params[:ask_question][:title]
    @ask_question.body = params[:ask_question][:body]
    @ask_question.resolved = params[:ask_question][:resolved]

    if @ask_question.save
      flash[:notice] = "Question was updated."
      redirect_to @ask_question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :edit
    end
  end

  def destroy
    @ask_question = AskQuestion.find(params[:id])

    if @ask_question.destroy
      flash[:notice] = "\"#{@ask_question.title}\" was deleted successfully."
      redirect_to ask_questions_path
    else
      flash.now[:alert] = "There was an error deleting the question."
      render :show
    end
  end
end
