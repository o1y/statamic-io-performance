#!/bin/bash

total_time=0
num_requests=10

for ((i=1; i<=$num_requests; i++))
do
    response_time=$(curl -s -w "%{time_total}\n" -o /dev/null https://localhost/)

    # Convert response_time to milliseconds
    response_time_ms=$(echo "scale=2; $response_time * 1000" | bc)

    # Add response_time_ms to total_time
    total_time=$(echo "$total_time + $response_time_ms" | bc)

    # Print individual response time
    echo "Response time [Request $i]: $response_time_ms ms"
done

# Calculate average_time as milliseconds
average_time=$(echo "scale=2; $total_time / $num_requests" | bc)

echo "Average response time: $average_time ms"
