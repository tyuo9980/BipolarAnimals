class UrlsController < ApplicationController
  def new
    @shortened_url = Url.new
  end
 
  def create
    @counter = 0
    @limit = 10 #378378 total possibilities -> 99 * 98 * 39

    loop do
      @animal = Animal.order("RANDOM()").pluck("animal").first
      @pos_adj = Adjective.where(:kind => "positive").order("RANDOM()").pluck("adjective").first
      @neg_adj = Adjective.where(:kind => "negative").order("RANDOM()").pluck("adjective").first

      @animurl = @pos_adj.to_s + @neg_adj.to_s + @animal

      if (Url.where(:animurl => @animurl).blank?)
        break
      elsif (@counter > @limit)
        render :action => "new"
      end

      @counter += 1
    end

    @url = params[:url][:url]

    if (@url.index("http://") == nil && @url.index("https://") == nil && @url != "")
      @url = "http://" + @url
    end

    @shortened_url = Url.new(:url => @url, :animurl => @animurl)
    if @shortened_url.save
      flash[:animurl] = @shortened_url.animurl
      redirect_to(root_url)
    else
      render :action => "new"
    end
  end
 
  def show
    @shortened_url = Url.where(:animurl => params[:id]).first
    redirect_to(@shortened_url.url)
  end
end
