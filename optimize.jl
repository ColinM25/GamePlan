using JuMP
using GLPK
using CSV
using DataFrames

# Load data
flights = CSV.read("data/WCflights.csv", DataFrame)
hotels = CSV.read("data/WChotels.csv", DataFrame)
tickets = CSV.read("data/WCtickets.csv", DataFrame)

# Parameters
budget = 10000  # Example budget, you can adjust as needed
num_travelers = 4
min_rating = 3.0  # Minimum hotel rating
min_tier = 2      # Minimum ticket tier

# Initialize the model
model = Model(GLPK.Optimizer)

# Sets and variables
@variable(model, x_f[1:size(flights, 1)], Bin)  # Flight decision variables
@variable(model, x_h[1:size(hotels, 1)], Bin)  # Hotel decision variables
@variable(model, x_t[1:size(tickets, 1)], Bin) # Ticket decision variables

# Objective function
@objective(model, Min, 
    sum(flights.Price[i] * x_f[i] for i in 1:size(flights, 1)) +
    (1 / num_travelers) * sum(hotels.Price[j] * x_h[j] for j in 1:size(hotels, 1)) +
    sum(tickets.Price[k] * x_t[k] for k in 1:size(tickets, 1))
)

# Constraints
# 1. Budget constraint
@constraint(model, 
    sum(flights.Price[i] * x_f[i] for i in 1:size(flights, 1)) +
    (1 / num_travelers) * sum(hotels.Price[j] * x_h[j] for j in 1:size(hotels, 1)) +
    sum(tickets.Price[k] * x_t[k] for k in 1:size(tickets, 1)) <= budget
)

# 2. Hotel rating constraint
@constraint(model, [j in 1:size(hotels, 1)], 
    x_h[j] * hotels.Rating[j] >= min_rating * x_h[j])

# 3. Ticket tier constraint
@constraint(model, [k in 1:size(tickets, 1)], 
    x_t[k] * tickets.Tier[k] <= max_ticket_tier * x_t[k])

# 4. Room accommodation constraint
@constraint(model, [j in 1:size(hotels, 1)],
    x_h[j] * hotels.Room_Type[j] >= num_travelers * x_h[j])

# Solve the model
optimize!(model)

# Display results
if termination_status(model) == MOI.OPTIMAL
    println("Optimal total cost: ", objective_value(model))
    println("Selected flights:")
    for i in 1:size(flights, 1)
        if value(x_f[i]) > 0.5
            println(flights[i, :])
        end
    end
    println("Selected hotels:")
    for j in 1:size(hotels, 1)
        if value(x_h[j]) > 0.5
            println(hotels[j, :])
        end
    end
    println("Selected tickets:")
    for k in 1:size(tickets, 1)
        if value(x_t[k]) > 0.5
            println(tickets[k, :])
        end
    end
else
    println("No optimal solution found.")
end
