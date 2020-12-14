class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = current_user.followeds_opinions
    @opinion = Opinion.new
    @users_first_three = current_user.who_follow.last(3)
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = current_user.opinions.build
  end

  # GET /opinions/1/edit
  def edit
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = current_user.opinions.build(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to @opinion, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion = Opinion.find(params[:id])
    if @opinion
      @opinion.destroy
      respond_to do |format|
        format.html { redirect_to opinions_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      format.html { render @opinion }
      format.json { render json: @opinion.errors, status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opinion_params
      params.require(:opinion).permit(:user, :feedback, :user_id, :body)
    end
end
