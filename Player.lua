-- Player class definition
Player = {}

-- Constructor Method
function Player:new(nick, leader)
    local player = {}

    -- Attributes
    player.nick = nick
    player.leader = leader
    player.group = "No group"
    
    -- Methods

    -- Get player nickname
    function player:getNick()
        return self.nick
    end

    -- Get group the player belongs to
    function player:getGroup()
        return self.group
    end

    -- Set group to player    
    function player:setGroup(group)
        self.group = group:toString()
    end
    
    -- Check if the player is a leader
    function player:isLeader()
        return self.leader
    end

    -- toString()
    
    function player:toString()
        return "{nick='" .. player.nick .. "', leader=" .. tostring(player.leader) .. "}"
    end
    
    return player
end
