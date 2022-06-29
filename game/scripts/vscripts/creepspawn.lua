require("timers")
function jungle1()
    local count = 0
    Timers:CreateTimer(0,function ()
        count = count + 1
        for i = 1, 2 do
            CreateUnitByName("npc_dota_bear", Vector(2005,-2005,0), true, nil, nil, DOTA_TEAM_NEUTRALS)
        end
        if count == 5 then
            return Timers:RemoveTimer()
        else
            return 60
        end
    end)
  local count = 0
    Timers:CreateTimer(300,function ()
        count = count + 1
        for i = 1, 2 do
            CreateUnitByName("npc_dota_neutral_mud_golem", Vector(2005,-2005,0), true, nil, nil, DOTA_TEAM_NEUTRALS)
        end
        if count == 5 then
            return Timers:RemoveTimer()
        else
            return 60
        end
    end)
end
function creep_die()
end