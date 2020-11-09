# README


Things you may want to cover:

## Ruby Version
  * `ruby 2.5.0`

## Rails Version
  * `rails 5.2.4`

## Clone repository
  * `git clone git@github.com:ankurpohekar/Appointment-builder.git`

## Database creation
  In the project directory, you can run:
  * `rake db:create db:migrate db:seed`

## Start server
  In the project directory, you can run:
  * `rails server`
  Runs the app in the development mode.


 ## How to run the test suite
  * `rspec spec/controllers/api/v1` run all controller specs
  * `rspec spec/models/` run all model specs
  * `rspec spec/` run all specs

## Code Coverage
  In the project directory
  * `xdg-open coverage/index.html`


## API Endpoints
  ### `Sign up`
  `http://localhost:3000/api/v1/account/signup`
  
  `request`
  
    ```json
    {
			"signup":{
				"name": "Test",
				"email": "test@gmail.com",
				"password": "password",
				"password_confirmation": "password"
			}
		}
		```
	
	`reponse`
	
	```json
	{
    "signup": {
        "name": "Wick",
        "email": "test02@gmail.com"
    },
    "message": "user signed up successfully"
  }
	```

  ### `Sign in`
   `http://localhost:3000/api/v1/account/signin`

    `request`

    ```json
		{
			"signin":{
				"email": "test@gmail.com",
				"password": "password"
			}
		}
    ```

    `response`

    ```json
    {
      "message": "user signed in successfully",
      "signin": {
        "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MDQ5OTY5NjR9.pa5tvxrNdRoZXfHqUEFMcSl7jX9RXOnLkERRSNRmVTo",
        "token_expiery": "11-10-2020 08:29"
      }
    }
    ```