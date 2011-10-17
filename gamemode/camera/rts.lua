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

local P = {};
orikum.camera.rts = P;
setmetatable( P, { __index, orikum.camera.base } );

-- forces the player to move parallel to the ground
function P:Move (player, movement)
    movement:SetMoveAngles( Angle( 0, 0, 0 ) );
    return movement;
end

-- forces the player to look north at a 45 degree downward angle
function P:InputMouseApply (cmd, x, y, angle)
    cmd:SetViewAngles( Angle( 45, 0, 0 ) );
    return true;
end

