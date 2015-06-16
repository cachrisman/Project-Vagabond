# Project-Vagabond

git clone https://github.com/cachrisman/Project-Vagabond.git
git co -b feature_name

rails g scaffold User first_name:string last_name:string email:string:uniq password:digest city:references
rails g scaffold LogPost title:string body:text user:references city:references
rails g controller Sessions new create
rails g controller Site index about contact
rails g model City name:string
rails g migration AddCityReferenceToUser city:references
rails g migration RemoveCityFromUser city:string
rails g migration AddCityReferenceToLogPost city:references
rails g migration RemoveCityFromLogPost city:string
