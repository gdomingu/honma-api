class QuizzesController < ApplicationController
  before_action :set_example, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.includes(grammar: :dialect).order("dialects.name_en")
    if params[:grammar_id]
      @grammar = Grammar.find(params[:grammar_id])
      @quizzes = @grammars.where(grammar: @grammar) 
    end
  end

  def show
  end

  def new
    @quiz = Quiz.new(grammar_id: params[:grammar_id])
  end

  def edit
  end

  def create 
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz.grammar, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_example
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:tokyo, :answer, :grammar_id)
    end
end
