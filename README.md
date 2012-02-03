# Yummy Meeting
page to enter meeting info. 

meeting has:  
meta (name, date, attendees, cc's)  
problem (why are we having this meeting? what needs to be decided? this is required)  
decision (resolution to this meeting. what was decided. this is required)  
action items (these are to fulfill the decision, each has an owner)  
notes  
follow-up date  

meeting is created after the meeting is over. a summary is mailed to all participants & cc's. problem, decision, and action items are highlighted.

## Running

First time only, run rake db:migrate

To run, `rackup` or `shotgun`.

For Heroku, create app with `heroku create APP_NAME -s cedar`.

## Database Stuff

Add migrations by adding files to `db/migrations/` and then run `rake db` to migrate the db.

## Resources

 * [Sinatra Documentation](http://www.sinatrarb.com/intro)
 * [Sequel Cheatsheet](http://cheat.errtheblog.com/s/sequel/)
 * [Sequel Model HowTo](http://sequel.rubyforge.org/rdoc/files/doc/association_basics_rdoc.html)
