#!/usr/bin/env ruby
# An app for meetings.
# @author Reed Morse - https://github.com/cloudwalking
# Sinatra template from Nat Welch - https://github.com/icco/basic

configure do
  set :sessions, true
  DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/data.db')
end

get '/' do
  action_items = Action_Item.all()
  erb :index, 
      :locals => {
        :items => action_items
      }
end

get '/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  less :style
end

get '/:id' do
  Meeting.filter(:id => params[:id]).first.to_s
end

post '/' do
  #complete = params[:complete] ? true : false
  complete = false
  
  action_items = DB[:action_items]
  action_items.insert(:ldap => params[:ldap], :action => params[:action], :complete => complete)

  redirect '/'
end

post '/item_complete' do
  id = params[:id]
  complete = params[:complete] == 'true'
  
  action_items = DB[:action_items]
  # action_items[:id => id].update(:complete => complete) # why doesn't this work?
  action_items.filter(:id => id).update(:complete => complete)
  
  "success"
end

class Meeting < Sequel::Model(:meetings)
end
class Action_Item < Sequel::Model(:action_items)
end
