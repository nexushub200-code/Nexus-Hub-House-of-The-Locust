local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local L=game:GetService("Lighting")
local T=game:GetService("TweenService")
local LP=P.LocalPlayer

local fly,nv,esp,noclip=false,false,false,false
local bv,bg,fc,cc,nc
local es={}
local old={L.Brightness,L.ClockTime,L.FogEnd,L.GlobalShadows}
local SAFE=Vector3.new(-112.36,4,119.05)

local function tw(o,p,t)
	local x=T:Create(o,t or TweenInfo.new(.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),p)
	x:Play()
	return x
end

local C={
	bg=Color3.fromRGB(10,6,14),top=Color3.fromRGB(34,8,24),
	panel=Color3.fromRGB(27,10,30),card=Color3.fromRGB(34,11,36),
	hover=Color3.fromRGB(65,18,49),white=Color3.fromRGB(247,240,248),
	gray=Color3.fromRGB(169,148,170),muted=Color3.fromRGB(116,94,120),
	purple=Color3.fromRGB(145,55,200),light=Color3.fromRGB(195,85,235),
	off=Color3.fromRGB(48,22,51),stroke=Color3.fromRGB(112,48,125),
	crimson=Color3.fromRGB(205,35,62),crimsonH=Color3.fromRGB(240,55,82),
	purpleA=Color3.fromRGB(105,40,155),purpleH=Color3.fromRGB(150,55,195),
	blue=Color3.fromRGB(55,115,205),red=Color3.fromRGB(215,45,58),
	green=Color3.fromRGB(55,165,95),on=Color3.fromRGB(55,145,88)
}

local G=Instance.new("ScreenGui",LP:WaitForChild("PlayerGui"))
G.Name="NexusHub"
G.ResetOnSpawn=false
G.IgnoreGuiInset=true

local F=Instance.new("Frame",G)
F.Size=UDim2.fromOffset(285,330)
F.Position=UDim2.new(.5,-142,.5,-165)
F.BackgroundColor3=C.bg
F.BorderSizePixel=0
F.Active=true
Instance.new("UICorner",F).CornerRadius=UDim.new(0,14)

local FG=Instance.new("UIGradient",F)
FG.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(30,7,20)),
	ColorSequenceKeypoint.new(.5,Color3.fromRGB(16,7,23)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(11,6,17))
}
FG.Rotation=25

local FS=Instance.new("UIStroke",F)
FS.Color=C.crimson
FS.Transparency=.3
FS.Thickness=1.4

local Top=Instance.new("Frame",F)
Top.Size=UDim2.new(1,0,0,52)
Top.BackgroundColor3=C.top
Top.BorderSizePixel=0
Instance.new("UICorner",Top).CornerRadius=UDim.new(0,14)

local TG=Instance.new("UIGradient",Top)
TG.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(62,9,28)),
	ColorSequenceKeypoint.new(.5,Color3.fromRGB(34,8,31)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(25,9,47))
}

local TL=Instance.new("Frame",Top)
TL.Size=UDim2.new(1,-20,0,2)
TL.Position=UDim2.fromOffset(10,0)
TL.BackgroundColor3=C.crimson
TL.BorderSizePixel=0

local TLG=Instance.new("UIGradient",TL)
TLG.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,C.crimson),
	ColorSequenceKeypoint.new(1,C.purple)
}

local Title=Instance.new("TextLabel",Top)
Title.Size=UDim2.new(1,-115,0,20)
Title.Position=UDim2.fromOffset(12,1)
Title.BackgroundTransparency=1
Title.Text="House of The Locust"
Title.TextColor3=C.white
Title.TextSize=15
Title.Font=Enum.Font.GothamBold
Title.TextXAlignment=Enum.TextXAlignment.Left

local Discord=Instance.new("TextButton",Top)
Discord.Size=UDim2.fromOffset(140,14)
Discord.Position=UDim2.fromOffset(12,25)
Discord.BackgroundTransparency=1
Discord.Text="discord.gg/hRu5KMTpR"
Discord.TextColor3=C.muted
Discord.TextSize=8
Discord.Font=Enum.Font.GothamMedium
Discord.TextXAlignment=Enum.TextXAlignment.Left
Discord.AutoButtonColor=false

