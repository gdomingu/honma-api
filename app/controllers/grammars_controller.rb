class GrammarsController < ApplicationController
  before_action :set_grammar, only: [:show, :edit, :update, :destroy]

  # GET /dialects
  def index
    @grammars = Grammar.all
  end

  # GET /dialects/1
  def show
  end

  # GET /dialects/1/edit
  def edit
  end

  # GET /dialects/new
  def new
    @grammar = Grammar.new
  end

  # POST /dialects
  def create
    @grammar = Grammar.new(grammar_params)
    if @grammar.save
      redirect_to @grammar, notice: 'Grammar was successfully created.' 
    else
      render :new
    end
  end

  # PATCH/PUT /dialects/1
  def update
    if @grammar.update(grammar_params)
      redirect_to @grammar, notice: 'Grammar was successfully updated.' 
    else
      render :new
    end
  end

 # DELETE /dialects/1
  def destroy
    @grammar.destroy
    redirect_to grammars_url, notice: 'Grammar was successfully destroyed.'
  end

  private
    def set_grammar
      @grammar = Grammar.find(params[:id])
    end

    def grammar_params
      params.require(:grammar).permit(:description, :position, :dialect_id)
    end
end