require "sinatra"
require "sinatra/reloader"
require "pry"
 

get( "/profiles/:profile_name" ) do
  if params[:profile_name] == "ann-margret"
    output_name = "Ann Margret"
    output_img = "<img src='http://www.whatgoesaroundnyc.com/blog/wp-content/uploads/2013/08/1964-elvis-e-ann-margret-in-viva-las-wegas.jpg' width='400' />"
  
  elsif params[:profile_name] == "elvis"
    output_name = "Elvis Presley"
    output_img = "<img src='http://foglobe.com/data_images/main/elvis-presley/elvis-presley-08.jpg' width='400' />"
    end

 
  output_string = "<!doctype html><html><head></head>"
  output_string += "<body><h1>#{output_name}</h1>#{output_img}</body></html>"



output_string


end