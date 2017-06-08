class FiguresController < ApplicationController
#CRUD

  get '/' do
    erb :'/application/root'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    erb :'landmarks/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["landmark"]["name"].empty?
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @figure.landmarks << @landmark
    end
      @figure.save
      redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["landmark"]["name"].empty?
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @figure.landmarks << @landmark
    end
    erb :show
  end

end
