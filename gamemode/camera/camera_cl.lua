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

--[[
orikum.camera.current = orikum.camera.rts:new();
function orikum.camera.resolve (player)
    return orikum.camera.current;
end
]]

function GM:InputMouseApply (cmd, x, y, angle)
    local impl = orikum.camera.current;
    return impl:InputMouseApply( cmd, x, y, angle );
end

hook.Add( "InitPostEntity", "Camera", function()
    orikum.camera.current:activate();
end );
