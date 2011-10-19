-- --------- BEGIN LICENSE NOTICE ---------
-- Orikum - a tower defense gamemode for Garry's Mod
-- Copyright (C) 2011 Maltera Dev Team
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- ---------- END LICENSE NOTICE ----------

local P = orikum.camera.fixed;

function P:new (object)
    object = orikum.camera.base.new( self, object );
    object.angle = Angle( 60, 90, 0 );
    return object;
end

function P:activate()
    local player = LocalPlayer();

    -- release the mouse
    gui.EnableScreenClicker( true );

    -- set the initial view angle
    player:SetEyeAngles( self.angle );

    --[[
    hook.Add( "Think", "orikum.camera.fixed", function()
        self:Think();
    end );
    ]]
end

-- If the pointer gets captured somehow this will get called almost
-- immediately to release it and fix the view angle.
function P:InputMouseApply (cmd, x, y, angle)
    gui.EnableScreenClicker( true );
    cmd:SetViewAngles( self.angle );
    return true;
end

--[[
function P:Think()
    local x, y = gui.MousePos();
    local xdisp, ydisp = 0, 0;
    local xmax = surface.ScreenWidth() - 1;
    local ymax = surface.ScreenHeight() - 1;
    
    if y <= 0 then
        y = 0;
        ydisp = 10;
    elseif y >= ymax then
        y = ymax;
        ydisp = -10;
    end

    if x <= 0 then
        x = 0;
        xdisp = 10;
    elseif x >= xmax then
        x = xmax;
        xdisp = -10;
    end

    -- if we don't need to move stop processing now
    if xdisp == 0 and ydisp == 0 then return end
  
    local player = LocalPlayer();
    local pos = player:GetPos();
    local disp = Vector( xdisp, ydisp, 0 );
    
    print( "pos " .. tostring(pos) .. " disp " .. tostring(disp) );
    
    gui.SetMousePos( x + xdisp, y + ydisp );
    -- we need to set the player's position to pos + disp here
    -- unfortunately player:SetPos doesn't work from the client
end
]]