local Credit=Instance.new("TextLabel",Top)
Credit.Size=UDim2.fromOffset(160,12)
Credit.Position=UDim2.fromOffset(12,38)
Credit.BackgroundTransparency=1
Credit.Text="By Kingflame/Nexus hub Team"
Credit.TextColor3=C.muted
Credit.TextSize=7
Credit.Font=Enum.Font.GothamMedium
Credit.TextXAlignment=Enum.TextXAlignment.Left

local function clip()
	if setclipboard then
		setclipboard("https://discord.gg/hRu5KMTpR")
	elseif toclipboard then
		toclipboard("https://discord.gg/hRu5KMTpR")
	end
end

Discord.MouseButton1Click:Connect(clip)

local MinBar=Instance.new("Frame",F)
MinBar.Size=UDim2.fromOffset(145,56)
MinBar.BackgroundColor3=C.top
MinBar.Visible=false
MinBar.BorderSizePixel=0
Instance.new("UICorner",MinBar).CornerRadius=UDim.new(0,18)

local MBG=Instance.new("UIGradient",MinBar)
MBG.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(58,9,28)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(29,9,47))
}

local MG=Instance.new("UIStroke",MinBar)
MG.Color=C.crimson
MG.Thickness=1.3
MG.Transparency=.25

local MT=Instance.new("TextLabel",MinBar)
MT.Size=UDim2.fromOffset(78,24)
MT.Position=UDim2.fromOffset(12,5)
MT.BackgroundTransparency=1
MT.Text="NexusHub"
MT.TextColor3=C.white
MT.TextSize=15
MT.Font=Enum.Font.GothamBold
MT.TextXAlignment=Enum.TextXAlignment.Left

local MS=Instance.new("TextLabel",MinBar)
MS.Size=UDim2.fromOffset(105,12)
MS.Position=UDim2.fromOffset(12,31)
MS.BackgroundTransparency=1
MS.Text="House of The Locust"
MS.TextColor3=C.muted
MS.TextSize=8
MS.Font=Enum.Font.GothamMedium
MS.TextXAlignment=Enum.TextXAlignment.Left

local FPS=Instance.new("TextLabel",MinBar)
FPS.Size=UDim2.fromOffset(48,18)
FPS.Position=UDim2.new(1,-79,0,7)
FPS.BackgroundTransparency=1
FPS.Text="0 FPS"
FPS.TextColor3=C.light
FPS.TextSize=9
FPS.Font=Enum.Font.GothamBold
FPS.TextXAlignment=Enum.TextXAlignment.Right

local frames,last=0,os.clock()
R.RenderStepped:Connect(function()
	frames+=1
	local now=os.clock()
	if now-last>=.5 then
		local n=math.floor(frames/(now-last)+.5)
		FPS.Text=n.." FPS"
		FPS.TextColor3=n>=50 and Color3.fromRGB(80,210,125)or n>=30 and Color3.fromRGB(225,185,70)or C.crimsonH
		frames,last=0,now
	end
end)

local Restore=Instance.new("TextButton",MinBar)
Restore.Size=UDim2.fromOffset(28,28)
Restore.Position=UDim2.new(1,-34,.5,-14)
Restore.BackgroundColor3=C.panel
Restore.Text="+"
Restore.TextColor3=C.white
Restore.TextSize=18
Restore.Font=Enum.Font.GothamBold
Restore.AutoButtonColor=false
Instance.new("UICorner",Restore).CornerRadius=UDim.new(0,10)

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
	local s=Instance.new("UIStroke",b)
	s.Color=C.purple
	s.Thickness=1.2
	s.Transparency=.35
	b.MouseEnter:Connect(function()
		tw(b,{BackgroundColor3=C.hover,TextColor3=C.crimsonH})
		s.Transparency=.1
	end)
	b.MouseLeave:Connect(function()
		tw(b,{BackgroundColor3=C.panel,TextColor3=C.white})
		s.Transparency=.35
	end)
	return b
end

local Min=WBtn("—",-72)
local Close=WBtn("×",-36)

