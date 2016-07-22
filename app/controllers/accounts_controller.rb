class AccountsController < ApplicationController

  attr_reader :account

  def new
    @account = Account.new
    @account.build_owner
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      sign_in(account.owner)
      flash[:notice] = "Signed up successfully"
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  private
  def account_params
    params.require(:account).permit(:subdomain, owner_attributes: [:name, :email, :password, :password_confirmation])
  end
end
