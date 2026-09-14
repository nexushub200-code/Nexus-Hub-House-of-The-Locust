local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local L=game:GetService("Lighting")
local T=game:GetService("TweenService")
local LP=P.LocalPlayer

local fly,nv,esp=false,false,false
local bv,bg,fc,cc
local es={}
local old={L.Brightness,L.ClockTime,L.FogEnd,L.GlobalShadows}

local C={
	bg=Color3.fromRGB(15,12,25),top=Color3.fromRGB(25,20,40),
	panel=Color3.fromRGB(31,27,48),hover=Color3.fromRGB(48,39,68),
	white=Color3.fromRGB(245,245,250),gray=Color3.fromRGB(165,160,180),
	purple=Color3.fromRGB(150,65,255),blue=Color3.fromRGB(0,110,255),
	red=Color3.fromRGB(255,0,0),green=Color3.fromRGB(60,220,120),
	yellow=Color3.fromRGB(255,220,40)
}

local tw=function(o,p,t)
	local x=T:Create(
		o,
		t or TweenInfo.new(.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
		p
	)
	x:Play()
	return x
end

--// GUI
local G=Instance.new("ScreenGui",LP:WaitForChild("PlayerGui"))
G.Name="HouseOfTheLocust"
G.ResetOnSpawn=false
G.IgnoreGuiInset=true

local F=Instance.new("Frame",G)
F.Size=UDim2.fromOffset(285,265)
F.Position=UDim2.new(.5,-142,.5,-132)
F.BackgroundColor3=C.bg
F.BorderSizePixel=0
F.Active=true
F.ClipsDescendants=true

Instance.new("UICorner",F).CornerRadius=UDim.new(0,13)

local S=Instance.new("UIStroke",F)
S.Color=C.purple
S.Transparency=.7

local Top=Instance.new("Frame",F)
Top.Size=UDim2.new(1,0,0,52)
Top.BackgroundColor3=C.top
Top.BorderSizePixel=0

Instance.new("UICorner",Top).CornerRadius=UDim.new(0,13)

local Title=Instance.new("TextLabel",Top)
Title.Size=UDim2.new(1,-115,0,20)
Title.Position=UDim2.fromOffset(12,1)
Title.BackgroundTransparency=1
Title.Text="House of The Locust"
Title.TextColor3=C.white
Title.TextSize=15
Title.Font=Enum.Font.GothamBold
Title.TextXAlignment=Enum.TextXAlignment.Left

--// Discord
local Discord=Instance.new("TextButton",Top)
Discord.Size=UDim2.fromOffset(125,14)
Discord.Position=UDim2.fromOffset(12,25)
Discord.BackgroundTransparency=1
Discord.Text="discord.gg/EBevtm9eK"
Discord.TextColor3=C.gray
Discord.TextSize=8
Discord.Font=Enum.Font.GothamMedium
Discord.TextXAlignment=Enum.TextXAlignment.Left
Discord.AutoButtonColor=false

Discord.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("discord.gg/EBevtm9eK")
	elseif toclipboard then
		toclipboard("discord.gg/EBevtm9eK")
	end
end)

--// Credit
local Credit=Instance.new("TextLabel",Top)
Credit.Size=UDim2.fromOffset(150,12)
Credit.Position=UDim2.fromOffset(12,38)
Credit.BackgroundTransparency=1
Credit.Text="By Kingflame/Nexus hub Team"
Credit.TextColor3=C.gray
Credit.TextSize=7
Credit.Font=Enum.Font.GothamMedium
Credit.TextXAlignment=Enum.TextXAlignment.Left

local function WBtn(txt,x)
	local b=Instance.new("TextButton",Top)
	b.Size=UDim2.fromOffset(32,32)
	b.Position=UDim2.new(1,x,0,10)
	b.BackgroundColor3=C.panel
	b.Text=txt
	b.TextColor3=C.white
	b.TextSize=18
	b.Font=Enum.Font.GothamBold
	b.BorderSizePixel=0
	b.AutoButtonColor=false

	Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)

	b.MouseEnter:Connect(function()
		tw(b,{BackgroundColor3=C.hover,TextColor3=C.purple})
	end)

	b.MouseLeave:Connect(function()
		tw(b,{BackgroundColor3=C.panel,TextColor3=C.white})
	end)

	return b
