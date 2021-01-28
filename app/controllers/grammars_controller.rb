class GrammarsController < ApplicationController
  before_action :set_grammar, only: [:show, :edit, :update, :destroy]

  # GET /grammars
  def index
    @grammars = Grammar.includes(:dialect)
    if params[:dialect_id]
      @dialect = Dialect.find(params[:dialect_id])
      @grammars = @grammars.where(dialect: @dialect) 
    end
  end

  # GET /grammars/1
  def show
    @example = Example.new(grammar_id: @grammar.id)
    @quiz = Quiz.new(grammar_id: @grammar.id)
  end

  # GET /grammars/1/edit
  def edit
  end

  # GET /grammars/new
  def new
    @grammar = Grammar.new(dialect_id: params[:dialect_id])
  end

  # POST /grammars
  def create
    @grammar = Grammar.new(grammar_params)
    if @grammar.save
      redirect_to @grammar, notice: 'Grammar was successfully created.' 
    else
      render :new
    end
  end

  # PATCH/PUT /grammars/1
  def update
    if @grammar.update(grammar_params)
      redirect_to @grammar, notice: 'Grammar was successfully updated.' 
    else
      render :new
    end
  end

 # DELETE /grammars/1
  def destroy
    @grammar.destroy
    redirect_to grammars_url, notice: 'Grammar was successfully destroyed.'
  end

  private
    def set_grammar
      @grammar = Grammar.find(params[:id])
    end

    def grammar_params
      params.require(:grammar).permit(:description, :position, :dialect_id, :label, :commonness)
    end
end