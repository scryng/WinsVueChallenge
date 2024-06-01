-- Group class definition
Group = {}

-- Constructor Method
function Group:new()
    local group = {}

    -- Attributes
    group.players = {}
    group.status = false
    group.maxPlayers = 5
    group.amountPlayers = 0
    
    -- Methods

    -- Get number of players
    function group:getAmountPlayers()
        return self.amountPlayers
    end
    
    -- Add one more player to the number of current players in the group
    function group:setNewPlayerInAmount()
        if self.amountPlayers < self.maxPlayers then
            self.amountPlayers = self.amountPlayers + 1
        else
            print("Máximo de jogadores do grupo atingido.")
        end
    end
    
    -- Remove a player from the number of current players in the group
    function group:removePlayerOfAmount()
        self.amountPlayers = self.amountPlayers - 1
    end
    
    -- Get status of group is ready
    function group:getStatus()
        return self.status
    end
    
    -- Set status of group is ready
    function group:setStatus(status)
        self.status = status
    end
    
    -- Add a player in this group
    function group:addPlayer(player)
        table.insert(self.players, player)
        self:setNewPlayerInAmount()
    end
    
    -- Get players in this group
    function group:getPlayers()
        return self.players
    end

    -- toString()
    
    function group:toString()
        local sb = "{"
        for i, player in ipairs(self.players) do
            sb = sb .. "[" .. i .. "] = " .. player:toString()
            if i < #self.players then
                sb = sb .. ", "
            end
        end
        sb = sb .. "}"
        return sb
    end
    
    return group
end