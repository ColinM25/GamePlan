# Game Plan - Sports Travel Optimization Tool

## Introduction

**Game Plan** is a comprehensive tool designed to help sports enthusiasts find the optimal game to attend on the road by analyzing travel and ticket costs. By leveraging web scraping, database management, and mathematical optimization, Game Plan identifies the most cost-effective travel plans for attending sports events.

For a more detailed overview and demonstration of the tool’s functionality, visit the [Game Plan Overview](./GamePlanOverview.ipynb) notebook.

## Features

- **Data Collection**:
    - The tool scrapes information on flights, hotels, and game tickets to provide a complete analysis of travel costs.
    - Run the [flight web scraper](./flight_webscraper.ipynb) to collect flight data from Google Flights. Modify the `departloc`, `depart_time`, and `return_time` variables to generate data for each NFL host city.
    - Run the [hotel web scraper](./hotel_webscraper.ipynb) to collect hotel data from Booking.com. Modify the `checkin` and `checkout` variables to generate data for each NFL host city on the specified dates.
    - The [ticket data](./ticket_data.ipynb) notebook collects ticket price data. Due to website restrictions on scraping ticket prices, the current method involves manually updating the `top_prices_data` for each game.

- **Database Management**:
    - A [SQLite database](./nfl_data.db) is created to store the collected data.
    - The three datasets ([flight](ORDflightsWK18.csv), [hotel](hotelsWK18.csv), and [ticket](ticket_prices.csv)) are integrated into the database for analysis using SQL.

- **Cost Analysis**:
    - The [SQL querying](./sql_querying.ipynb) process helps identify the most affordable cities and travel options based on collected data.

- **Optimization Model**:
    - The tool uses an [Optimizer](./optimize.jl) in Julia using GLPK to find the optimal game to attend based on cost factors such as flights, ticket prices, and hotel expenses.

## Installation

To set up the Game Plan project locally, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ColinM25/GamePlan.git

2. **Create Virtual Environment**:
   ```bash
   python -m venv venv
   ```

   - On Windows:
      ```bash
      .\venv\Scripts\activate
      ```
    - On macOS/Linux:
      ```bash
      source venv/bin/activate
      ```
3. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```