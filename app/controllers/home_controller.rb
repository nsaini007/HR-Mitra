class HomeController < ApplicationController
  def index
    @title_text = "Hello World!"
    @subtitle_text = "This is a new App"
  end
end
