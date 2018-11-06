
# makersbnb
[![Build Status](https://travis-ci.org/toddpla/makersbnb.svg?branch=master)](https://travis-ci.org/toddpla/makersbnb)

This repository is for the week 6 group challenge at Makers Academy. The challenge is to make a clone of AirBnB using whatever technology we like. We have chosen to use Javascript for back and front end systems.

### User Stories

```text
As a landlord
So that I list a space
I want to create an account

As a website administrator,
So that I can provide a better service
I don't want users to register with emails that are already registered.

As a website administrator,
So that I can provide a better service
I want to encrypt the passwords.

As a website administrator,
So that I can provide a better service
I want users to be able to login with their email and their correct password only

As a landlord
So I can list more than one space
I want to be able to list multiple spaces

As a landlord
So I can advertise my place more effectively
I want to name my space with a description and price per night

As a tenant
So that I can rent a space
I want to be able to make a booking request for one night

As a landlord
So that I can choose the best tenant
I want to review requests before confirming

As a tenant
So that I know that the place is confirmed
I want to see that my request has been confirmed

As a tennant
So that I don't book somewhere unavailable
unavailable spaces should not be able to be booked

As a landlord
So that I can take multiple requests
I want the space to remain available until confirmed
```

### Bonus User Stories

```text
As a website administrator,
So that I can provide a better service
I want to send emails to the users.

As a user
So that I know that my registration is confirmed
I want to receive an email about it.

As a landlord
So that I know that my listing is confirmed
I want to receive an email about it.

As a landlord
So that I know that my listing update is confirmed
I want to receive an email about it.

As a landlord
So that I know that my listing is bookable
I want to receive an email about it.

As a landlord
So that I know that my booking confirmation went through
I want to receive an email about it.

As a tenant
So that I know that my request was received
I want to receive an email about it.

As a tenant
So that I know my booking request was confirmed
I want to receive an email about it.

As a tenant
So that I know my booking request was denied
I want to receive an email about it.

As a tenant
So that I know that my request was received
I want to receive an SMS about it.

As a tenant
So that I know my booking request was confirmed
I want to receive an SMS about it.

As a tenant
So that I know my booking request was denied
I want to receive an SMS about it.

As a user,
So that I can communicate better
I want to chat with the landlord/tenant of a confirmed booking.

As a tenant,
So that I can make payments more easily 
I want pay through MakersBNB.

```


# Setup

test database
```
rake db:test:prepare
```
development
```
rake db:migrate
