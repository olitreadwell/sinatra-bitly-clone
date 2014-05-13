get '/' do
  erb :index
end

post '/urls' do
  @url = Url.create(resource: params[:resource])
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  @url = Url.find_by_short_resource(params[:short_url])
  redirect to "http://#{@url.resource}"
end
