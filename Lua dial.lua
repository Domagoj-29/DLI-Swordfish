function radiansToCoordinates(radians)
	r=14
	x=15+r*math.cos(radians)
	y=15+r*math.sin(radians)
	return x,y
end
function onTick()
	speed=input.getNumber(1)
	speed=math.max(0,math.min(speed,999.5))
	local maxValue=property.getNumber("Max value")
	local radians=math.pi+(speed/maxValue)*math.pi -- 180 to 360
	x,y=radiansToCoordinates(radians)
	if speed>=99.5 then
		variableX=8
	elseif speed>=9.5 and speed<99.5 then
		variableX=11
	else
		variableX=13
	end
end
function onDraw()
-- Background
	screen.setColor(5,5,5)
	screen.drawClear()
-- Inner circle
	screen.setColor(15,15,15)
	screen.drawCircleF(15,15,14)
-- Outer circle
	screen.setColor(0,0,0)
	screen.drawCircle(15,15,14)
-- Shading
	screen.drawLine(11,8,11,13)
	screen.drawRectF(12,10,1,1)
	screen.drawLine(13,8,13,10)
	screen.drawLine(13,11,13,13)
	screen.drawRect(15,8,2,2)
	screen.drawLine(15,11,15,13)
	screen.drawLine(19,8,19,13)
	screen.drawRectF(20,10,1,1)
	screen.drawLine(21,8,21,13)
	screen.drawText(variableX+1,18,string.format("%.0f",speed))
-- Circle around arrow center
	screen.setColor(100,0,0)
	screen.drawCircle(15,15,1)
-- Arrow
	screen.setColor(255,0,0)
	screen.drawLine(15,15,x,y)
-- Dial graduations
	screen.setColor(120,120,120)
	screen.drawLine(2,15,4,15)
	screen.drawLine(6,6,8,8)
	screen.drawLine(15,2,15,4)
	screen.drawLine(24,6,22,8)
	screen.drawLine(28,15,26,15)
-- K
	screen.drawLine(10,8,10,13)
	screen.drawRectF(11,10,1,1)
	screen.drawLine(12,8,12,10)
	screen.drawLine(12,11,12,13)
-- P
	screen.drawRect(14,8,2,2)
	screen.drawLine(14,11,14,13)
-- H
	screen.drawLine(18,8,18,13)
	screen.drawRectF(19,10,1,1)
	screen.drawLine(20,8,20,13)
-- Speed
	screen.drawText(variableX,18,string.format("%.0f",speed))
end