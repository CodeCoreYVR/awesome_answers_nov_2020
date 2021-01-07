Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # we map HTTP verb/url combo to a controller#action (action is a method inside the controller class)

  get("/",{to: "welcome#index"}) 
  # The route above specifies that when your application receives a `GET` request with the URL `/` Rails will handle this request by the `WelcomeController` class and `index` method within that class.
  get("/contact",{to:"contact#index"})# First we have to fetch the form
  post("/contact_submit",{to:"contact#create", as: "contact_submit"})# Then we have to decide where to send the user once form is submitted

end
