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
    object.angle = Angle( 45, 0, 0 );
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
