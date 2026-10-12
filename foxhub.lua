local P=game:GetService("Players")local U=game:GetService("UserInputService")local T=game:GetService("TweenService")local S=game:GetService("StarterGui")local W=game:GetService("Workspace")local R=game:GetService("RunService")local L=P.LocalPlayer local G=L:WaitForChild("PlayerGui")
if _G.FoxUI then pcall(function()_G.FoxUI:Destroy()end)end
local function N(a,b)S:SetCore("SendNotification",{Title=a,Text=b,Duration=3})end
local screen=Instance.new("ScreenGui")screen.Name="FoxHub"screen.ResetOnSpawn=false screen.Parent=G
_G.FoxUI=screen
local icon=Instance.new("TextButton")icon.Size=UDim2.new(0,60,0,60)icon.Position=UDim2.new(0,20,.4,0)icon.BackgroundColor3=Color3.fromRGB(0,0,0)icon.Text=""icon.AutoButtonColor=false icon.Parent=screen
Instance.new("UICorner",icon).CornerRadius=UDim.new(0,12)
local iconImg=Instance.new("ImageLabel")iconImg.Image="rbxassetid://97125286596491"iconImg.Size=UDim2.new(1,0,1,0)iconImg.BackgroundTransparency=1 iconImg.ScaleType=Enum.ScaleType.Stretch iconImg.Parent=icon
Instance.new("UICorner",iconImg).CornerRadius=UDim.new(0,12)

local fpsBox=Instance.new("TextButton")
fpsBox.Name="FPSBox"
fpsBox.Size=UDim2.new(0,80,0,20)
fpsBox.Position=UDim2.new(0,10,0,75)
fpsBox.BackgroundColor3=Color3.fromRGB(0,0,0)
fpsBox.BackgroundTransparency=0.5
fpsBox.BorderSizePixel=0
fpsBox.Text="FPS: 60"
fpsBox.TextColor3=Color3.fromRGB(255,255,255)
fpsBox.Font=Enum.Font.GothamBold
fpsBox.TextSize=10
fpsBox.TextStrokeTransparency=0.3
fpsBox.TextStrokeColor3=Color3.fromRGB(0,0,0)
fpsBox.AutoButtonColor=false
fpsBox.Active=true
fpsBox.Parent=screen
Instance.new("UICorner",fpsBox).CornerRadius=UDim.new(0,4)

local fpsDrag,fpsDs,fpsSp
fpsBox.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        fpsDrag=true fpsDs=i.Position fpsSp=fpsBox.Position
    end
end)
fpsBox.InputChanged:Connect(function(i)
    if fpsDrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-fpsDs
        fpsBox.Position=UDim2.new(fpsSp.X.Scale,fpsSp.X.Offset+d.X,fpsSp.Y.Scale,fpsSp.Y.Offset+d.Y)
    end
end)
U.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then fpsDrag=false end
end)

local fc, lt = 0, tick()
R.RenderStepped:Connect(function()
    fc = fc + 1
    local a = tick()
    if a - lt >= 1 then
        local fp = math.floor(fc / (a - lt))
        fc, lt = 0, a
        fpsBox.Text = "FPS: " .. fp
        if fp >= 50 then fpsBox.TextColor3 = Color3.fromRGB(0,255,100)
        elseif fp >= 30 then fpsBox.TextColor3 = Color3.fromRGB(255,200,50)
        else fpsBox.TextColor3 = Color3.fromRGB(255,80,80) end
    end
end)

local tempoBox=Instance.new("TextButton")
tempoBox.Size=UDim2.new(0,105,0,20)
tempoBox.Position=UDim2.new(0,10,0,98)
tempoBox.BackgroundColor3=Color3.fromRGB(0,0,0)
tempoBox.BackgroundTransparency=0.5
tempoBox.BorderSizePixel=0
tempoBox.Text="⏱️ 00:00:00"
tempoBox.TextColor3=Color3.fromRGB(255,255,255)
tempoBox.Font=Enum.Font.GothamBold
tempoBox.TextSize=10
tempoBox.TextStrokeTransparency=0.3
tempoBox.TextStrokeColor3=Color3.fromRGB(0,0,0)
tempoBox.AutoButtonColor=false
tempoBox.Active=true
tempoBox.Parent=screen
Instance.new("UICorner",tempoBox).CornerRadius=UDim.new(0,4)

