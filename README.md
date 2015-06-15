# Project-Vagabond

git clone https://github.com/cachrisman/Project-Vagabond.git
git co -b feature_name

rails g scaffold User first_name:string last_name:string email:string:uniq password:digest city:string
rails g scaffold LogPost title:string body:text user:references city:string
rails g controller Sessions new create
rails g controller Site index about contact
