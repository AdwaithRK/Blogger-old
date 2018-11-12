class UsersController < ApplicationController
  def signup
   @users=User.all
   p @users.length
  end

  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to '/signup' }
    end
  end 
  

  def make_admin
     user=User.find(params[:id])
     user.admin=true
     user.save
    respond_to do |format|
      format.html { redirect_to '/signup' }
    end
  end


  def show
      
  end



end
