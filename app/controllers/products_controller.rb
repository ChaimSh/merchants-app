require 'rack-flash'
class ProductsController < ApplicationController
 enable :sessions
use Rack::Flash

  # GET: /produc_ts
  get "/products" do
    if !logged_in?
       redirect "/login"
     else
             
       @costumer = Costumer.find(session[:user_id])
       erb :"/products/index.html"
     end
  end

  # GET: /produc_ts/new
  get "/products/new" do
    if !logged_in?
       redirect to "/login"
    else
      
      erb :"/products/new.html"
      
    end
  end

  # POST: /produc_ts
  post "/products" do
     if params[:name] !="" && params[:price] !=""
       @costumer = Costumer.find(session[:user_id])
       @costumer.products << Product.create(name: params[:name], price: params[:price], details: params[:details])
       
       redirect "/products"
     else
        redirect "/products/new"
     end
  end

  # GET: /produc_ts/5
  get "/products/:id" do
    if !logged_in?
      redirect "/login"
    else
      @product = Product.find(params[:id])
      erb :"/products/show.html"
    end
  end

  # GET: /produc_ts/5/edit
  get "/products/:id/edit" do
    if !logged_in? 
      redirect "/login"
    else
      @product = Product.find(params[:id])
      erb :"/products/edit.html"
    end
  end

  # PATCH: /produc_ts/5
  patch "/products/:id" do
    product = Product.find(params[:id])
      if product.costumer_id == session[:user_id] && params[:name] !="" && params[:price] !=""
        product.update(name: params[:name], price: params[:price], details: params[:details])
        flash[:message] = "Successfully updated product."
        product.save
        redirect "/products"
        
      else
        redirect "/products/#{product.id}/edit"
      end
  end

  # DELETE: /produc_ts/5/delete
  delete "/products/:id" do
     product = Product.find(params[:id])
     if logged_in? && product.costumer_id == session[:user_id]
        product.delete
           flash[:message] = "Successfully deleted product."
         redirect "/products"
     else
        redirect "/products/#{product.id}"
     end
  end
end
