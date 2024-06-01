-- Match class definition
Match = {}

-- Constructor Method
function Match:new(groups)
    local match = {}

    -- Attributes
    match.attackers = {}
    match.defenders = {}

    -- Add all players on list and add all groups on other list
    local allPlayers = {}
    local allGroups = {}
    for _, group in ipairs(groups) do
        table.insert(allGroups, group)
        for _, player in ipairs(group:getPlayers()) do
            table.insert(allPlayers, player)
        end
    end

    -- Method for forming teams
    local function formTeams(allPlayers)

        local index = 1
        
        while index <= #allPlayers and #match.attackers < 5 and #match.defenders < 5 do
            -- Add players to the attackers team
            if #match.attackers < 5 then
                table.insert(match.attackers, allPlayers[index])
            end
            index = index + 1

            -- Add players to the defenders team
            if #match.defenders < 5 and index <= #allPlayers then
                table.insert(match.defenders, allPlayers[index])
            end
            index = index + 1
        end
    end

    -- Make the teams with all players in the queue
    formTeams(allPlayers)

    -- Get attacker players
    function match:getAttackers()
        return match.attackers
    end

    -- Get defender players
    function match:getDefenders()
        return match.defenders
    end

    -- Get groups in match
    function match:getGroups()
        return allGroups
    end    

    return match
end
