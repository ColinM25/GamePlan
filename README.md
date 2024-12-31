# GamePlan

*Optimizing Travel for Sports Fans*

**Created by Colin Macy**

---

## Introduction

Game Plan is a comprehensive tool designed to help sports enthusiasts find the optimal game to attend on the road by analyzing travel and ticket costs. By leveraging web scraping, database management, and mathematical optimization, Game Plan identifies the most cost-effective travel plans for attending sports events.

## Features

- **Data Collection**:
    - The data collection process involves scraping information on flights, hotels, and game tickets. 

    - You can run the [flight web scraper](./flight_webscraper.ipynb) notebook to collect flight data from Google Flights. Modify the 3 variables: `departloc`, `depart_time`, and `return_time` to generate data for each NFL host city.

    - You can run the [hotel web scraper](./hotel_webscraper.ipynb) notebook to collect hotel data from Booking.com. Modify the `checkin` and `checkout` variables to generate data for each NFL host city on the specified dates.

    - You can run the [ticket data](./ticket_data.ipynb) notebook to collect ticket price data. Currently, ticket websites restrict traffic to prevent bots from sniping ticket data, so each ticket price is manually added for each game by modifying and running `top_prices_data`.

- **Database Management**: 
    - Creates a [database](./nfl_data.db) 
    - Adds all 3 sets of data ([flight](ORDflightsWK18.csv), [hotel](hotelsWK18.csv), [ticket](ticket_prices.csv)) for analysis of host city prices using SQL.

- **Cost Analysis**
    - Analyzes [data](./sql_querying.ipynb) to identify the most affordable cities and travel options.

- **Optimization Model**: 
    - Utilizes Julia to find the [optimal](./optimizer.jl) game to attend based on cost, flights, ticket prices, etc.

## Installation

To set up the Game Plan project locally, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ColinM25/GamePlan.git

## Future Implementation

Ultimately, the goal of GamePlan would be to search and optimize the cheapest weekend to attend a road game within a season for your specified sports team. Many sports enthusiasts look to travel and see their team on the road, and hopefully this tool with allow people to find budget-friendly destinations before the season begins. We can hopefully implement additional constraints and trade-off analysis that can balance budget-friendly with high stakes matchups. 

Want to see the Badgers play on the road? Run the optimizer and find the best game for you based on your budget and quality of matchup preference. 