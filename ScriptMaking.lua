-- dont delete this is for synapse and finding functions
local function FindLocal(Name)
    for I,V in pairs(getgc()) do
        if type(V) == "function" and not is_synapse_function(V) then
            for I2,V2 in pairs(debug.getupvalues(V)) do
                if I2 == Name and type(V2) == "number" then return V2 end
            end
        end
    end
end