class GrammarsController < ApplicationController
  before_action :set_grammar, only: [:show, :edit, :update, :destroy]

  # GET /grammars
  def index
    @grammars = Grammar.includes(:dialect)
    @grammars = @grammars.where(dialect_id: params[:dialect_id]) if params[:dialect_id]
  end

  # GET /grammars/1
  def show
  end

  # GET /grammars/1/edit
  def edit
  end

  # GET /grammars/new
  def new
    @grammar = Grammar.new
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
      params.require(:grammar).permit(:description, :position, :dialect_id, :label)
    end
end