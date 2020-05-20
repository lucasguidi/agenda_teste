class SessionsController < ApplicationController

  def new
    redirect_to contact_path(current_user) if user_signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sing_in(user)
      redirect_to contacts_path
    else
      flash.now[:danger] = 'Email e Senha inválidos'
      render 'new'
    end
  end

  def destroy
    sing_out
    flash[:warning] = 'Logout realizado com sucesso'
    redirect_to entrar_path
  end


end