class FiguresController < ApplicationController
#CRUD

  get '/' do
    erb :'/application/root'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    #binding.pry
    erb :'figures/new'
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
    @landmarks = @figure.landmarks
    erb :'figures/show'
  end

  get 'figures/:id/edit' do
    erb :edit
  end

  patch 'figures/:id' do
    # @figure.update(params["figure"])
    # if !params["landmark"]["name"].empty?
    #   @landmark = Landmark.create(name: params["landmark"]["name"])
    #   @figure.landmarks << @landmark
    # end
  end

end
