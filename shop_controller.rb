require('sinatra')
require('sinatra/contrib/all')
require_relative('models/author')
require_relative('models/genre')
require_relative('models/product')
require_relative('models/publisher')
also_reload( './models/*' )

#INDEX
get '/products' do
  @products = Product.all
  erb(:index)
end

get '/publisher' do
  @publisher = Publisher.all
  erb(:publisher)
end

#CREATE
get '/products/new' do
  @product = Product.all
  @genre = Genre.all
  @author = Author.all
  @publisher = Publisher.all
  erb(:new_product)
end

post '/products' do
  Product.new(params).save
  redirect to '/products'
end

get '/products/:id' do
  @product = Product.find(params[:id])
  @publisher = Publisher.all
  @author = Author.all
  @genre = Genre.all
  erb(:product_details)
end

post '/products/:id/delete' do
  product = Product.find(params['id'])
  product.delete
  redirect to '/products'
end

get '/products/:id/edit' do
  @publisher = Publisher.all
  @author = Author.all
  @genre = Genre.all
  @product = Product.find(params['id'])
  erb(:edit_product)
end

post '/products/:id' do
  product = Product.new(params)
  product.update
  redirect to "/product/#{params['id']}"
end

get '/publisher/new' do
  @publisher = Publisher.all
  erb(:new_publisher)
end

post '/publisher' do
  Publisher.new(params).save
  redirect to '/publisher'
end

post '/publisher/:id/delete' do
  publisher = Publisher.find(params['id'])
  publisher.delete
  redirect to '/publisher'
end

get '/author' do
  @authors = Author.all
  erb(:author)
end

get '/author/new' do
  @author = Author.all
  erb(:author_new)
end

post '/author' do
  author = Author.new(params).save
  redirect to '/author'
end
