class StorekeepersController < ApplicationController
  before_action :set_storekeeper, only: :destroy

  def index
    @storekeepers = Storekeeper.all
  end

  def new
    @storekeeper = Storekeeper.new
  end

  def create
    @storekeeper = Storekeeper.new(user_params)
    if @storekeeper.save
      flash[:notice] = t('storekeeper.create')
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = t('storekeeper.destroy')
    redirect_to action: :index
  end

  private

  def set_storekeeper
    @storekeeper = Storekeeper.find(params[:id])
  end

  def storekeeper_params
    params.require(:storekeeper).permit(:email, :password)
  end
end
