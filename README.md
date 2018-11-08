# Makers BnB

[![Build Status](https://travis-ci.org/toddpla/makersbnb.svg?branch=master)](https://travis-ci.org/toddpla/makersbnb)

Week 6 group challenge at Makers Academy: Build a clone of AirBnB, a web application that allows users to list available spaces and make bookings.

Team:
[Muna Hussein](https://github.com/MHUS25),
[Reka Pap](https://github.com/rekapap),
[Naomi Bid](https://github.com/NaomiBid) &
[Todd Langford Archer](https://github.com/toddpla)


#### 1. [Learning Journey](https://github.com/toddpla/makersbnb/wiki/Team-Learning-Journey)
#### 2. [App in Production](https://limitless-wildwood-70080.herokuapp.com/)
#### 3. [Installation & Deployment Instructions](https://github.com/toddpla/makersbnb/wiki/Installation-&-Deployment)
#### 4. [Running Tests](https://github.com/toddpla/makersbnb/wiki/Running-Tests)
#### 5. [Project Contribution](https://github.com/toddpla/makersbnb/wiki/Project-Contribution)


## Technologies used

* Backend: Ruby/Sinatra
* Frontend: JavaScript, HTML, CSS
* Testing: RSpec & Capybara
* ORM: Active Record

## Motivations for this project

* Work as part of a team to build a web app with only a specification to guide us
* Use the XP values to guide behaviour
* Follow a developer workflow (Creating issues, branching, reviewing, squirrelling, merging.)
* Keep code quality and test coverage high whilst building new features

## Approach

* Focus on getting a minimum viable product first
* Run team standups and retrospectives daily
* Use a Kanban board to organise workflow
* Pair Programming on implementing user stories
* Review each other’s PRs before merging
* Test driven development

## User Stories
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

As a tenant
So that I don't book somewhere unavailable
unavailable spaces should not be able to be booked

As a landlord
So that I can take multiple requests
I want the space to remain available until confirmed
```

### Bonus User Stories

# Setup
create database
```
rake db:create
```
=======
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

## To set up databases

To set up the test database, run the command:
```rake db:test:prepare```

To set up the development database, run the command:
```rake db:migrate```
