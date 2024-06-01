-- Importing Player, Group, Queue and Match classes
dofile("Player.lua")
dofile("Group.lua")
dofile("Queue.lua")
dofile("Match.lua")

-- Instantiating players using the Player class and adding them to groups with the Group class

-- Grupo 1 and respective players.
local player1 = Player:new("ViperGT", true)
local group1 = Group:new()
group1:addPlayer(player1)
player1:setGroup(group1)

-- Grupo 4 and respective players.
local player2 = Player:new("BlazeGamer", false)
local player3 = Player:new("SpeedRacer", false)
local player4 = Player:new("ShadowNinja", true)
local player5 = Player:new("PhoenixFire", false)
local group4 = Group:new()
group4:addPlayer(player2)
group4:addPlayer(player3)
group4:addPlayer(player4)
group4:addPlayer(player5)
player2:setGroup(group4)
player3:setGroup(group4)
player4:setGroup(group4)
player5:setGroup(group4)

-- Grupo 6 and respective players.
local player6 = Player:new("ThunderBolt", true)
local player7 = Player:new("GhostRider", false)
local group6 = Group:new()
group6:addPlayer(player6)
group6:addPlayer(player7)
player6:setGroup(group6)
player7:setGroup(group6)

-- Grupo 9 and respective players.
local player8 = Player:new("NeonSpectre", false)
local player9 = Player:new("DriftKing", true)
local group9 = Group:new()
group9:addPlayer(player8)
group9:addPlayer(player9)
player8:setGroup(group9)
player9:setGroup(group9)


-- Grupo 10 and respective players.
local player10 = Player:new("MidnightWolf", true)
local group10 = Group:new()
group10:addPlayer(player10)
player1:setGroup(group10)


print("")
print("Group 1: " .. group1:toString())
print("Group 4: " .. group4:toString())
print("Group 6: " .. group6:toString())
print("Group 9: " .. group9:toString())
print("Group 10: " .. group10:toString())

-- Simulating that the team is ready to join the queue
group1:setStatus(true)
group4:setStatus(true)
group6:setStatus(true)
group9:setStatus(true)
group10:setStatus(true)

-- Creating Queue
local queue = Queue:new()

-- Adding teams that have true status to the queue
if group1:getStatus() == true then
    queue:enqueue(group1)
end
if group4:getStatus() == true then
    queue:enqueue(group4)
end
if group6:getStatus() == true then
    queue:enqueue(group6)
end
if group9:getStatus() == true then
    queue:enqueue(group9)
end
if group10:getStatus() == true then
    queue:enqueue(group10)
end

print("")
print("Queue: " .. queue:toString())
print("")

-- Creating the match using queue groups
local groupsInQueue = queue:getGroups()
local match = Match:new(groupsInQueue)

-- Removing teams that started the match from the queue and setting status to false
group1:setStatus(false)
queue:dequeue(group1)
group4:setStatus(false)
queue:dequeue(group4)
group6:setStatus(false)
queue:dequeue(group6)
group9:setStatus(false)
queue:dequeue(group9)
group10:setStatus(false)
queue:dequeue(group10)

local attackersOutput = "Attacker players: "
for i, player in ipairs(match:getAttackers()) do
    if i > 1 then
        attackersOutput = attackersOutput .. ", "
    end
    attackersOutput = attackersOutput .. player:getNick()
end
print("")
print(attackersOutput)

local defendersOutput = "Defender players: "
for i, player in ipairs(match:getDefenders()) do
    if i > 1 then
        defendersOutput = defendersOutput .. ", "
    end
    defendersOutput = defendersOutput .. player:getNick()
end
print("")
print(defendersOutput)
print("")

-- Game timing simulation
for i = 15, 0, -1 do
    print("Remaining time " .. i .. " seconds.")
end

-- Simulation of players returning to the queue
queue:requeue(match:getGroups())

print("")
print("Queue after game: " .. queue:toString())