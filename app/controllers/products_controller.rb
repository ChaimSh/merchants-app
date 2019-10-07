class ProductsController < ApplicationController

  # GET: /produc_ts
  get "/products" do
    erb :"/products/index.html"
  end

  # GET: /produc_ts/new
  get "/products/new" do
    erb :"/products/new.html"
  end

  # POST: /produc_ts
  post "/products" do
    redirect "/products"
  end

  # GET: /produc_ts/5
  get "/products/:id" do
    erb :"/products/show.html"
  end

  # GET: /produc_ts/5/edit
  get "/products/:id/edit" do
    erb :"/products/edit.html"
  end

  # PATCH: /produc_ts/5
  patch "/products/:id" do
    redirect "/products/:id"
  end

  # DELETE: /produc_ts/5/delete
  delete "/products/:id/delete" do
    redirect "/products"
  end
end
