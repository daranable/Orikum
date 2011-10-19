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

include( 'shared.lua' );

-- don't draw any of the default HUD
local hud_enable = {
    CHudHealth          = false,
    CHudBattery         = false,
    CHudSuitPower       = false,
    CHudCrosshair       = false,
    CHudAmmo            = false,
    CHudSecondaryAmmo   = false,
};
hook.Add( "HUDShouldDraw", "orikum.hud_enable",
    function (element) return hud_enable[ element ] end );
