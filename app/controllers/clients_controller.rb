class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:edit, :update, :destroy]

  def index
    @clients = Client.all
   
  end

  def new
    @client = Client.new
    @users = User.all
  end

  def edit
    @users = User.all
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: 'clients was successfully updated.'
    else
      render :new
    end
  end

  def create
    @client = Client.new(client_params)
    if @client.save!
      redirect_to clients_path, notice:  'Client was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'client was successfully destroyed.'
  end

private
  def set_client
    @client = Client.find(params[:id])
  end
  def client_params
     params.require(:client).permit(:username, :lastname, :phone, :mail, :comment, :actif, :user_id)
  end
end

