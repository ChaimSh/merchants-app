
class ProductsController < ApplicationController

  # GET: /produc_ts
  get "/products" do
    if !logged_in?
       redirect "/users/login"
     else
       @user = User.find(session[:user_id])
       erb :"/products/index.html"
     end
  end

  # GET: /produc_ts/new
  get "/products/new" do
    if !logged_in?
       redirect to "/users/login"
    else
      erb :"/products/new.html"
    end
  end

  # POST: /produc_ts
  post "/products" do
     if params[:name] !="" && params[:price] !=""
       @products = Product.create(name: params[:name], price: params[:price])   
       redirect "/products"
     else
        redirect "/products/new"
     end
  end

  # GET: /produc_ts/5
  get "/products/:id" do
    if !logged_in?
      redirect "/users/login"
    else
      @products = Product.find(params[:id])
      erb :"/products/show.html"
    end
  end

  # GET: /produc_ts/5/edit
  get "/products/:id/edit" do
    if !logged_in?
      redirect "/users/login"
    else
      @products = Product.find(params[:id])
      erb :"/products/edit.html"
    end
  end

  # PATCH: /produc_ts/5
  post "/products/:id" do
    product = Product.find(params[:id])
      if params[:name] != "" || params[:price]
        product.update(name: params[:name], price: params[:price])
        product.save
        redirect "/products/#{product.id}"
      else
        redirect "/products/#{product.id}/edit"
      end
  end

  # DELETE: /produc_ts/5/delete
  delete "/products/:id/delete" do
     if product.user_id == session[:user_id]

        product.delete
  
         redirect "/products"
     else
        redirect "/products/#{product.id}"
     end
  end
end
