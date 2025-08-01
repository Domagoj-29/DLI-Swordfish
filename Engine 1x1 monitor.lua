function isPointInRectangle(x, y, rectX, rectY, rectW, rectH)
	return x > rectX and y > rectY and x < rectX+rectW and y < rectY+rectH
end
-- 0, start screen -- 1, RPS temp and end screen
screenMode=0
function onTick()
	local inputX=input.getNumber(3)
	local inputY=input.getNumber(4)
	RPS=input.getNumber(7)
	RPS=math.max(-9,math.min(RPS,99))
	Temperature=input.getNumber(8)
	Temperature=math.max(-99.5,math.min(Temperature,999))
	uiR=property.getNumber("UI color R")
	uiG=property.getNumber("UI color G")
	uiB=property.getNumber("UI color B")
	bgR=property.getNumber("Background color R")
	bgG=property.getNumber("Background color G")
	bgB=property.getNumber("Background color B")
	local isPressed=input.getBool(1)

	if screenMode==0 then
		startButton=isPressed and isPointInRectangle(inputX,inputY,1,10,29,11)
	end
	if startButton then
		screenMode=1
	end

	if screenMode==1 then
		endButton=isPressed and isPointInRectangle(inputX,inputY,1,20,29,11)
	end
	if endButton then
		screenMode=0
	end

	if screenMode==0 then
		engine=false
	elseif screenMode==1 then
		engine=true
	end
	output.setBool(1,engine)

	if RPS<9.5 then
		rpsVariableX=8
	else
		rpsVariableX=3
	end

	if (Temperature>=-99.5 and Temperature<-9.5) or (Temperature>=99.5 and Temperature<999.5) then
		temperatureVariableX=4
	elseif (Temperature>=-9.5 and Temperature<-0.5) or (Temperature>=9.5 and Temperature<99.5) then
		temperatureVariableX=9
	else
		temperatureVariableX=14
	end
end
function onDraw()
	screen.setColor(bgR,bgG,bgB)
	screen.drawClear()
	if screenMode==0 then
		screen.setColor(0,0,0)
		screen.drawText(5,14,"Start")

		screen.setColor(uiR,uiG,uiB)
		screen.drawLine(4,12,28,12)
		screen.drawRectF(3,13,1,1)
		screen.drawRectF(28,13,1,1)
		screen.drawLine(2,14,2,19)
		screen.drawLine(29,14,29,19)
		screen.drawRectF(3,19,1,1)
		screen.drawRectF(28,19,1,1)
		screen.drawLine(4,20,28,20)
		screen.drawText(4,14,"Start")
	elseif screenMode==1 then
		screen.setColor(0,0,0)
		screen.drawText(rpsVariableX+1,6,string.format("%.0f",RPS))
		screen.drawText(15,6,"RPS")

		screen.drawText(temperatureVariableX+1,14,string.format("%.0f",Temperature))
		screen.drawCircle(21,15,1)
		screen.drawText(24,14,"C")

		screen.drawText(10,24,"End")

		screen.setColor(uiR,uiG,uiB)

		screen.drawText(rpsVariableX,6,string.format("%.0f",RPS))
		screen.drawText(14,6,"RPS")

		screen.drawText(temperatureVariableX,14,string.format("%.0f",Temperature))
		screen.drawCircle(20,15,1)
		screen.drawText(23,14,"C")

		screen.drawLine(4,22,28,22)
		screen.drawRectF(3,23,1,1)
		screen.drawRectF(28,23,1,1)
		screen.drawLine(2,24,2,29)
		screen.drawLine(29,24,29,29)
		screen.drawRectF(3,29,1,1)
		screen.drawRectF(28,29,1,1)
		screen.drawLine(4,30,28,30)
		screen.drawText(9,24,"End")
    end
end