class ProducTsController < ApplicationController

  # GET: /produc_ts
  get "/produc_ts" do
    erb :"/produc_ts/index.html"
  end

  # GET: /produc_ts/new
  get "/produc_ts/new" do
    erb :"/produc_ts/new.html"
  end

  # POST: /produc_ts
  post "/produc_ts" do
    redirect "/produc_ts"
  end

  # GET: /produc_ts/5
  get "/produc_ts/:id" do
    erb :"/produc_ts/show.html"
  end

  # GET: /produc_ts/5/edit
  get "/produc_ts/:id/edit" do
    erb :"/produc_ts/edit.html"
  end

  # PATCH: /produc_ts/5
  patch "/produc_ts/:id" do
    redirect "/produc_ts/:id"
  end

  # DELETE: /produc_ts/5/delete
  delete "/produc_ts/:id/delete" do
    redirect "/produc_ts"
  end
end
