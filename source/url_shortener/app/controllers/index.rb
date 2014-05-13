enable :sessions

get '/' do
  if session[:new_url_id]
    @new_url = Url.find(session[:new_url_id])
  end

  @prev_urls = Url.all
  erb :index
end

post '/urls' do
  @url = Url.create(resource: params[:resource])
  session[:new_url_id] = @url.id
  redirect to '/'
end

# e.g., /q6bda
get '/:short_resource' do
  @url = Url.find_by_short_resource(params[:short_resource])
  @url.visit_count += 1
  redirect to "http://#{@url.resource}"
end