local tempoDrag,tempoDs,tempoSp
tempoBox.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        tempoDrag=true tempoDs=i.Position tempoSp=tempoBox.Position
    end
end)
tempoBox.InputChanged:Connect(function(i)
    if tempoDrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-tempoDs
        tempoBox.Position=UDim2.new(tempoSp.X.Scale,tempoSp.X.Offset+d.X,tempoSp.Y.Scale,tempoSp.Y.Offset+d.Y)
    end
end)
U.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then tempoDrag=false end
end)

local inicioTempo = tick()
task.spawn(function()
    while true do
        task.wait(1)
        local passou = tick() - inicioTempo
        local horas = math.floor(passou / 3600)
        local mins = math.floor((passou % 3600) / 60)
        local segs = math.floor(passou % 60)
        tempoBox.Text = string.format("⏱️ %02d:%02d:%02d", horas, mins, segs)
    end
end)

local main=Instance.new("Frame")main.Size=UDim2.new(0,300,0,440)main.Position=UDim2.new(.5,-150,.5,-220)main.BackgroundColor3=Color3.fromRGB(24,18,14)main.BorderSizePixel=0 main.Visible=false main.Parent=screen
Instance.new("UICorner",main).CornerRadius=UDim.new(0,12)
local b2=Instance.new("UIStroke")b2.Color=Color3.fromRGB(255,140,40)b2.Thickness=1.4 b2.Parent=main
local top=Instance.new("Frame")top.Size=UDim2.new(1,0,0,36)top.BackgroundColor3=Color3.fromRGB(35,24,18)top.BorderSizePixel=0 top.Parent=main
Instance.new("UICorner",top).CornerRadius=UDim.new(0,12)
local tl=Instance.new("TextLabel")tl.Text="FOX HUB"tl.Font=Enum.Font.GothamBold tl.TextSize=13 tl.TextColor3=Color3.fromRGB(255,160,60)tl.BackgroundTransparency=1 tl.Size=UDim2.new(1,-45,1,0)tl.Position=UDim2.new(0,12,0,0)tl.TextXAlignment=Enum.TextXAlignment.Left tl.Parent=top
local xb=Instance.new("TextButton")xb.Size=UDim2.new(0,24,0,24)xb.Position=UDim2.new(1,-30,0,6)xb.BackgroundColor3=Color3.fromRGB(240,70,90)xb.Text="X"xb.TextColor3=Color3.fromRGB(255,255,255)xb.Font=Enum.Font.GothamBold xb.TextSize=12 xb.Parent=top
Instance.new("UICorner",xb).CornerRadius=UDim.new(0,6)
xb.MouseButton1Click:Connect(function()main.Visible=false end)

local timerBox=Instance.new("Frame")
timerBox.Size=UDim2.new(1,-16,0,38)
timerBox.Position=UDim2.new(0,8,0,42)
timerBox.BackgroundColor3=Color3.fromRGB(30,20,14)
timerBox.BackgroundTransparency=0.2
timerBox.BorderSizePixel=0
timerBox.Parent=main
Instance.new("UICorner",timerBox).CornerRadius=UDim.new(0,7)
local timerTitle=Instance.new("TextLabel")
timerTitle.Size=UDim2.new(1,0,0,13)
timerTitle.Position=UDim2.new(0,0,0,3)
timerTitle.BackgroundTransparency=1
timerTitle.Text="⏰ PRÓXIMO EVENTO"
timerTitle.TextColor3=Color3.fromRGB(220,220,220)
timerTitle.Font=Enum.Font.GothamBold
timerTitle.TextSize=9
timerTitle.Parent=timerBox
local timerValue=Instance.new("TextLabel")
timerValue.Name="TimerValue"
timerValue.Size=UDim2.new(1,0,0,20)
timerValue.Position=UDim2.new(0,0,0,15)
timerValue.BackgroundTransparency=1
timerValue.Text="--:--"
timerValue.TextColor3=Color3.fromRGB(255,200,50)
timerValue.Font=Enum.Font.GothamBlack
timerValue.TextSize=15
timerValue.Parent=timerBox
_G.FoxTimer = timerValue

