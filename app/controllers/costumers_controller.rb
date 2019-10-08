class CostumersController < ApplicationController


  get "/costumers" do
    if !logged_in?
       redirect "/users/login"
     else
       @user = User.find(session[:user_id])
       erb :"/costumers/index.html"
    end
  end

  
  get "/costumers/new" do
     if !logged_in?
       redirect to "/users/login"
     else
       erb :"/costumers/new.html"
     end
  end

  
  post "/costumers" do
    if params[:name] !=""
      @user = current_user.costumers.create(name: params[:name])
      # @user = User.find(session[:user_id])
      # @user.costumers << Costumer.create(name: params[:name])
      redirect "/costumers"
    else
      redirect "/costumers/new"
    end
  end

  # GET: /costume_rs/5
  get "/costumers/:id" do
    if !logged_in?
      redirect "/users/login"
    else
      @costumer = Costumer.find(params[:id])
      erb :"/costumers/show.html"
    end
  end

  # GET: /costume_rs/5/edit
  get "/costumers/:id/edit" do
    if !logged_in?
      redirect "/users/login"
    else
      @costumer = Costumer.find(params[:id])
      erb :"/costumers/edit.html"
    end
  end

  # PATCH: /costume_rs/5
  patch "/costumers/:id" do
      costumer = Costumer.find(params[:id])
         if params[:content] != ""
           costumer.update(name: params[:name])
           costumer.save
           redirect "/costumers/#{costumer.id}"
         else
           redirect "/costumers/#{costumer.id}/edit"
         end
  end

  
  delete "/costumers/:id/delete" do
    costumer = Costumer.find_by(params[:id])
      if costumer.user_id == session[:user_id]

        costumer.delete
  
        redirect "/costumers"
      else
        redirect "/costumers/#{costumer.id}"
      end
  end
end
