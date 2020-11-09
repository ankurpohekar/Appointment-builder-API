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
`POST /api/v1/account/signup`
`Request`
```
{
"signup":{
  "name": "Test",
  "email": "test@gmail.com",
  "password": "password",
  "password_confirmation": "password"
  }
}
```
`Response`
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
`POST /api/v1/account/signin`
`Request`
```json
{
  "signin":{
    "email": "test@gmail.com",
	"password": "password"
	}
}
```
`Response`
```json
{
  "message": "user signed in successfully",
  "signin": {
    "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJle.....",
    "token_expiery": "11-10-2020 08:29"
   }
}
```
### Get available appointment slots
`GET /api/v1/slots`
`Request`
```json
{
  "slots": [
      {
        "id": 1,
        "name": "Slot-A",
        "start_time": "10 AM"
     },
     {
        "id": 2,
        "name": "Slot-B",
        "start_time": "12 PM"
     },
     {
        "id": 3,
        "name": "Slot-C",
        "start_time": "2 PM"
     },
     {
        "id": 4,
        "name": "Slot-D",
        "start_time": "4 PM"
     },
     {
        "id": 5,
        "name": "Slot-E",
        "start_time": "6 PM"
     }
    ]
}
```
### Get Doctors list
`GET /api/v1/doctors`

`Request`
```json
{
  "doctors": [
    {
      "id": 1,
      "name": "Doctor-1"
    },
    {
      "id": 2,
      "name": "Doctor-2"
    },
    {
      "id": 3,
      "name": "Doctor-3"
    }
  ]
}
```
### Create appointment
`POST api/v1/appointments`
`Request`
```json
{
  "appointment":{
    "date": "2020-2-22",
    "doctor_id": 2,
    "slot_id": 1
  }
}
```
`Response`
```json
{
  "message": "appointment booked successfully",
  "appointment": {
    "id": 1,
    "doctor": "Doctor-2",
    "date": "2020-02-22",
    "time": "10 AM"
  }
}
```
### Get appointment by day, week
`GET /api/v1/appointments?type=<day or week>`
you can pass `type` as a query parameter with values `day` or `week`
`Response`
```json
{
  "appointment": [
    {
      "id": 1,
      "name": "Wick",
      "email": "test02@gmail.com",
      "doctor": "Doctor-2",
      "date": "2020-02-22",
      "time": "10 AM"
    }
  ]
}
```
### Get doctor specific appointments
`GET api/v1/doctors/:id`
```json
{
  "doctor": [
    {
      "doctor": "Doctor-1",
      "date": "2020-02-22",
      "time": "10 AM"
    },
    {
      "doctor": "Doctor-1",
      "date": "2020-02-22",
      "time": "12 PM"
    },
    {
      "doctor": "Doctor-1",
      "date": "2020-02-22",
      "time": "2 PM"
    }
  ]
}
```
