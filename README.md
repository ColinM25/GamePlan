# GamePlan

*Optimizing Travel for Sports Fans*

**Created by Colin Macy**

---

## Introduction

Game Plan is a comprehensive tool designed to help sports enthusiasts find the optimal game to attend on the road by analyzing travel and ticket costs. By leveraging web scraping, database management, and mathematical optimization, Game Plan identifies the most cost-effective travel plans for attending sports events.

## Features

- **Data Collection**:

The data collection process involves scraping information on flights, hotels, and game tickets. 

You can run the [flight web scraper](./flight_webscraper.ipynb) notebook to collect flight data from Google Flights. Modify the 3 variables: departloc, depart_time, and return_time to generate data to each NFL host city.

You can run the [hotel web scraper](./hotel_webscraper.ipynb) notebook to collect hotel data from Booking.com. Modify the checkin and checkout variables to generate data for each NFL host city on the specified dates. 

You can run the [ticket data](./ticket_data.ipynb) notebook to collect ticket price data. Currently, ticket websites restrict traffic to prevent bots from sniping ticket data so each ticket price is manually added for each game by modifying and running top_prices_data.

- **Database Management**: Creates a database and adds all 3 sets of data for analysis of host city prices using SQL. 
- **Cost Analysis**: Analyzes data to identify the most affordable cities and travel options.
- **Optimization Model**: Utilizes Julia to determine the optimal game to attend based on cost, flights, ticket prices, etc. 

## Installation

To set up the Game Plan project locally, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ColinM25/GamePlan.git