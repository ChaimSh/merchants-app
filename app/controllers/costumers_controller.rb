class CostumeRsController < ApplicationController

  # GET: /costume_rs
  get "/costume_rs" do
    erb :"/costume_rs/index.html"
  end

  # GET: /costume_rs/new
  get "/costume_rs/new" do
    erb :"/costume_rs/new.html"
  end

  # POST: /costume_rs
  post "/costume_rs" do
    redirect "/costume_rs"
  end

  # GET: /costume_rs/5
  get "/costume_rs/:id" do
    erb :"/costume_rs/show.html"
  end

  # GET: /costume_rs/5/edit
  get "/costume_rs/:id/edit" do
    erb :"/costume_rs/edit.html"
  end

  # PATCH: /costume_rs/5
  patch "/costume_rs/:id" do
    redirect "/costume_rs/:id"
  end

  # DELETE: /costume_rs/5/delete
  delete "/costume_rs/:id/delete" do
    redirect "/costume_rs"
  end
end