local Con=Instance.new("ScrollingFrame",F)
Con.Position=UDim2.fromOffset(10,58)
Con.Size=UDim2.fromOffset(265,262)
Con.BackgroundTransparency=1
Con.BorderSizePixel=0
Con.CanvasSize=UDim2.fromOffset(0,300)
Con.ScrollBarThickness=4
Con.ScrollBarImageColor3=C.crimson
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

	local bg=Instance.new("UIGradient",b)
	bg.Color=ColorSequence.new{
		ColorSequenceKeypoint.new(0,Color3.fromRGB(44,11,26)),
		ColorSequenceKeypoint.new(.5,Color3.fromRGB(27,10,31)),
		ColorSequenceKeypoint.new(1,Color3.fromRGB(28,11,42))
	}

	local st=Instance.new("UIStroke",b)
	st.Color=C.purple
	st.Transparency=.45

	local ac=Instance.new("Frame",b)
	ac.Size=UDim2.fromOffset(3,28)
	ac.Position=UDim2.fromOffset(6,8)
	ac.BackgroundColor3=C.crimson
	ac.BorderSizePixel=0

	local acg=Instance.new("UIGradient",ac)
	acg.Color=ColorSequence.new{
		ColorSequenceKeypoint.new(0,C.crimson),
		ColorSequenceKeypoint.new(1,C.purple)
	}

	local sc=Instance.new("UIScale",b)

	local n=Instance.new("TextLabel",b)
	n.Size=UDim2.new(1,-85,0,18)
	n.Position=UDim2.fromOffset(15,5)
	n.BackgroundTransparency=1
	n.Text=name
	n.TextColor3=C.white
	n.TextSize=12
	n.Font=Enum.Font.GothamBold
	n.TextXAlignment=Enum.TextXAlignment.Left

	local d=Instance.new("TextLabel",b)
	d.Size=UDim2.new(1,-85,0,14)
	d.Position=UDim2.fromOffset(15,24)
	d.BackgroundTransparency=1
	d.Text=desc
	d.TextColor3=C.gray
	d.TextSize=8
	d.Font=Enum.Font.GothamMedium
	d.TextXAlignment=Enum.TextXAlignment.Left

	local sw=Instance.new("Frame",b)
	sw.Size=UDim2.fromOffset(48,24)
	sw.Position=UDim2.new(1,-58,.5,-12)
	sw.BackgroundColor3=C.off
	sw.BorderSizePixel=0
	Instance.new("UICorner",sw).CornerRadius=UDim.new(1,0)

	local ss=Instance.new("UIStroke",sw)
	ss.Color=C.stroke
	ss.Transparency=.25

	local k=Instance.new("Frame",sw)
	k.Size=UDim2.fromOffset(18,18)
	k.Position=UDim2.fromOffset(3,3)
	k.BackgroundColor3=C.gray
	k.BorderSizePixel=0
	Instance.new("UICorner",k).CornerRadius=UDim.new(1,0)

	b.MouseEnter:Connect(function()
		tw(b,{BackgroundColor3=C.hover})
		st.Transparency=.12
	end)

	b.MouseLeave:Connect(function()
		tw(b,{BackgroundColor3=C.panel})
		st.Transparency=.45
	end)

	local function Tap()
		tw(sc,{Scale=.96},TweenInfo.new(.06))
		task.delay(.07,function()
			if b.Parent then
				tw(sc,{Scale=1},TweenInfo.new(.1,Enum.EasingStyle.Back))
			end
		end)
	end

	return b,sw,k,Tap
end

local FB,FSW,FK,FT=Btn("Fly","Mobile joystick flight",0)
local NB,NS,NK,NT=Btn("Night Vision","Improve dark visibility",51)
local EB,ESW,EK,ET=Btn("ESP","Players blue • Enemies red",102)
local IB,ISW,IK,IT=Btn("ESP Items","🔒 Premium Feature",153)
local NCB,NCS,NCK,NCT=Btn("No Clip","Walk through walls",204)

local Lock=Instance.new("TextLabel",IB)
Lock.Size=UDim2.fromOffset(20,20)
Lock.Position=UDim2.new(1,-30,.5,-10)
Lock.BackgroundTransparency=1
Lock.Text="🔒"
Lock.TextSize=11
Lock.TextColor3=C.gray
ISW.Visible=false

