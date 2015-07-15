#!/usr/bin/env ruby

require "net/http"
require "json"


PROBLEM = 12827251 # Problem house
STEMBO = 13772612
LIAM = 19351
AUTH = "mjVRnq7ZKtrMB3rAqILiLADqtS2ad6de519xCWEg"
BASE = "https://api.groupme.com/v3/"

def read_messages()
	url_string = "#{BASE}groups/#{PROBLEM}/messages?token=#{AUTH}&limit=1"
	url = URI.parse(url_string)
	res = Net::HTTP::get(url)
	res = JSON.parse(res)["response"]
	res["messages"].reverse!.each { |e| 
		# puts e["sender_id"]
		# puts e["name"]
		# puts e
		if e["sender_id"].to_i == STEMBO
			bots()
		end
	}
end

def bots()
	puts "in here"
	url_string = "https://api.groupme.com/v3/bots/post?token=#{AUTH}"
	url = URI.parse(url_string)
	headers =  
	{
		"bot_id" =>"c73554496b297a3c8689d927ba", 
		"text" => "Love You stemby"
	}
	res = Net::HTTP::post_form(url, headers)
	puts res
end

# while true
	read_messages
# end
