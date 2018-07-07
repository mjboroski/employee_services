class BenefitsController < ApplicationController
  before_action :set_benefit, only: [ :show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @benefits = User.find(params[:user_id]).benefits
    else
      @benefits = Benefit.all
    end
  end

  def show
    set_benefit
  end

  def new
    @benefit = Benefit.new
  end

  def edit
  end

  def create
    @benefit = Benefit.new(benefit_params)
    respond_to do |format|
      if @benefit.save
        format.html { redirect_to @benefit, notice: 'Benefit was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @benefit.update(benefit_params)
        format.html { redirect_to @benefit, notice: 'Benefit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @benefit.destroy
    respond_to do |format|
      format.html { redirect_to benefits_url, notice: 'Benefit was successfully deleted.' }
    end
  end

  private
    def set_benefit
      @benefit = Benefit.find(params[:id])
    end

    def benefit_params
      params.require(:benefit).permit(
        :name,
        :description,
        :link,
        :flat_cost,
        :percent_cost
      )
    end

end
