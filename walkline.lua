local enemy = {
    x = 0,
    y = 0,
    speed = 100,
    currentWaypointIndex = 1,
    waypoints = {
        { x = 100, y = 100 },
        { x = 200, y = 200 },
        { x = 300, y = 100 },
        -- Other waypoints for enemies
    }
}

function updateEnemy(dt)
    local currentWaypoint = enemy.waypoints[enemy.currentWaypointIndex]
    local dx = currentWaypoint.x - enemy.x
    local dy = currentWaypoint.y - enemy.y
    local distanceToWaypoint = math.sqrt(dx*dx + dy*dy)

    -- This checks if the enemy has made it to the waypoint
    if distanceToWaypoint <= 1 then
        -- This moves the enemy to the next waypoint
        enemy.currentWaypointIndex = enemy.currentWaypointIndex + 1

        -- This checks if they made it through the waypoints
        if enemy.currentWaypointIndex > #enemy.waypoints then
            -- Do something when the enemy reaches the end of the path
            
        end
    else
        -- This calculates the unit vector to the current waypoint
        local directionX = dx / distanceToWaypoint
        local directionY = dy / distanceToWaypoint

        -- This moves the enemy towards the current waypoint
        enemy.x = enemy.x + directionX * enemy.speed * dt
        enemy.y = enemy.y + directionY * enemy.speed * dt
    end
end

function love.update(dt)
    updateEnemy(dt)
end

function love.draw()
    love.graphics.circle("fill", enemy.x, enemy.y, 10)
    
    -- This draws the line path using the waypoints
    for i = 1, #enemy.waypoints - 1 do
        love.graphics.line(enemy.waypoints[i].x, enemy.waypoints[i].y, enemy.waypoints[i + 1].x, enemy.waypoints[i + 1].y)
    end
end
