class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users= matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index.html.erb"})
  end

    def show
    #Parameters: {"path_username"=>"afjidsnfajndfladjf"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.first
# if we wanted to redirect to a 404 page
      # if the_user == nil
      #   redirect_to("/404")
      # else
        render( :template => "user_templates/show.html.erb")
      # end
    end

    def additional_user

      input_user = params.fetch("query_user")

      new_user = User.new

      new_user.username = input_user 
      
      new_user.save

      redirect_to( "/users/" + new_user.username.to_s)
    end

    def update_name
      the_name = params.fetch("change_name")

      this_name = User.where( :username => the_name)

      new_name = this_name.at(0)

      input_username = params.fetch("query_username")

      new_name.username = input_username

      new_name.save

      next_user_url = "/users/" + new_name.username.to_s

      redirect_to(next_user_url)

    end
end
