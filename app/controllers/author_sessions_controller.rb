class AuthorSessionsController < ApplicationController



  def new
  end

  def create
    if login(params[:username], params[:password])
      redirect_back_or_to(articles_path, message: 'Logged in succesfully.')
    else
      flash.now.alert = "Login FAILED..."
      redner action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, message: 'Logged Out !')
  end
end