local drag,ds,sp
top.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=true ds=i.Position sp=main.Position end end)
top.InputChanged:Connect(function(i)if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds main.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end end)
U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=false end end)
local idrag,imoved
icon.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then idrag=true imoved=false ds=i.Position sp=icon.Position end end)
icon.InputChanged:Connect(function(i)if idrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds if math.abs(d.X)>5 or math.abs(d.Y)>5 then imoved=true end icon.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end end)
U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then idrag=false end end)
icon.MouseButton1Click:Connect(function()if not imoved then main.Visible=not main.Visible end end)
local tabBar=Instance.new("Frame")tabBar.Size=UDim2.new(1,-16,0,30)tabBar.Position=UDim2.new(0,8,0,84)tabBar.BackgroundColor3=Color3.fromRGB(30,20,14)tabBar.BackgroundTransparency=.2 tabBar.BorderSizePixel=0 tabBar.Parent=main
Instance.new("UICorner",tabBar).CornerRadius=UDim.new(0,7)
local tabL=Instance.new("UIListLayout")tabL.FillDirection=Enum.FillDirection.Horizontal tabL.HorizontalAlignment=Enum.HorizontalAlignment.Center tabL.VerticalAlignment=Enum.VerticalAlignment.Center tabL.Padding=UDim.new(0,4)tabL.Parent=tabBar
local pageHolder=Instance.new("Frame")pageHolder.Position=UDim2.new(0,8,0,120)pageHolder.Size=UDim2.new(1,-16,1,-128)pageHolder.BackgroundTransparency=1 pageHolder.Parent=main
local function criarPagina(n)local f=Instance.new("ScrollingFrame")f.Name=n f.Size=UDim2.new(1,0,1,0)f.BackgroundTransparency=1 f.BorderSizePixel=0 f.ScrollBarThickness=4 f.ScrollBarImageColor3=Color3.fromRGB(255,140,40)f.CanvasSize=UDim2.new(0,0,0,0)f.AutomaticCanvasSize=Enum.AutomaticSize.Y f.Visible=false f.Parent=pageHolder local l=Instance.new("UIListLayout")l.Padding=UDim.new(0,7)l.Parent=f return f end
local pMain=criarPagina("Main")local pPlayer=criarPagina("Player")local pSet=criarPagina("Settings")
local tabBtns={}
local function ativarAba(nome)for _,pg in ipairs({pMain,pPlayer,pSet})do pg.Visible=(pg.Name==nome)end for n,b in pairs(tabBtns)do T:Create(b,TweenInfo.new(.15),{BackgroundColor3=(n==nome)and Color3.fromRGB(255,140,40)or Color3.fromRGB(55,40,30)}):Play()b.TextColor3=(n==nome)and Color3.fromRGB(25,15,10)or Color3.fromRGB(220,200,180)end end
local function criarAba(nome,emoji)local b=Instance.new("TextButton")b.Size=UDim2.new(0,84,0,24)b.BackgroundColor3=Color3.fromRGB(55,40,30)b.Text=emoji.." "..nome b.Font=Enum.Font.GothamBold b.TextSize=10 b.TextColor3=Color3.fromRGB(220,200,180)b.AutoButtonColor=false b.Parent=tabBar Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)b.MouseButton1Click:Connect(function()ativarAba(nome)end)tabBtns[nome]=b end
criarAba("Main","🚀")criarAba("Player","👤")criarAba("Settings","⚙")
local St={AF=false,AC=false,AR=false,R=true,IJ=false,Noclip=false,AntiAFK=false,FPS=false,SH=false}
_G.FoxSt=St
local function sec(parent,n,o)local s=Instance.new("Frame")s.Size=UDim2.new(1,0,0,0)s.AutomaticSize=Enum.AutomaticSize.Y s.BackgroundColor3=Color3.fromRGB(35,25,18)s.BackgroundTransparency=.25 s.BorderSizePixel=0 s.LayoutOrder=o s.Parent=parent local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,9)c.Parent=s local p=Instance.new("UIPadding")p.PaddingTop=UDim.new(0,7)p.PaddingBottom=UDim.new(0,7)p.PaddingLeft=UDim.new(0,9)p.PaddingRight=UDim.new(0,9)p.Parent=s local l=Instance.new("UIListLayout")l.Padding=UDim.new(0,5)l.Parent=s local t=Instance.new("TextLabel")t.Text=n t.Font=Enum.Font.GothamBold t.TextSize=11 t.TextColor3=Color3.fromRGB(255,160,60)t.BackgroundTransparency=1 t.Size=UDim2.new(1,0,0,14)t.TextXAlignment=Enum.TextXAlignment.Left t.LayoutOrder=0 t.Parent=s return s end
local function tog(p,txt,d,cb)local r=Instance.new("Frame")r.Size=UDim2.new(1,0,0,24)r.BackgroundTransparency=1 r.Parent=p local l=Instance.new("TextLabel")l.Text=txt l.Font=Enum.Font.Gotham l.TextSize=10 l.TextColor3=Color3.fromRGB(240,230,220)l.BackgroundTransparency=1 l.Size=UDim2.new(1,-50,1,0)l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=r local b=Instance.new("TextButton")b.Size=UDim2.new(0,40,0,20)b.Position=UDim2.new(1,-40,.5,-10)b.BackgroundColor3=d and Color3.fromRGB(255,140,40)or Color3.fromRGB(65,50,40)b.Text=""b.AutoButtonColor=false b.Parent=r Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)local k=Instance.new("Frame")k.Size=UDim2.new(0,14,0,14)k.Position=d and UDim2.new(1,-16,.5,-7)or UDim2.new(0,2,.5,-7)k.BackgroundColor3=Color3.fromRGB(255,255,255)k.Parent=b Instance.new("UICorner",k).CornerRadius=UDim.new(1,0)local st=d b.MouseButton1Click:Connect(function()st=not st T:Create(b,TweenInfo.new(.2),{BackgroundColor3=st and Color3.fromRGB(255,140,40)or Color3.fromRGB(65,50,40)}):Play()T:Create(k,TweenInfo.new(.2),{Position=st and UDim2.new(1,-16,.5,-7)or UDim2.new(0,2,.5,-7)}):Play()if cb then cb(st)end end)end
local function sld(p,txt,mn,mx,df,cb)local h=Instance.new("Frame")h.Size=UDim2.new(1,0,0,40)h.BackgroundTransparency=1 h.Parent=p local l=Instance.new("TextLabel")l.Text=txt l.Font=Enum.Font.Gotham l.TextSize=10 l.TextColor3=Color3.fromRGB(240,230,220)l.BackgroundTransparency=1 l.Size=UDim2.new(1,-40,0,12)l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=h local v=Instance.new("TextLabel")v.Text=tostring(df)v.Font=Enum.Font.GothamBold v.TextSize=10 v.TextColor3=Color3.fromRGB(255,160,60)v.BackgroundTransparency=1 v.Size=UDim2.new(0,35,0,12)v.Position=UDim2.new(1,-35,0,0)v.TextXAlignment=Enum.TextXAlignment.Right v.Parent=h local bb=Instance.new("Frame")bb.Size=UDim2.new(1,0,0,6)bb.Position=UDim2.new(0,0,0,22)bb.BackgroundColor3=Color3.fromRGB(65,50,40)bb.BorderSizePixel=0 bb.Parent=h Instance.new("UICorner",bb).CornerRadius=UDim.new(1,0)local fl=Instance.new("Frame")fl.Size=UDim2.new((df-mn)/(mx-mn),0,1,0)fl.BackgroundColor3=Color3.fromRGB(255,140,40)fl.BorderSizePixel=0 fl.Parent=bb Instance.new("UICorner",fl).CornerRadius=UDim.new(1,0)local k=Instance.new("Frame")k.Size=UDim2.new(0,12,0,12)k.Position=UDim2.new((df-mn)/(mx-mn),-6,.5,-6)k.BackgroundColor3=Color3.fromRGB(255,255,255)k.Parent=bb Instance.new("UICorner",k).CornerRadius=UDim.new(1,0)local dr=false local function up(x)local r=math.clamp((x-bb.AbsolutePosition.X)/bb.AbsoluteSize.X,0,1)local val=math.floor(mn+(mx-mn)*r+.5)fl.Size=UDim2.new(r,0,1,0)k.Position=UDim2.new(r,-6,.5,-6)v.Text=tostring(val)if cb then cb(val)end end bb.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=true up(i.Position.X)end end)U.InputChanged:Connect(function(i)if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then up(i.Position.X)end end)U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end end)end
local function btn(p,txt,c,cb)local b=Instance.new("TextButton")b.Size=UDim2.new(1,0,0,24)b.BackgroundColor3=c b.Text=txt b.Font=Enum.Font.GothamBold b.TextSize=10 b.TextColor3=Color3.fromRGB(25,15,10)b.AutoButtonColor=false b.Parent=p Instance.new("UICorner",b).CornerRadius=UDim.new(0,7)b.MouseButton1Click:Connect(cb)return b end
local s1=sec(pMain,"AUTO FARM",1)tog(s1,"Ativar Auto Farm (Favos)",false,function(v)St.AF=v N("FOX","Auto Farm "..(v and "ON"or "OFF"))end)
local s2=sec(pMain,"AUTO COLETAR MEL",2)tog(s2,"Ativar Auto Coletar",false,function(v)St.AC=v N("FOX","Auto Coletar "..(v and "ON"or "OFF"))end)
local s3=sec(pMain,"VELOCIDADE",3)local spv=16 sld(s3,"Velocidade (16-95)",16,95,16,function(v)spv=v local c=L.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=v end end)btn(s3,"Restaurar (16)",Color3.fromRGB(255,140,40),function()spv=16 local c=L.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=16 end end)
local s4=sec(pPlayer,"MOVIMENTO",1)tog(s4,"Pulo Infinito",false,function(v)St.IJ=v N("FOX","Pulo "..(v and "ON"or "OFF"))end)tog(s4,"Noclip",false,function(v)St.Noclip=v N("FOX","Noclip "..(v and "ON"or "OFF"))local c=L.Character if c then for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=not v end end end end)
local s5=sec(pPlayer,"UTILITARIOS",2)tog(s5,"Anti-AFK",false,function(v)St.AntiAFK=v N("FOX","Anti-AFK "..(v and "ON"or "OFF"))end)tog(s5,"FPS Booster",false,function(v)St.FPS=v N("FOX","FPS "..(v and "ON"or "OFF"))end)
local s5b=sec(pPlayer,"CONEXAO",3)tog(s5b,"Auto Reconnect",false,function(v)St.AR=v N("FOX","Auto Reconnect "..(v and "ON"or "OFF"))end)tog(s5b,"Server Hop",false,function(v)St.SH=v N("FOX","Server Hop "..(v and "ON"or "OFF"))end)
local s7=sec(pPlayer,"INFO",4)local iu=Instance.new("TextLabel")iu.Text="User: "..L.Name iu.Font=Enum.Font.Gotham iu.TextSize=10 iu.TextColor3=Color3.fromRGB(240,230,220)iu.BackgroundTransparency=1 iu.Size=UDim2.new(1,0,0,14)iu.TextXAlignment=Enum.TextXAlignment.Left iu.Parent=s7
local s8=sec(pSet,"DISCORD",1)
local dLink="https://discord.gg/Fc3g4pKwx"
local ll=Instance.new("TextLabel")ll.Text=dLink ll.Font=Enum.Font.Gotham ll.TextSize=9 ll.TextColor3=Color3.fromRGB(140,180,255)ll.BackgroundColor3=Color3.fromRGB(20,15,10)ll.BackgroundTransparency=.3 ll.Size=UDim2.new(1,0,0,24)ll.TextXAlignment=Enum.TextXAlignment.Center ll.Parent=s8
Instance.new("UICorner",ll).CornerRadius=UDim.new(0,6)
local cb=Instance.new("TextButton")cb.Size=UDim2.new(1,0,0,26)cb.BackgroundColor3=Color3.fromRGB(88,101,242)cb.Text="Copiar Link"cb.Font=Enum.Font.GothamBold cb.TextSize=10 cb.TextColor3=Color3.fromRGB(255,255,255)cb.AutoButtonColor=false cb.Parent=s8
Instance.new("UICorner",cb).CornerRadius=UDim.new(0,7)
cb.MouseButton1Click:Connect(function()local ok=false pcall(function()if setclipboard then setclipboard(dLink)ok=true end end)if not ok then pcall(function()if toclipboard then toclipboard(dLink)ok=true end end)end N("FOX",ok and "Link copiado!"or "Nao suportado")end)
ativarAba("Main")
N("FOX HUB","UI pronta!",5)

