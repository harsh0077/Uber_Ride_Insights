Description
This SQL project involves analyzing a simulated dataset inspired by the operations of a ride-hailing service like Uber. The dataset comprises three core tables: 'Rides,' 'Drivers,' and 'Passengers,' each offering unique insights into the dynamics of the ride-hailing business. Our goal is to use SQL queries and techniques to extract meaningful insights, explore trends, patterns, and relationships within the dataset, and provide recommendations to enhance operational efficiency and customer experience.

Dataset Description
The dataset consists of the following tables:

Rides Table
ride_id: Unique identifier for each ride.
driver_id: Identifier for the driver who conducted the ride.
passenger_id: Identifier for the passenger who took the ride.
pickup_location: Location where the ride started (pickup point).
dropoff_location: Location where the ride ended (dropoff point).
ride_distance: Distance covered during the ride (in kilometers or miles).
ride_duration: Duration of the ride in minutes.
ride_timestamp: Date and time when the ride took place.
fare_amount: Fare charged for the ride.
payment_method: Method used for payment (e.g., "Credit Card," "Cash").
Drivers Table
driver_id: Unique identifier for each driver.
driver_name: Full name of the driver.
join_date: Date when the driver joined the service.
rating: Average rating of the driver based on passenger feedback.
total_rides: Total number of rides completed by the driver.
earnings: Total earnings of the driver.
Passengers Table
passenger_id: Unique identifier for each passenger.
passenger_name: Full name of the passenger.
signup_date: Date when the passenger signed up for the service.
total_rides: Total number of rides taken by the passenger.
total_spent: Total amount spent by the passenger on rides.
rating: Average rating given by drivers to the passenger.
