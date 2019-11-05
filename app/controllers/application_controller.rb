require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end
  
  
  
    helpers do

   def logged_in?
     !!current_user
   end


   def current_user
     @current_user ||= Costumer.find_by(id: session[:user_id]) if session[:user_id]
     end
   end
   
     
 
  
  get '/login' do
    if logged_in?
      redirect '/products'
    else
      erb :'/login'
    end
  end
  

  post '/login' do
   @user = Costumer.find_by(name: params[:username].strip)
   
    if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect to '/products'
    else
     redirect to '/login'
    end
   
  
    # user = Costumer.find_by(name: params[:username])

    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect "/products/index.html"

    # else
    #   redirect "/login"
    # end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect "/"
    else
      redirect "/"
    end
  end



end


#       @products_ids = params[:costumer][:product_ids]
#       @products_ids.each do |prod|
#         pr = Product.find(prod)
#         @costumer.products << pr
#       end




# <% @products.each do |product| %>
#   <input id="<%= product.name %>" type="checkbox" name="costumer[product_ids][]" value="<%= product.id %>"><%= product.name %><br>
#   <% end %>
  






