
-- WolfAdmin module for Wolfenstein: Enemy Territory servers.
-- Copyright (C) 2015-2017 Timo 'Timothy' Smit

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- at your option any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

local auth = require (wolfa_getLuaPath()..".auth.auth")

local commands = require (wolfa_getLuaPath()..".commands.commands")

local greetings = require (wolfa_getLuaPath()..".players.greetings")

function commandGreeting(clientId, command)
    local greeting = greetings.get(clientId)
    
    if greeting then
        greetings.show(clientId)
    else
        et.trap_SendConsoleCommand(et.EXEC_APPEND, "csay "..clientId.." \"^dgreeting: ^9you do not have a personal greeting.\";")
    end
end
commands.addadmin("greeting", commandGreeting, auth.PERM_GREETING, "display your personal greeting, if you have one")