local function Stat(sw,k,on)
	tw(sw,{BackgroundColor3=on and C.on or C.off},TweenInfo.new(.2))
	tw(k,{
		Position=UDim2.fromOffset(on and 27 or 3,3),
		BackgroundColor3=on and Color3.fromRGB(245,255,248)or C.gray
	},TweenInfo.new(.2,Enum.EasingStyle.Back))
end

local BW=(285-28)/2

local function Action(text,x,col,hov)
	local b=Instance.new("TextButton",Con)
	b.Size=UDim2.fromOffset(BW,36)
	b.Position=UDim2.fromOffset(x,255)
	b.BackgroundColor3=col
	b.Text=text
	b.TextColor3=C.white
	b.TextSize=11
	b.Font=Enum.Font.GothamBold
	b.BorderSizePixel=0
	b.AutoButtonColor=false
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,9)

	local g=Instance.new("UIGradient",b)
	g.Color=ColorSequence.new{
		ColorSequenceKeypoint.new(0,col),
		ColorSequenceKeypoint.new(1,C.purpleA)
	}

	b.MouseEnter:Connect(function()
		tw(b,{BackgroundColor3=hov})
	end)

	b.MouseLeave:Connect(function()
		tw(b,{BackgroundColor3=col})
	end)

	return b
end

local Safe=Action("Safe Zone",0,C.purpleA,C.purpleH)
local Join=Action("Join Discord",BW+8,C.crimson,C.crimsonH)

Safe.MouseButton1Click:Connect(function()
	local c=LP.Character
	local r=c and c:FindFirstChild("HumanoidRootPart")
	if r then r.CFrame=CFrame.new(SAFE)end
end)

Join.MouseButton1Click:Connect(clip)

IB.MouseButton1Click:Connect(function()
	IT()
	tw(IB,{BackgroundColor3=C.hover})
	task.delay(.15,function()
		if IB.Parent then tw(IB,{BackgroundColor3=C.panel})end
	end)
end)

local function RestoreCollision()
	local c=LP.Character
	if not c then return end
	for _,p in ipairs(c:GetDescendants())do
		if p:IsA("BasePart")and p.Name~="HumanoidRootPart"then
			p.CanCollide=true
		end
	end
end

local function StartNoClip()
	noclip=true
	Stat(NCS,NCK,true)
	if nc then nc:Disconnect()end
	nc=R.Stepped:Connect(function()
		if not noclip then return end
		local c=LP.Character
		if not c then return end
		for _,p in ipairs(c:GetDescendants())do
			if p:IsA("BasePart")then p.CanCollide=false end
		end
	end)
end

local function StopNoClip()
	noclip=false
	if nc then nc:Disconnect()nc=nil end
	RestoreCollision()
	Stat(NCS,NCK,false)
end

NCB.MouseButton1Click:Connect(function()
	NCT()
	if noclip then StopNoClip()else StartNoClip()end
end)

local function StopFly()
	fly=false
	if fc then fc:Disconnect()fc=nil end
	if bv then bv:Destroy()bv=nil end
	if bg then bg:Destroy()bg=nil end
	local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
	if h then h.AutoRotate=true end
	Stat(FSW,FK,false)
end

local function StartFly()
	local c=LP.Character
	if not c then return end
	local h=c:FindFirstChildOfClass("Humanoid")
	local root=c:FindFirstChild("HumanoidRootPart")
	if not h or not root then return end

	fly=true
	Stat(FSW,FK,true)
	h.AutoRotate=false

	bv=Instance.new("BodyVelocity",root)
	bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
	bv.P=50000
	bv.Velocity=Vector3.zero

	bg=Instance.new("BodyGyro",root)
	bg.MaxTorque=Vector3.new(math.huge,math.huge,math.huge)
	bg.P=90000
	bg.D=1000

	fc=R.RenderStepped:Connect(function()
		if not fly or not root.Parent then
			StopFly()
			return
		end

		local cam=workspace.CurrentCamera
		if not cam then return end

		local md=h.MoveDirection
		local look=cam.CFrame.LookVector
		local right=cam.CFrame.RightVector
		local fl=Vector3.new(look.X,0,look.Z)
		local fr=Vector3.new(right.X,0,right.Z)

		if fl.Magnitude>0 then fl=fl.Unit end
		if fr.Magnitude>0 then fr=fr.Unit end

		local f=md:Dot(fl)
		local s=md:Dot(fr)

		if md.Magnitude>.05 then
			local dir=look*f+fr*s
			bv.Velocity=dir.Magnitude>.01 and dir.Unit*55 or Vector3.zero
		else
			bv.Velocity=Vector3.zero
		end

		bg.CFrame=CFrame.lookAt(root.Position,root.Position+look)
	end)
