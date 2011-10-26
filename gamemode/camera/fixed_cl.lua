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
    object.activated = false;

    object.next_forward = 0;
    object.next_side = 0;

    return object;
end

function P:activate()
    local player = LocalPlayer();

    -- release the mouse
    gui.EnableScreenClicker( true );

    -- set the initial view angle
    player:SetEyeAngles( self.angle );

    hook.Add( "Think", "orikum.camera.fixed", function()
        self:Think();
    end );
end

-- If the pointer gets captured somehow this will get called almost
-- immediately to release it and fix the view angle.
function P:InputMouseApply (cmd, x, y, angle)
    if not self.activated then self:activate() end
    gui.EnableScreenClicker( true );
    cmd:SetViewAngles( self.angle );
    return true;
end

function P:CreateMove (cmd)
    cmd:SetForwardMove( self.next_forward );
    cmd:SetSideMove( self.next_side );
    self.next_forward = 0;
    self.next_side = 0;
end

function P:Think()
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

    -- if we don't need to move stop processing now
    if xdir == 0 and ydir == 0 then
        self.speed = 0;
        return
    end
    
    if xdelta > 0 or ydelta > 0 then
        self.speed = math.min( 10000, self.speed + 50 );
    end

    self.next_forward = self.next_forward + ydir * self.speed;
    self.next_side    = self.next_side    + xdir * self.speed;

    gui.SetMousePos( x, y );
end