end

local Min=WBtn("—",-72)
local Close=WBtn("×",-36)

--// Scrollable Content
local Con=Instance.new("ScrollingFrame",F)
Con.Position=UDim2.fromOffset(10,60)
Con.Size=UDim2.new(1,-20,1,-65)
Con.BackgroundTransparency=1
Con.BorderSizePixel=0
Con.CanvasSize=UDim2.fromOffset(0,309)
Con.ScrollBarThickness=4
Con.ScrollBarImageColor3=C.purple
Con.ScrollBarImageTransparency=.15
Con.ScrollingDirection=Enum.ScrollingDirection.Y
Con.Active=true
Con.ClipsDescendants=true

local function Btn(name,desc,y)
	local b=Instance.new("TextButton",Con)
	b.Size=UDim2.new(1,-6,0,44)
	b.Position=UDim2.fromOffset(0,y)
	b.BackgroundColor3=C.panel
	b.Text=""
	b.BorderSizePixel=0
	b.AutoButtonColor=false

	Instance.new("UICorner",b).CornerRadius=UDim.new(0,9)

	local n=Instance.new("TextLabel",b)
	n.Size=UDim2.new(1,-85,0,18)
	n.Position=UDim2.fromOffset(13,5)
	n.BackgroundTransparency=1
	n.Text=name
	n.TextColor3=C.white
	n.TextSize=12
	n.Font=Enum.Font.GothamBold
	n.TextXAlignment=Enum.TextXAlignment.Left

	local d=Instance.new("TextLabel",b)
	d.Size=UDim2.new(1,-85,0,14)
	d.Position=UDim2.fromOffset(13,24)
	d.BackgroundTransparency=1
	d.Text=desc
	d.TextColor3=C.gray
	d.TextSize=8
	d.Font=Enum.Font.GothamMedium
	d.TextXAlignment=Enum.TextXAlignment.Left

	local st=Instance.new("TextLabel",b)
	st.Size=UDim2.fromOffset(58,25)
	st.Position=UDim2.new(1,-68,.5,-12)
	st.BackgroundColor3=Color3.fromRGB(45,40,60)
	st.Text="OFF"
	st.TextColor3=C.gray
	st.TextSize=9
	st.Font=Enum.Font.GothamBold

	Instance.new("UICorner",st).CornerRadius=UDim.new(0,7)

	b.MouseEnter:Connect(function()
		tw(b,{BackgroundColor3=C.hover})
	end)

	b.MouseLeave:Connect(function()
		tw(b,{BackgroundColor3=C.panel})
	end)

	return b,st
end

local FB,FS=Btn("Fly","Mobile joystick flight",0)
local NB,NS=Btn("Night Vision","Improve dark visibility",51)
local EB,ES=Btn("ESP","Players blue • Enemies red",102)
local IB,IS=Btn("ESP Items","🔒 Premium Feature",153)
local AB,AS=Btn("Anti AFK","Stay active",204)

--// Join Discord Button
local JoinDiscord=Instance.new("TextButton",Con)
JoinDiscord.Size=UDim2.new(1,-6,0,44)
JoinDiscord.Position=UDim2.fromOffset(0,255)
JoinDiscord.BackgroundColor3=C.purple
JoinDiscord.Text="Join discord link Here!"
JoinDiscord.TextColor3=C.white
JoinDiscord.TextSize=12
JoinDiscord.Font=Enum.Font.GothamBold
JoinDiscord.BorderSizePixel=0
JoinDiscord.AutoButtonColor=false

Instance.new("UICorner",JoinDiscord).CornerRadius=UDim.new(0,9)

JoinDiscord.MouseEnter:Connect(function()
	tw(JoinDiscord,{
		BackgroundColor3=Color3.fromRGB(180,110,255)
	})
end)

JoinDiscord.MouseLeave:Connect(function()
	tw(JoinDiscord,{
		BackgroundColor3=C.purple
	})
end)