-- ═══════════════════════════════════════════════════════════
-- 🦊 FOX HUB - PARTE 2 (Loops + Server Hop)
-- ═══════════════════════════════════════════════════════════
local St2=_G.FoxSt
local P2=game:GetService("Players")local L2=P2.LocalPlayer
local W2=game:GetService("Workspace")local S2=game:GetService("StarterGui")
local TS2=game:GetService("TeleportService")
local HS2=game:GetService("HttpService")
local function N2(a,b)S2:SetCore("SendNotification",{Title=a,Text=b,Duration=3})end

if _G.FoxLoop then _G.FoxLoop=false task.wait(1)end
_G.FoxLoop=true

task.spawn(function()
    while St2.R and _G.FoxLoop do
        pcall(function()
            if _G.FoxTimer then
                local achou=false
                for _,g in pairs(L2.PlayerGui:GetDescendants())do
                    if g:IsA("TextLabel") or g:IsA("TextButton")then
                        local m=string.match(g.Text,"(%d+:%d+)")
                        if m then
                            local l=string.lower(g.Text)
                            if string.find(l,"proximo") or string.find(l,"próximo") or string.find(l,"next") or string.find(l,"evento")then
                                _G.FoxTimer.Text="⏰ "..m achou=true break
                            end
                        end
                    end
                end
                if not achou then
                    local PG=L2:WaitForChild("PlayerGui")
                    local mainGui=PG:FindFirstChild("MainGUI")
                    if mainGui then
                        for _,g in pairs(mainGui:GetDescendants())do
                            if g:IsA("TextLabel")then
                                local m=string.match(g.Text,"(%d+:%d+)")
                                if m then _G.FoxTimer.Text="⏰ "..m achou=true break end
                            end
                        end
                    end
                    if not achou then _G.FoxTimer.Text="⏰ --:--" end
                end
            end
        end)
        task.wait(1)
    end
end)

