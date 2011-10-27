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

    object.speed = 0;

    return object;
end

function P:activate()
    local player = LocalPlayer();

    -- release the mouse
    gui.EnableScreenClicker( true );

    -- set the initial view angle
    player:SetEyeAngles( self.angle );
end

-- If the pointer gets captured somehow this will get called almost
-- immediately to release it and fix the view angle.
function P:InputMouseApply (cmd, x, y, angle)
    gui.EnableScreenClicker( true );
    cmd:SetViewAngles( self.angle );
    return true;
end

function P:CreateMove (cmd)
    local x, y = gui.MousePos();
    local xdelta, ydelta, xdir, ydir = 0, 0, 0, 0;
    local xmax = surface.ScreenWidth() - 1;
    local ymax = surface.ScreenHeight() - 1;
    
    if y <= 3 then
        ydelta = 2 - y;
        y = 2;
        ydir = 1;
    elseif y >= ymax - 3 then
        ydelta = y - ymax + 2;
        y = ymax - 2;
        ydir = -1;
    end

    if x <= 3 then
        xdelta = 2 - x;
        x = 2;
        xdir = -1;
    elseif x >= xmax - 3 then
        xdelta = x - xmax + 2;
        x = xmax - 2;
        xdir = 1;
    end

    if xdir == 0 and ydir == 0 then
        self.speed = 0;
    else
        gui.SetMousePos( x, y );
        
        if xdelta > 0 or ydelta > 0 then
            local max = LocalPlayer():GetMaxSpeed();
            self.speed = math.min( max,
                self.speed + math.floor( max / 100 ) );
        end
    end

    cmd:SetForwardMove( ydir * self.speed );
    cmd:SetSideMove( xdir * self.speed );
end
