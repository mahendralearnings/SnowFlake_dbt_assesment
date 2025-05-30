# Snowflake Technical test

##  System
We have a simple system where landing, weather, pilot and airport data arrives in json

There are many weather reports arriving every 5 minutes and landing data on touchdown. Pilot and airport data is fairly static although changes do happen.

## Test data

Below are some examples of the data


For the flights data:
```json
{
  "landing": {
    "flight": "BA551",
    "callsign":"BAW551",
    "model": "Airbus A320-232",
    "tail": "G-EUUY",
    "touchdown_time": "2025-01-30T09:18:05Z",
    "pilotId": 1,
    "airportCode": "LHR"
  }
}
```

For the weather data:
```json
{
  {
    "ts": "2025-01-30T09:16:05Z",
    "airportCode": "LHR",
    "temperature": "3"
  },
  {
    "ts": "2025-01-30T09:17:05Z",
    "airportCode": "LHR",
    "temperature": "4"
  }
}
```

For the pilot data:
```json
{
    "pilotId": 1,
    "pilotFirstName": "Bob",
    "pilotSecondName": "Smith",
    "grade": 3,
    "dob": "01/01/1990",
    "favoriteFood": "Curry"
}
```

For the airport data
```json
{
  "airportCode": "LHR",
  "AirportFriendlyName": "London Heathrow",
  "Latitude": 51.470020,
  "Longitude": -0.454295
}
```

## Data requirements

Landing data is transactional and immutable

Weather data is transactional and immutable

Pilot data is dimensional and mutable. We need to record the history of changes over time for a pilot's data but are only interested when either the pilotFirstName, pilotSecondName or grade change.

Airport Data is dimensional and mutable. We only need to keep the latest data for an airport

## Consumer requirements

The first consumer has a requirement for the data to be a de-normalised so that it shows the latest weather record at the time the plane touched down along with the pilot data. However it can't view any of the pilot's personal data, these need to be obscured

The second consumer has the same requirement for the de-normalised data however it will have permissions to see all the pilot's personal data. 

Example output for consumer with full pilot details


| **Flight** | **Callsign** | **Model**       | **Tail** | **Touchdown Time**     | **Pilot ID** | **AirportName**       | **Temperature** | **Pilot Name**       | **Grade** | **DOB**       |
|------------|--------------|-----------------|----------|------------------------|--------------|-----------------------|-----------------|----------------------|-----------|---------------|
| BA551      | BAW551       | Airbus A320-232 | G-EUUY   | 2025-01-30T09:18:05Z   | 1            | London Heathrow       | 4               | Bob Smith            | 6         | 01/01/1970    |
| VS342      | VIR342       | Boeing 787-9    | G-VNEW   | 2025-01-31T08:15:00Z   | 2            | Manchester            | 4               | Alice Johnson        | 5         | 15/05/1975    |
| UA958      | UAL958       | Boeing 767-300  | N670UA   | 2025-01-31T08:45:00Z   | 3            | Birmingham            | 4               | Charlie Brown        | 4         | 30/09/1980    |
| FR667      | RYR667       | Boeing 737-800  | EI-DCL   | 2025-01-31T09:00:00Z   | 4            | Glasgow               | 4               | Dave Williams        | 3         | 25/12/1990    |


There are 4 files which contain the data to assist with your testing. Airport.json, Landing.json, Pilot.json and Weather.json, this is to get you started however in order to test all the requirements you may need more.

This data will land into an internal snowflake stage to keep it simple and not rely on exeternal resources like S3

Depending on your solution you may want a different version of Snowflake

## Assessment

These are the following areas we will be assessing on

* Security model
* Fact and dimensional modelling
* Data processing
* Code quality
* Test data
* Testing

## Output

Create one or more SQL files to deploy the snowflake objects, test data and any data processing

Please create a Instruction.md file on how to deploy into Snowflake and test

For a free Snowflake account sign up here https://signup.snowflake.com/?utm_cta=trial-en-www-homepage-top-right-nav-ss-evg&_ga=2.74406678.547897382.1657561304-1006975775.1656432605&_gac=1.254279162.1656541671.Cj0KCQjw8O-VBhCpARIsACMvVLPE7vSFoPt6gqlowxPDlHT6waZ2_Kd3-4926XLVs0QvlzvTvIKg7pgaAqd2EALw_wcB

You can use any snowflake objects to help you satisfy the requirements outlined

If there feaure that you would like to use but can't because of external dependencies please highlight this in the readme file and use another to complete the test.