local function pecaAlta(obj)
    local alta,maiorY=nil,-9999
    for _,p in ipairs(obj:GetDescendants())do
        if p:IsA("BasePart")and p.Position.Y>maiorY then maiorY=p.Position.Y alta=p end
    end
    return alta
end

local function acharTerreno()
    local nome=string.lower(L2.Name)
    local display=string.lower(L2.DisplayName or "")
    local id=tostring(L2.UserId)
    for _,obj in ipairs(W2:GetDescendants())do
        if obj:IsA("Model")and obj.Parent then
            local n=string.lower(obj.Name)
            if string.find(n,nome)or string.find(n,id)or(display~=""and string.find(n,display))then
                    end
        end
    end
    return nil
end

task.spawn(function()
    while St2.R and _G.FoxLoop do
        pcall(function()
            if St2.AF then
                local c=L2.Character
                local h=c and c:FindFirstChild("HumanoidRootPart")
                if h then
                    for _,o in ipairs(W2:GetDescendants())do
                        if o.Name=="Super Honey"and o.Parent then
                            local caminho=o:GetFullName():lower()
                            if not caminho:find("carro")and not caminho:find("carrinho")then
                                local alta=nil local maiorY=-9999
                                if o:IsA("Model")then
                                    for _,p in ipairs(o:GetDescendants())do
                                        if p:IsA("BasePart")and p.Position.Y>maiorY then maiorY=p.Position.Y alta=p end
                                    end
                                elseif o:IsA("BasePart")then alta=o end
                                if alta then
                                    local pA=h.CFrame
                                    h.CFrame=CFrame.new(alta.Position+Vector3.new(0,3,0))
                                    task.wait(0.3)
                                    h.CFrame=pA
                                    task.wait(0.05)
                                end
                            end
                        end
                    end
                end
            end
        end)
        task.wait(0.5)
    end
end)

