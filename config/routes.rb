Rails.application.routes.draw do
  get("/", { :controller => "users", :action =>"index"})

  get("users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action =>"show"})

  get("/delete_photo/:toast_id", { :controller => "photos", :action => "baii"})

  get("/insert_photo", { :controller => "photos", :action => "create" })

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})

  get("/update_user_name/:change_name", { :controller => "users", :action => "update_name"})

  get("/create_comment/:modify_comments", { :controller => "photos", :action => "comment_create"})

  get("/add_user/", { :controller => "users", :action => "additional_user"})

end
