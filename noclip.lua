--[[
Noclip v1.0 By Marco

]]--

local noclip = {}

local enabled = false
local timer = 0
local timer2 = 0
local allowtoggle = true
local controllermode = false
local speedmult = 0.5
local vehiclerotation = 0

function noclip.unload()

end
function noclip.init()

end

function noclip.tick()
local player = PLAYER.PLAYER_PED_ID()
local playerped = PLAYER.GET_PLAYER_PED(player)
local jumping = PED.IS_PED_JUMPING(player)
local falling = PED.IS_PED_FALLING(player)
local parastate = PED.GET_PED_PARACHUTE_STATE(player)
local vehiclecheck = PED.IS_PED_IN_ANY_VEHICLE(player, true)
local vehicle = PED.GET_VEHICLE_PED_IS_IN(player, true)
local speed = ENTITY.GET_ENTITY_SPEED(player)
local detentity

if vehiclecheck then
	detentity = vehicle
else
	detentity = player
end

local velocity = ENTITY.GET_ENTITY_VELOCITY(detentity)
local rotation = ENTITY.GET_ENTITY_ROTATION(detentity, false)
local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)



	if ( allowtoggle == false ) then
		if timer > 20 and ( not (get_key_pressed(Keys.N) or CONTROLS.IS_CONTROL_PRESSED(2,74)) )  then
			timer = 0
			allowtoggle = true
		else
			timer = timer + 1
		end
	end

    		
		if get_key_pressed(Keys.J) then
            speedmult = speedmult + 0.01
    end
    if get_key_pressed(Keys.K) then
        if speedmult > 0 then
            speedmult = speedmult - 0.01
        end
    end
    
	ENTITY.SET_ENTITY_MAX_SPEED(player, 0)
			
	local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
	local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
	
	if (not vehiclecheck) then
	
		vehiclerotation = 0
		
		ENTITY.SET_ENTITY_COLLISION(vehicle, true, true)

		if ( get_key_pressed(Keys.W) or get_key_pressed(Keys.A) or get_key_pressed(Keys.D) or get_key_pressed(Keys.S)) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x + ENTITY.GET_ENTITY_FORWARD_X(detentity)*speedmult, position.y + ENTITY.GET_ENTITY_FORWARD_Y(detentity)*speedmult, (position.z - 1), true, true, true, true)
		end
		
		local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
		local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
		
		if ( get_key_pressed(Keys.LShiftKey) ) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x, position.y, ((position.z - 1) + 0.5*speedmult), true, true, true, true)
		end

		local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
		local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
	
		if ( get_key_pressed(Keys.LControlKey) ) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x, position.y, ((position.z - 1) - 0.5*speedmult), true, true, true, true)
		end
	
	elseif vehiclecheck then
		
		ENTITY.SET_ENTITY_COLLISION(vehicle, false, false)
		ENTITY.SET_ENTITY_MAX_SPEED(vehicle, 0)
		
		local rotation = ENTITY.GET_ENTITY_ROTATION(detentity, true)
		if (vehiclerotation < 1) and (vehiclerotation > -1) then
			local vehiclerotation = rotation.z
		end
		local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
		local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
	
		if ( get_key_pressed(Keys.W) ) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x + ENTITY.GET_ENTITY_FORWARD_X(detentity)*speedmult, position.y + ENTITY.GET_ENTITY_FORWARD_Y(detentity)*speedmult, (position.z - 0.6), false, false, false, false)
		end
		
		if ( get_key_pressed(Keys.S) ) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x - ENTITY.GET_ENTITY_FORWARD_X(detentity)*speedmult, position.y - ENTITY.GET_ENTITY_FORWARD_Y(detentity)*speedmult, (position.z - 0.6), false, false, false, false)
		end

		local rotation = ENTITY.GET_ENTITY_ROTATION(detentity, true)
		local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
		local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
		
		if ( get_key_pressed(Keys.A) ) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x - ENTITY.GET_ENTITY_FORWARD_X(detentity)*speedmult, position.y + ENTITY.GET_ENTITY_FORWARD_Y(detentity)*speedmult, (position.z - 0.6), false, false, false, false)
		end
		
		local rotation = ENTITY.GET_ENTITY_ROTATION(detentity, true)
		local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
		local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
		
		if ( get_key_pressed(Keys.D) ) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x + ENTITY.GET_ENTITY_FORWARD_X(detentity)*speedmult, position.y - ENTITY.GET_ENTITY_FORWARD_Y(detentity)*speedmult, (position.z - 0.6), false, false, false, false)
		end
		
		ENTITY.SET_ENTITY_ROTATION(detentity, 0, 0, vehiclerotation, 0, true)
							
		local rotation = ENTITY.GET_ENTITY_ROTATION(detentity, true)
		local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
		local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
		
		if ( get_key_pressed(Keys.LShiftKey) ) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x, position.y, ((position.z + 4) + 0.5*speedmult), true, true, true, true)
		end

		local rotation = ENTITY.GET_ENTITY_ROTATION(detentity, true)
		local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
		local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
	
		if ( get_key_pressed(Keys.LControlKey) ) then
			ENTITY.SET_ENTITY_COORDS(detentity, position.x, position.y, ((position.z - 4) - 0.5*speedmult), true, true, true, true)
		end
	
	end
	
	
