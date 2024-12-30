using JuMP
using GLPK

# Example data for 5 games: [flight price, ticket price, hotel price]
# Game format: (flight_price, ticket_price, hotel_price)
game_data = [
    (250, 120, 200),  # Game 1
    (220, 140, 180),  # Game 2
    (300, 100, 250),  # Game 3
    (210, 160, 190),  # Game 4
    (270, 130, 220)   # Game 5
]

# Number of games
n_games = length(game_data)

# Create a model with GLPK solver
model = Model(GLPK.Optimizer)

# Define decision variables (binary: 1 if selected, 0 otherwise)
@variable(model, x[1:n_games], Bin)

# Define the objective function: minimize total cost
# Objective: Minimize the total cost
@objective(model, Min, sum(x[i] * (game_data[i][1] + game_data[i][2] + game_data[i][3]) for i in 1:n_games))

# Constraint: Only one game should be selected
@constraint(model, sum(x) == 1)

# Solve the model
optimize!(model)

# Check if the model has a feasible solution
if termination_status(model) == MOI.OPTIMAL
    println("Optimal solution found:")
    for i in 1:n_games
        if value(x[i]) == 1
            total_cost = game_data[i][1] + game_data[i][2] + game_data[i][3]
            println("Attend Game $i with cost: \$$(total_cost)")
        end
    end
else
    println("No optimal solution found.")
end
