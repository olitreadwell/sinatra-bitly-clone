get '/' do
  # Look in app/views/index.erb
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  @url = Url.create(resource: params[:resource])
  redirect to "/"
end

# e.g., /q6bda
get '/:short_url' do
  @url = Url.find_by_short_resource(params[:short_resource])
  # redirect to appropriate "long" URL
  redirect to "#{@url.resource}"
end
