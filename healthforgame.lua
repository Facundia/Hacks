local health = 100
local isGameOver = false

function updateGameLogic(dt)

    health = health - dt * 10  -- Example: Health decreases over time
    
    if health <= 0 then
        isGameOver = true
    end
end

function love.update(dt)
    if not isGameOver then
        updateGameLogic(dt)
    end
end

function love.draw() -- Draw game elements, including health bar
    
    -- Draws the "Game Over" screen if the game is over
    if isGameOver then
        love.graphics.print("Game Over", love.graphics.getWidth()/2 - 40, love.graphics.getHeight()/2)
    end
end
