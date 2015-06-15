# Project-Vagabond

git clone https://github.com/cachrisman/Project-Vagabond.git
git co -b feature_name

rails g scaffold User first_name:string last_name:string email:string:uniq password:digest city:string
rails g scaffold LogPost title:string body:text user:references
rails g scaffold_controller Sites index about contact
rails g scaffold_controller Sessions new create destroy
