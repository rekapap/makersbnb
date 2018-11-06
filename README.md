# Makers BnB

[![Build Status](https://travis-ci.org/toddpla/makersbnb.svg?branch=master)](https://travis-ci.org/toddpla/makersbnb)

Week 6 group challenge at Makers Academy: Build a clone of AirBnB, a web application that allows users to list available spaces and make bookings.

Team:
[Muna Hussein](https://github.com/MHUS25),
[Reka Pap](https://github.com/rekapap),
[Naomi Bid](https://github.com/NaomiBid) &
[Todd Langford Archer](https://github.com/toddpla)

## Technologies used

* Backend: Ruby/Sinatra
* Frontend: JavaScript, HTML, CSS
* Testing: RSpec & Capybara
* ORM: Active Record

## Motivations for this project

* Work as part of a team to build a web app with only a specification to guide us
* Use the XP values to guide behaviour
* Follow the a developer workflow (Creating issues, branching, reviewing, squirrelling, merging.)
* Keep code quality and test coverage high whilst building new features

## Approach

* Focus on getting a minimum viable product first
* Run team standups and retrospectives daily
* Use a Kanban board to organise workflow
* Pair Programming on implementing user stories
* Review each other’s PRs before merging
* Test driven development

## User Stories
```
As a landlord
So that I list a space
I want to create an account

As a landlord
So I can list more than one space
I want to be able to list multiple spaces

As a landlord
So I can advertise my place more effectively
I want to name my space with a description and price per night

As a tenant
So that I can rent a space
I want to be able to make a request

As a landlord
So that I can choose the best tenant
I want to review requests before confirming

As a user
so that I know that the place is confirmed
I want to see that my request has been confirmed

As a user
So that I don't book somewhere unavailable
unavailable spaces should not be able to be booked

As a landlord
So that I can take multiple requests
I want the space to remain available until confirmed
```

## To set up databases

test database
`rake db:test:prepare`

development database
`rake db:migrate`