JoinDiscord.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://discord.gg/rgm7mbf6U")
	elseif toclipboard then
		toclipboard("https://discord.gg/rgm7mbf6U")
	end
end)

--// Locked ESP Items
IB.AutoButtonColor=false

local Lock=Instance.new("TextLabel",IB)
Lock.Size=UDim2.fromOffset(20,20)
Lock.Position=UDim2.new(1,-30,.5,-10)
Lock.BackgroundTransparency=1
Lock.Text="🔒"
Lock.TextSize=11
Lock.TextColor3=C.gray

IS.Text="PREMIUM"
IS.TextSize=7
IS.TextColor3=C.yellow
IS.BackgroundColor3=Color3.fromRGB(55,45,25)

IB.MouseButton1Click:Connect(function()
	tw(IB,{BackgroundColor3=C.hover})
	task.delay(.15,function()
		if IB.Parent then
			tw(IB,{BackgroundColor3=C.panel})
		end
	end)
end)

local function Stat(s,on)
	s.Text=on and"ON"or"OFF"

	tw(s,{
		BackgroundColor3=on and C.green or Color3.fromRGB(45,40,60),
		TextColor3=on and Color3.fromRGB(10,25,15) or C.gray
	})
end

--// Anti AFK UI only
local antiAFK=false

AB.MouseButton1Click:Connect(function()
	antiAFK=not antiAFK
	Stat(AS,antiAFK)
end)

--// Drag
local drag,start,pos=false,nil,nil

Top.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1
	or i.UserInputType==Enum.UserInputType.Touch then
		drag=true
		start=i.Position
		pos=F.Position
	end
end)

Top.InputEnded:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1
	or i.UserInputType==Enum.UserInputType.Touch then
		drag=false
	end
end)

U.InputChanged:Connect(function(i)
	if drag and(
		i.UserInputType==Enum.UserInputType.MouseMovement
		or i.UserInputType==Enum.UserInputType.Touch
	)then
		local d=i.Position-start

		F.Position=UDim2.new(
			pos.X.Scale,
			pos.X.Offset+d.X,
			pos.Y.Scale,
			pos.Y.Offset+d.Y
		)
	end
end)

--// Fly
local function StopFly()
	fly=false

	if fc then
		fc:Disconnect()
		fc=nil
	end

	if bv then
		bv:Destroy()
		bv=nil
	end

	if bg then
		bg:Destroy()
		bg=nil
	end

	local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")

	if h then
		h.AutoRotate=true
	end

	Stat(FS,false)
end

local function StartFly()
	local c=LP.Character
	if not c then return end

	local h=c:FindFirstChildOfClass("Humanoid")
	local root=c:FindFirstChild("HumanoidRootPart")

	if not h or not root then return end

	fly=true
	Stat(FS,true)

	h.AutoRotate=false

	bv=Instance.new("BodyVelocity")
	bv.Name="LocustFlyVelocity"
	bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
	bv.P=50000
	bv.Velocity=Vector3.zero
	bv.Parent=root

	bg=Instance.new("BodyGyro")
	bg.Name="LocustFlyGyro"
	bg.MaxTorque=Vector3.new(math.huge,math.huge,math.huge)
	bg.P=90000
	bg.D=1000
	bg.CFrame=workspace.CurrentCamera.CFrame
	bg.Parent=root

	fc=R.RenderStepped:Connect(function()
		if not fly or not root.Parent then
			StopFly()
			return
		end

		local cam=workspace.CurrentCamera
		local md=h.MoveDirection

		local look=cam.CFrame.LookVector
		local right=cam.CFrame.RightVector

		local flatLook=Vector3.new(look.X,0,look.Z)
		local flatRight=Vector3.new(right.X,0,right.Z)

		if flatLook.Magnitude>0 then
			flatLook=flatLook.Unit
		end

		if flatRight.Magnitude>0 then
			flatRight=flatRight.Unit
		end

		local forward=md:Dot(flatLook)
		local side=md:Dot(flatRight)

		if md.Magnitude>.05 then
			local dir=look*forward+flatRight*side

			if dir.Magnitude>.01 then
				bv.Velocity=dir.Unit*55
			else
				bv.Velocity=Vector3.zero
			end
		else
			bv.Velocity=Vector3.zero
		end

		bg.CFrame=CFrame.lookAt(
			root.Position,
			root.Position+cam.CFrame.LookVector
		)
	end)
