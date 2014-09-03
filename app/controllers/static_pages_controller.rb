class StaticPagesController < ApplicationController
  before_filter :strip_iframe_protection

  def home
    @stream = Stream.last
    @last8 = Stream.where("id >?", Stream.last.id-8).reverse
  end

  def stream
    @stream = Stream.last
    @last8 = Stream.where("id >?", Stream.last.id-8).reverse
    respond_to do |format|
      format.json   { render :json => @stream.to_json }
      format.js { }
    end
  end

private
  def strip_iframe_protection
    response.headers.delete('X-Frame-Options')
  end

end