end

FB.MouseButton1Click:Connect(function()
	FT()
	if fly then StopFly()else StartFly()end
end)

NB.MouseButton1Click:Connect(function()
	NT()
	nv=not nv
	Stat(NS,NK,nv)

	if nv then
		L.Brightness=3
		L.ClockTime=14
		L.FogEnd=100000
		L.GlobalShadows=false

		if cc then cc:Destroy()end
		cc=Instance.new("ColorCorrectionEffect",L)
		cc.Name="NexusNightVision"
		cc.Brightness=.25
		cc.Contrast=.1
		cc.Saturation=.15
	else
		if cc then cc:Destroy()cc=nil end
		L.Brightness,L.ClockTime,L.FogEnd,L.GlobalShadows=table.unpack(old)
	end
end)

local function PlayerOf(m)
	return m:IsA("Model")and P:GetPlayerFromCharacter(m)or nil
end

local function Remove(m)
	if es[m]then
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
	es[m]=h
end

local function Check(m)
	if not esp or not m:IsA("Model")then return end

	if string.find(string.lower(m.Name),"cabinet",1,true)then
		Add(m,C.green)
		return
	end

	if not m:FindFirstChildOfClass("Humanoid")then return end

	local p=PlayerOf(m)

	if p then
		if p~=LP then Add(m,C.blue)else Remove(m)end
	elseif m~=LP.Character then
		Add(m,C.red)
	end
end

local function Scan()
	for _,m in ipairs(workspace:GetDescendants())do
		if m:IsA("Model")then Check(m)end
	end
end

EB.MouseButton1Click:Connect(function()
	ET()
	esp=not esp
	Stat(ESW,EK,esp)

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
	if esp and o:IsA("Model")then
		task.wait(.1)
		Check(o)
	end
end)

LP.CharacterAdded:Connect(function()
	task.wait(.5)
	if noclip then StartNoClip()end
end)

local drag,start,pos=false,nil,nil

local function DS(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
		drag=true
		start=i.Position
		pos=F.Position
	end
end

local function DE(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
		drag=false
	end
end

Top.InputBegan:Connect(DS)
Top.InputEnded:Connect(DE)
MinBar.InputBegan:Connect(DS)
MinBar.InputEnded:Connect(DE)

U.InputChanged:Connect(function(i)
	if drag and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then
		local d=i.Position-start
		F.Position=UDim2.new(pos.X.Scale,pos.X.Offset+d.X,pos.Y.Scale,pos.Y.Offset+d.Y)
	end
end)

local FW,FH=285,330
local MW,MH=145,56

local function ShowMin()
	Con.Visible=false
	Top.Visible=false
	MinBar.Visible=true
	tw(F,{Size=UDim2.fromOffset(MW,MH)})
end

local function ShowFull()
	MinBar.Visible=false
	Top.Visible=true
	Con.Visible=true
	tw(F,{Size=UDim2.fromOffset(FW,FH)})
end

Min.MouseButton1Click:Connect(ShowMin)
Restore.MouseButton1Click:Connect(ShowFull)

Close.MouseButton1Click:Connect(function()
	StopFly()
	if noclip then StopNoClip()end

	for m,h in pairs(es)do
		h:Destroy()
		es[m]=nil
	end

	if cc then cc:Destroy()cc=nil end
	L.Brightness,L.ClockTime,L.FogEnd,L.GlobalShadows=table.unpack(old)

	tw(F,{
		Size=UDim2.fromOffset(FW,0),
		BackgroundTransparency=1
	},TweenInfo.new(.25))

	task.wait(.3)
	G:Destroy()
end)

F.Size=UDim2.fromOffset(FW,0)
F.BackgroundTransparency=1

tw(F,{
	Size=UDim2.fromOffset(FW,FH),
	BackgroundTransparency=0
},TweenInfo.new(.4,Enum.EasingStyle.Back))fo.new(.4,Enum.EasingStyle.Back))q
