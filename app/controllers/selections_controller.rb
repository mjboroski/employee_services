class SelectionsController < ApplicationController
  before_action :set_selection, only: [:destroy]

  def new
    @selection = Selection.create(
      :user_id => params[:user_id],
      :benefit_id => params[:benefit_id],
      :beneficiaries => params[:beneficiaries]
    )
    @message = @selection.sign_up
    redirect_to user_path(@selection.user, :message => @message)
  end

  def create
    @selection = Selection.new(selection_params)
    respond_to do |format|
      if @selection.save
        format.html { redirect_to benefits_url, notice: 'Selection was successfully created.' }
      else
        format.html { redirect_to benefits_url}
      end
    end
  end

  def destroy
    @selection.destroy
    respond_to do |format|
      format.html { redirect_to benefits_url, notice: 'Selection was successfully removed.' }
    end
  end

  private
    def set_selection
      @selection = Selection.find(params[:selection_id])
    end

    def selection_params
      params.permit(
        :user_id,
        :benefit_id,
        :beneficiaries
      )
    end

end
