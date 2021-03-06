class Api::V1::ShortenersController < ApplicationController
  def menu
    # beverages price
    coffee = 10
    cappuccino = 15
    latte =12

    # count the quantity
    if params[:quantity].nil?
      quantity = 1
    else
      quantity = params[:quantity].to_i
    end

    # parameters query
    if params[:get] == 'show_menu'
      response = {
        :menu => "Coffee, latte, and Cappuccino"
      }
    elsif params[:get] == 'show_price'
      case params[:for].downcase
      when 'coffee'
        response = {:price => coffee * quantity, :quantity => quantity}
      when 'cappuccino'
        response = {:price => cappuccino * quantity, :quantity => quantity}
      when 'latte'
        response = {:price => latte * quantity, :quantity => quantity}
      else
        response = {:price => 0}
      end
    end

    render :json  => response
  end
  
  def index
    shorteners = []

    Shortener.all.order("created_at DESC").each do |val|
      shorteners.push({
        'url' => val.url,
        'short_url' => request.base_url + "/#{val.code}",
        'visit' => val.statistics.count,
        'last_hit' => if val.statistics.count > 0 then val.statistics.last.created_at else nil end
      })
    end

    render  :json => set_response(true, '', shorteners),
            :status => 200
  end

  def create
    if post_header(request)
      body = get_post_body(request)
      shortener = Shortener.new(shortener_params)
      if shortener.save
        render  :json => set_response(true, 'Shortener created', {:url => shortener.url, :code => shortener.code}),
                :status => 200
      else
        render  :json => set_response(false, shortener.errors.full_messages.first),
                :status => 400
      end
    else
      render  :json => set_response(false, 'Request Header not accepted'),
              :status => 403
    end
  end

  private

  def shortener_params
    params.require(:shortener).permit(:url, :code)
  end
end