end

FB.MouseButton1Click:Connect(function()
	if fly then
		StopFly()
	else
		StartFly()
	end
end)

--// Night Vision
NB.MouseButton1Click:Connect(function()
	nv=not nv
	Stat(NS,nv)

	if nv then
		L.Brightness=3
		L.ClockTime=14
		L.FogEnd=100000
		L.GlobalShadows=false

		cc=Instance.new("ColorCorrectionEffect",L)
		cc.Name="NightVision"
		cc.Brightness=.25
		cc.Contrast=.1
		cc.Saturation=.15
	else
		if cc then
			cc:Destroy()
			cc=nil
		end

		L.Brightness,L.ClockTime,L.FogEnd,L.GlobalShadows=table.unpack(old)
	end
end)

--// ESP
local function PlayerOf(m)
	return m:IsA("Model") and P:GetPlayerFromCharacter(m) or nil
end

local function Remove(m)
	if es[m] then
		es[m]:Destroy()
		es[m]=nil
	end
end

local function Add(m,col)
	Remove(m)

	local h=Instance.new("Highlight",m)
	h.Name="LocustESP"
	h.Adornee=m
	h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
	h.FillColor=col
	h.OutlineColor=col
	h.FillTransparency=.5
	h.OutlineTransparency=0

	es[m]=h
end

local function IsCabinet(m)
	local n=string.lower(m.Name)
	return string.find(n,"cabinet",1,true)~=nil
end

local function Check(m)
	if not esp or not m:IsA("Model") then return end

	if IsCabinet(m) then
		Add(m,C.green)
		return
	end

	if not m:FindFirstChildOfClass("Humanoid") then return end

	local p=PlayerOf(m)

	if p then
		if p~=LP then
			Add(m,C.blue)
		else
			Remove(m)
		end
	else
		if m~=LP.Character then
			Add(m,C.red)
		end
	end
end

local function Scan()
	for _,m in ipairs(workspace:GetDescendants()) do
		if m:IsA("Model") then
			Check(m)
		end
	end
end

EB.MouseButton1Click:Connect(function()
	esp=not esp
	Stat(ES,esp)

	if esp then
		Scan()
	else
		for m,h in pairs(es)do
			h:Destroy()
			es[m]=nil
		end
	end
end)

workspace.DescendantAdded:Connect(function(o)
	if esp and o:IsA("Model") then
		task.wait(.1)
		Check(o)
	end
end)

P.PlayerAdded:Connect(function(p)
	p.CharacterAdded:Connect(function(c)
		if esp then
			task.wait(.2)
			Add(c,C.blue)
		end
	end)
end)

--// Minimize
local mini=false

Min.MouseButton1Click:Connect(function()
	mini=not mini

	if mini then
		Con.Visible=false
		tw(F,{Size=UDim2.fromOffset(285,52)})
		Min.Text="+"
	else
		Con.Visible=true
		tw(F,{Size=UDim2.fromOffset(285,265)})
		Min.Text="—"
	end
end)

--// Close
Close.MouseButton1Click:Connect(function()
	StopFly()

	if esp then
		for m,h in pairs(es)do
			h:Destroy()
		end
	end

	if cc then
		cc:Destroy()
	end

	L.Brightness,L.ClockTime,L.FogEnd,L.GlobalShadows=table.unpack(old)

	tw(
		F,
		{
			Size=UDim2.fromOffset(285,0),
			BackgroundTransparency=1
		},
		TweenInfo.new(.25)
	)

	task.wait(.3)
	G:Destroy()
end)

--// Opening animation
F.Size=UDim2.fromOffset(285,0)
F.BackgroundTransparency=1

tw(
	F,
	{
		Size=UDim2.fromOffset(285,265),
		BackgroundTransparency=0
	},
	TweenInfo.new(.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
)