task.spawn(function()
    while St2.R and _G.FoxLoop do
        pcall(function()
            if St2.AC then
                local c=L2.Character
                local h=c and c:FindFirstChild("HumanoidRootPart")
                if h then
                    local t=acharTerreno()
                    if t then
                        local col=0
                        for _,obj in ipairs(t:GetDescendants())do
                            if obj:IsA("Model")and obj.Parent then
                                local n=obj.Name:lower()
                                if (n:find("apiary")or n:find("beehive"))and not n:find("large apiary")and not n:find("loja")then
                                    local prim=obj.PrimaryPart
                                    if not prim then prim=obj:FindFirstChildWhichIsA("BasePart",true)end
                                    if prim then
                                        local pA=h.CFrame
                                        h.CFrame=CFrame.new(prim.Position+Vector3.new(0,3,0))
                                        task.wait(0.15)
                                        h.CFrame=pA
                                        task.wait(0.02)
                                        col=col+1
                                    end
                                end
                            end
                        end
                        if col>0 then task.wait(15)end
                    end
                end
            end
        end)
        task.wait(0.5)
    end
end)

task.spawn(function()
    while St2.R and _G.FoxLoop do
        pcall(function()
            if St2.AC then
                local c=L2.Character
                local h=c and c:FindFirstChild("HumanoidRootPart")
                if h then
                    local t=acharTerreno()
                    if t then
                        local col=0
                        for _,obj in ipairs(t:GetDescendants())do
                            if obj:IsA("Model")and obj.Parent then
                                local nb=obj.Name:lower()
                                if nb=="large apiary"or nb=="honey barrel"then
                                    local p=pecaAlta(obj)
                                    if p then
                                        local pA=h.CFrame
                                        h.CFrame=CFrame.new(p.Position+Vector3.new(0,3,0))
                                        task.wait(0.3)
                                        h.CFrame=pA
                                        task.wait(0.1)
                                        col=col+1
                                    end
                                end
                            end
                        end
                        if col>0 then task.wait(15)end
                    end
                end
            end
        end)
        task.wait(0.5)
    end
end)

