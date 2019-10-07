class CostumersController < ApplicationController


  get "/costumers" do
    erb :"/costumers/index.html"
  end

  
  get "/costumers/new" do
    erb :"/costumers/new.html"
  end

  
  post "/costumers" do
    redirect "/costumers"
  end

  # GET: /costume_rs/5
  get "/costumers/:id" do
    erb :"/costumers/show.html"
  end

  # GET: /costume_rs/5/edit
  get "/costumers/:id/edit" do
    erb :"/costumers/edit.html"
  end

  # PATCH: /costume_rs/5
  patch "/costumers/:id" do
    redirect "/costumers/:id"
  end

  # DELETE: /costume_rs/5/delete
  delete "/costumers/:id/delete" do
    redirect "/costumers"
  end
end
