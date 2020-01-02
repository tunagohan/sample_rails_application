class PageController < ApplicationController
  def home
  end

  def books
    json_str = Book.all.to_json
    parse_json = JSON.parse(json_str)
    render json: JSON.pretty_generate(parse_json)
  end
end