task.spawn(function()
    while St2.R and _G.FoxLoop do
        if St2.AntiAFK then
            pcall(function()
                local vu=game:GetService("VirtualUser")
                vu:CaptureController()
                vu:ClickButton2(Vector2.new(0,0))
                vu:Button1Down(Vector2.new(0,0))
                task.wait(0.05)
                vu:Button1Up(Vector2.new(0,0))
            end)
            pcall(function()
                local c=L2.Character
                local h=c and c:FindFirstChildOfClass("Humanoid")
                if h then h.Jump=true task.wait(0.1) h.Jump=false end
            end)
            task.wait(240)
        else task.wait(3) end
    end
end)

task.spawn(function()
    while St2.R and _G.FoxLoop do
        task.wait(5)
        if St2.AR then
            pcall(function()
                if not game:IsLoaded() then return end
                if not L2.Parent then
                    local pid=game.PlaceId local jid=game.JobId
                    if jid and jid~=""then TS2:TeleportToPlaceInstance(pid,jid,L2)
                    else TS2:Teleport(pid,L2) end
                end
            end)
        end
    end
end)

game:GetService("Players").PlayerRemoving:Connect(function(p)if p==L2 and St2.AR then N2("FOX","Caiu! Reconectando...",5)end end)

task.spawn(function()
    while St2.R and _G.FoxLoop do
        task.wait(5)
        if St2.SH then
            pcall(function()
                local url="https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
                local resposta=game:HttpGet(url)
                local dados=HS2:JSONDecode(resposta)
                if dados and dados.data then
                    local melhor=nil local menor=999
                    for _,s in ipairs(dados.data)do
                        if s.id~=game.JobId and s.playing and s.playing>0 and s.playing<menor then
                            menor=s.playing melhor=s
                        end
                    end
                    if melhor then
                        N2("FOX HUB","Server Hop: "..menor.." players",3)
                        task.wait(1)
                        TS2:TeleportToPlaceInstance(game.PlaceId,melhor.id,L2)
                    else N2("FOX HUB","Nenhum servidor bom",5)end
                end
            end)
            task.wait(300)
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()if St2.IJ then local c=L2.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end end end)
game:GetService("RunService").Stepped:Connect(function()if St2.Noclip then local c=L2.Character if c then for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")and p.CanCollide then p.CanCollide=false end end end end end)

task.spawn(function()
    while St2.R and _G.FoxLoop do
        if St2.FPS then
            pcall(function()
                for _,o in ipairs(W2:GetDescendants())do
                    if (o:IsA("ParticleEmitter")or o:IsA("Trail")or o:IsA("Smoke")or o:IsA("Fire")or o:IsA("Sparkles")or o:IsA("Beam"))and o.Enabled then o.Enabled=false end
                end
            end)
            task.wait(2)
        else task.wait(2)end
    end
end)

N2("🦊 FOX HUB","✅ Tudo carregado!",5)
