require "bundler/setup"
require "sinatra"
require "uri"

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return nil
end

def delete_content(title)
  File.delete("pages/#{title}.txt")
end

def save_content(title, content)
  File.open("pages/#{title}.txt", "w") do |file|
    file.print(content)
  end
end

get("/") do
  @pages = Dir["pages/**/*.txt"].map do |file|
    File.basename(file, ".*")
  end
  erb :welcome
end

get("/new") do
  erb :new
end

get("/:title/edit") do
  @title = params[:title]
  @content = page_content(@title)
  erb :edit
end

get("/:title") do
  @title = params[:title]
  @content = page_content(@title)
  erb :show
end

put("/:title") do
  title = params[:title]
  content = params[:content]
  save_content(title, content)
  redirect URI.escape("/#{title}")
end

delete("/:title") do
  title = params[:title]
  delete_content(title)
  redirect "/"
end

post("/create") do
  title = params[:title]
  content = params[:content]
  save_content(title, content)
  redirect URI.escape("/#{title}")
end
