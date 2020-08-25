# Sweater Weather
Developed with guidelines from [Turing Mod 3](https://backend.turing.io/module3/projects/sweater_weather/)

Sweater weather is an API that uses third party APIs for a front-end that requires current, hourly, and week forecasts, as well as an image for a given location.

## Versions
- Ruby 2.5.3
- Rails 5.1.7

## Table of contents
- [About](#sweater-weather)
- [Versions](#versions)
- [Table of contents](#table-of-contents)
- [APIs used](#apis-used)
- [Setup](#setup)
- [Testing](#testing)
- [Endpoints](#endpoints)
  - [Forecast](#forecast)
  - [Backgrounds](#backgrounds)
  - [Users](#users)
  - [Sessions](#sessions)
- [Authors](#authors)

## APIs Used
- [Google Directions](https://developers.google.com/maps/documentation/directions/overview)
- [Google Places](https://developers.google.com/places/web-service/search)
- [Google Geocoding](https://developers.google.com/maps/documentation/geocoding/overview)
- [OpenWeather API](https://openweathermap.org/api/one-call-api)

## Setup
- `git clone git@github.com:DavidTTran/sweater_weather.git`
- `bundle` to install dependencies
- `rails s` to run the server locally

## Testing
- Tested with RSpec
- `bundle exec rspec` to run test suite

## Endpoints

### Forecast
- Accepts a location parameter
- GET request to `localhost:3000/api/v1/forecast?location=denver,co`
- Successful response
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "location": {
                "location": "Denver, CO, USA",
                "longitude": -104.990251,
                "latitude": 39.7392358
            },
            "hourly": [
                {
                    "dt": 1598382000,
                    "temp": 307.05,
                    "feels_like": 305.64,
                    "pressure": 1004,
                    "humidity": 24,
                    "dew_point": 283.66,
                    "clouds": 0,
                    "visibility": 10000,
                    "wind_speed": 2.26,
                    "wind_deg": 83,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ],
                    "pop": 0
                }, ...
             "daily": [
                {
                    "dt": 1598382000,
                    "sunrise": 1598358131,
                    "sunset": 1598406120,
                    "temp": {
                        "day": 307.05,
                        "min": 298.55,
                        "max": 308.43,
                        "night": 298.62,
                        "eve": 301.41,
                        "morn": 307.05
                    },
                    "feels_like": {
                        "day": 305.87,
                        "night": 295.97,
                        "eve": 296.93,
                        "morn": 305.87
                    },
                    "pressure": 1004,
                    "humidity": 24,
                    "dew_point": 283.66,
                    "wind_speed": 1.94,
                    "wind_deg": 64,
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": 0,
                    "pop": 0.92,
                    "rain": 1.95,
                    "uvi": 9.71
                }, ...
             "current": {
                 "date_time": 1598382398,
                 "sunrise": 1598963324,
                 "sunset": 1599010275,
                 "temperature": {
                    "day": 293.34,
                    "min": 286.89,
                    "max": 298.53,
                    "night": 293.76,
                    "eve": 298.53,
                    "morn": 287.15
                 },
                 "feels_like": {
                    "day": 289.98,
                    "night": 290.32,
                    "eve": 293.41,
                    "morn": 282.4
                 },
                 "humidity": 23,
                 "clouds": 52,
                 "uvi": 8.64,
                 "weather": [
                    {
                       "id": 800,
                       "main": "Clear",
                       "description": "clear sky",
                       "icon": "01d"
                    }
                ]
            }
        }
    }
}
```

### Backgrounds
- Accepts a location parameter
- GET request to `localhost:3000/api/v1/backgrounds?location=denver,co`
- Successful response
```
{
    "data": {
        "id": "1",
        "type": "background",
        "attributes": {
            "url": "https://maps.googleapis.com/maps/api/place/photo?key=AIzaSyDCB9VDVu9FXuWRu0wHXN_4RhJZ0DpYSNk&maxwidth=1080&photoreference=CmRaAAAAlruineQNnm6gcf6K004tqSq83uCgX_sYe0HiDUNPkI2E-YkWCh6IlPCUZUePsvwi4TtV0qALHVYxkfwAvZSSS76v6AwA4Rv44wZjAKBmVai5XDMppHHwFq2oskbNPF1OEhCKcha6tFd89P9sHUQi8bv1GhSv0ZEp3eJCKZiaJGJKgtndm9qBFA"
        }
    }
}
```

### Users
- Accepts an email, password, password_confirmation
- POST request to `localhost:3000/api/v1/users?email=bob@example.com&password=example&password_confirmation=example`
- Successful response
```
{
    "data": {
        "id": "4",
        "type": "user",
        "attributes": {
            "email": "bob@example.com",
            "api_key": "8ae21ab4-c92e-41c3-a63e-9f20a299c6da"
        }
    }
}
```
- Unsuccessful response (taken email)
```
{
    "status": 400,
    "errors": [
        "Email has already been taken"
    ]
}
```

- Unsuccessful response (invalid passwords)
```
{
    "status": 400,
    "errors": [
        "Email has already been taken",
        "Password confirmation doesn't match Password"
    ]
}
```

### Sessions
- Accepts an email and password
- POST request to `localhost:3000/api/v1/sessions`
  - Login information, in JSON, included in the body of the request 
```
{
    "email": "bob@example.com",
    "password": "example"
}
```

- Successful response
```
{
    "data": {
        "id": "5",
        "type": "user",
        "attributes": {
            "email": "test1@example.com",
            "api_key": "edc3e47b-9350-4764-9e3b-701a0f5ff170"
        }
    }
}
```

## Authors
[David Tran](https://github.com/DavidTTran)
