-- Queue class definition
Queue = {}

-- Constructor Method
function Queue:new(capacity)
    local queue = {}

    -- Attributes
    queue.groups = {}
    queue.capacity = capacity or -1 -- Maximum group capacity in queue (-1 for unlimited)
    
    -- Methods

    -- Add group in the queue
    function queue:enqueue(group)
        if self.capacity ~= -1 and #self.groups >= self.capacity then
            error("A fila está cheia.")
        end
        table.insert(self.groups, group)
    end
    
    -- Remove and return the last group in the queue
    function queue:dequeueLast()
        if #self.groups == 0 then
            error("A fila está vazia.")
        end
        return table.remove(self.groups)
    end
    
    -- Remove a specific group from the queue
    function queue:dequeue(group)
        for i, g in ipairs(self.groups) do
            if g == group then
                table.remove(self.groups, i)
                return group
            end
        end
        error("The especified group not is in this Queue.")
    end

    -- Requeue groups again
    function queue:requeue(completedGroups)
        for _, group in ipairs(completedGroups) do
            self:enqueue(group)
        end
    end
    
    -- Get queue size
    function queue:size()
        return #self.groups
    end
    
    -- Check if the queue is empty
    function queue:isEmpty()
        return #self.groups == 0
    end
    
    -- Get queue groups
    function queue:getGroups()
        return self.groups
    end
    
    -- toString()
    function queue:toString()
        local str = "Queue {groups = {"
        for i, group in ipairs(self.groups) do
            str = str .. group:toString()
            if i < #self.groups then
                str = str .. ", "
            end
        end
        str = str .. "} }"
        return str
    end

    return queue
end
