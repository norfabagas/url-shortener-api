class Redirect::RedirectsController < ActionController::Base
  def index
  end
  
  def show
    @shortener = Shortener.where(:code => params[:code]).take
    
    if @shortener
      statistic = Statistic.new(
        :shortener => @shortener,
        :ip_address => request.remote_ip
      )
      statistic.save
    else
      render  :html => 'That page could not be found',
              :status => 404
    end

  end
end