else

	ENTITY.SET_ENTITY_MAX_SPEED(player, 1.5)

	if (speed > 0.4) then
		ENTITY.SET_ENTITY_COORDS(detentity, position.x + ENTITY.GET_ENTITY_FORWARD_X(detentity)*speedmult, position.y + ENTITY.GET_ENTITY_FORWARD_Y(detentity)*speedmult, (position.z - 1), true, true, true, true)
	end
	
	local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
	local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
	
	if ( CONTROLS.IS_CONTROL_PRESSED(2,183) ) then
		ENTITY.SET_ENTITY_COORDS(detentity, position.x, position.y, ((position.z - 1) + 0.5*speedmult), true, true, true, true)
	end
	
	local position = ENTITY.GET_ENTITY_COORDS(detentity, true)
	local direction = ENTITY.GET_ENTITY_FORWARD_VECTOR(detentity)
	
	if ( CONTROLS.IS_CONTROL_PRESSED(2,185) ) then
		ENTITY.SET_ENTITY_COORDS(detentity, position.x, position.y, ((position.z - 1) - 0.5*speedmult), true, true, true, true)
	end
	
end

if (not vehiclecheck) then
	local position = ENTITY.GET_ENTITY_COORDS(player, true)
	if jumping or falling or (parastate == 0) then
		ENTITY.SET_ENTITY_COORDS(player, position.x, position.y, (position.z - 1), false, false, false, false)
		
	end
end

	ENTITY.SET_ENTITY_VELOCITY(detentity, 0, 0, 0)

	--Just testing stuff, probably isn't good for anything.
--[[if ( CONTROLS.IS_CONTROL_PRESSED(2,87) or CONTROLS.IS_CONTROL_PRESSED(2,65) or CONTROLS.IS_CONTROL_PRESSED(2,68) or CONTROLS.IS_CONTROL_PRESSED(2,83)) then
	ENTITY.SET_ENTITY_COORDS(player, position.x + ENTITY.GET_ENTITY_FORWARD_X(player), position.y + ENTITY.GET_ENTITY_FORWARD_Y(player), (position.z - 1), true, true, true, true)
end]]



else

ENTITY.SET_ENTITY_MAX_SPEED(player, 500)

vehiclerotation = 0
if vehiclecheck then
	ENTITY.SET_ENTITY_COLLISION(vehicle, true, true)
	ENTITY.SET_ENTITY_MAX_SPEED(vehicle, 500)
end

end
end

return noclip