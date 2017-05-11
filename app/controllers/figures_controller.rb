class FiguresController < ApplicationController

get '/figures/new' do
  erb :'figures/new'
end

post '/figures' do
  figure = Figure.new(params[:figure])
     if !params[:title][:name].empty?
       figure.titles << Title.create(params[:title])
     end
     if !params[:landmark][:name].empty?
       figure.landmarks << Landmark.create(params[:landmark])
     end
     figure.save
     redirect "/figures/#{@figure.id}"
end

get "/figures" do
  @figures = Figure.all
  erb :'figures/index'
end

get "/figures/:id" do
  @landmark = Landmark.find_by(params[:id])
  erb :'figures/show'
end

get '/figures/:id/edit' do
     @figure = Figure.find(params[:id])
     erb :'figures/edit'
end

patch '/figures/:id' do
     @figure = Figure.find(params[:id])
     @figure.update(params[:figure])
     if params[:title][:name] != ""
       figure.titles.build(name: params[:title][:name])
     end
     if params[:landmark][:name] != ""
       figure.landmarks.build(name: params[:landmark][:name])
     end
     figure.save
   end

end
