# -*- coding: utf-8 -*-
require 'sinatra'
require 'rakuten_web_service'

#参考: https://github.com/k2works/sinatra_rakuten_api

get '/' do
  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
    c.affiliate_id = ENV["AFID"]
  end

  # Use genre id to fetch genre object
  @age = 30;
  @sex = 1;
  @rankings = RakutenWebService::Ichiba::Item.ranking(:age => @age, :sex => @sex)
  erb :item_ranking
end
