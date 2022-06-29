function tp1(event)
  if event.activator:IsHero() then 
    Timers:CreateTimer(3.3,function ()
        local ent = Entities:FindByName( nil, "pnt1") --строка ищет как раз таки нашу точку pnt1
        local point = ent:GetAbsOrigin() --эта строка выясняет где находится pnt1 и получает её координаты
        event.activator:SetAbsOrigin(point) -- получили координаты, теперь меняем место героя на pnt1
        FindClearSpaceForUnit(event.activator, point, false) --нужно чтобы герой не застрял
        event.activator:Stop() --приказываем ему остановиться, иначе он побежит назад к предыдущей точке
        return Timers:RemoveTimer()
    end)
  end
end