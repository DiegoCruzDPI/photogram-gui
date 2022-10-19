class PhotosController <ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})
    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    #Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb"})
  end

  def baii
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photo_templates/baii.html.erb"})
    #we can also redirect if the page we end up on is not really needed!!!!!
    redirect_to("/photos")
  end

  def create
    #the quereys are the names that we used  for our inputs and now they hold the value of what the use inputed!!!
#  Parameters: {"query_image"=>"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgWFRUYGRgaGhoYGhgcGhwjGRwaGhocGh4eGRkcIS4lIR4rJBgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHxISHzQhJSE0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0PzQ0NDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAAAwQCBQYBBwj/xABBEAABAwEECAQEBAMGBwEAAAABAAIRAwQSITEFBkFRYXGB8JGhscEHIjLRE1Lh8RRCkxZEU3KS0hdDVGOCorIV/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAIBAwT/xAAgEQEBAQEAAgMBAAMAAAAAAAAAARECEiEDMUFRImFx/9oADAMBAAIRAxEAPwD7MiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIPFDarQymx1R7g1rWlznHINaJJ8Ap1z2tNMVKT6UOc57HANAblBky4YRzA8ROW5GybVPRuv9irODRUcwnI1G3QeuQPAwV1LagIkEEbwV+bqtENBB2S09DBkbl3Gq+gH3GudWfdEPY1rjdbtwxyPe2c8l3iPri8lc9Rs7nfU9ziN7jAUGkqRaxxkjAkkZgb0tyamT3jf2u306bS6pUa1oBJLnAYDNfF9a9fbRaKrhZaj6NBmDbuD3kH6nEYgGMG7s8TA5rWCpVfXNJ7zUuRBwzLWzAHKOY4qzZbHdGMgjOYgRsJGR5p5KnMfR/hfre+0TZbQSarG32VDm9ggG8fzCRjtB4FfR1+baWkH2SvTtDAC+m+8AcnNILXNJ3EE48l+hNF6SZXptew/U1rrp+psgGHDYcVsqeucX0RFqRERAREQEREBERAREQEREBERAREQEREBERAREQEREGD3ACSYAxXP24gNc95m+cQHEODQcGy3YPy7ycSt7Vp3ru", "query_catpion"=>"dsd", "query_owner_id"=>"dasd"}
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image

    a_new_photo.caption = input_caption

    a_new_photo.owner_id = input_owner

    a_new_photo.save

    # render({ :template => "photo_templates/create.html.erb"})
    redirect_to("/photos/" + a_new_photo.id.to_s)
  end
end
