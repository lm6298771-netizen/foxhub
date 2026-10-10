local P=game:GetService("Players")local U=game:GetService("UserInputService")local T=game:GetService("TweenService")local S=game:GetService("StarterGui")local W=game:GetService("Workspace")local R=game:GetService("RunService")local L=P.LocalPlayer local G=L:WaitForChild("PlayerGui")
local function N(a,b)S:SetCore("SendNotification",{Title=a,Text=b,Duration=3})end
local screen=Instance.new("ScreenGui")screen.Name="FoxHubUI"screen.ResetOnSpawn=false screen.Parent=G

local icon=Instance.new("TextButton")
icon.Size=UDim2.new(0,60,0,60)
icon.Position=UDim2.new(0,20,.4,0)
icon.BackgroundColor3=Color3.fromRGB(0,0,0)
icon.Text=""
icon.AutoButtonColor=false
icon.Parent=screen
Instance.new("UICorner",icon).CornerRadius=UDim.new(0,12)
local iconImg=Instance.new("ImageLabel")
iconImg.Image="rbxassetid://97125286596491"
iconImg.Size=UDim2.new(1,0,1,0)
iconImg.Position=UDim2.new(0,0,0,0)
iconImg.BackgroundTransparency=1
iconImg.ScaleType=Enum.ScaleType.Stretch
iconImg.Parent=icon
Instance.new("UICorner",iconImg).CornerRadius=UDim.new(0,12)

local main=Instance.new("Frame")main.Size=UDim2.new(0,340,0,460)main.Position=UDim2.new(.5,-170,.5,-230)main.BackgroundColor3=Color3.fromRGB(24,18,14)main.BorderSizePixel=0 main.Visible=false main.Parent=screen
Instance.new("UICorner",main).CornerRadius=UDim.new(0,12)
local fundo=Instance.new("ImageLabel")fundo.Image="rbxassetid://72761035601440"fundo.Size=UDim2.new(1,0,1,0)fundo.BackgroundTransparency=1 fundo.ImageTransparency=.8 fundo.ScaleType=Enum.ScaleType.Crop fundo.Parent=main
Instance.new("UICorner",fundo).CornerRadius=UDim.new(0,12)
local borda=Instance.new("UIStroke")borda.Color=Color3.fromRGB(255,140,40)borda.Thickness=1.4 borda.Transparency=.35 borda.Parent=main
local top=Instance.new("Frame")top.Size=UDim2.new(1,0,0,40)top.BackgroundColor3=Color3.fromRGB(35,24,18)top.BackgroundTransparency=.15 top.BorderSizePixel=0 top.ZIndex=5 top.Parent=main
Instance.new("UICorner",top).CornerRadius=UDim.new(0,12)
local tl=Instance.new("TextLabel")tl.Text="FOX HUB"tl.Font=Enum.Font.GothamBold tl.TextSize=14 tl.TextColor3=Color3.fromRGB(255,160,60)tl.BackgroundTransparency=1 tl.Size=UDim2.new(1,-50,1,0)tl.Position=UDim2.new(0,14,0,0)tl.TextXAlignment=Enum.TextXAlignment.Left tl.ZIndex=6 tl.Parent=top
local xb=Instance.new("TextButton")xb.Size=UDim2.new(0,26,0,26)xb.Position=UDim2.new(1,-34,0,7)xb.BackgroundColor3=Color3.fromRGB(240,70,90)xb.Text="X"xb.TextColor3=Color3.fromRGB(255,255,255)xb.Font=Enum.Font.GothamBold xb.TextSize=14 xb.ZIndex=6 xb.Parent=top
Instance.new("UICorner",xb).CornerRadius=UDim.new(0,7)
xb.MouseButton1Click:Connect(function()main.Visible=false end)
local drag,ds,sp
top.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=true ds=i.Position sp=main.Position end end)
top.InputChanged:Connect(function(i)if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds main.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end end)
U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=false end end)
local idrag,imoved
icon.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then idrag=true imoved=false ds=i.Position sp=icon.Position end end)
icon.InputChanged:Connect(function(i)if idrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds if math.abs(d.X)>5 or math.abs(d.Y)>5 then imoved=true end icon.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end end)
U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then idrag=false end end)
icon.MouseButton1Click:Connect(function()if not imoved then main.Visible=not main.Visible end end)

-- Scroll + Content
local scroll=Instance.new("ScrollingFrame")
scroll.Position=UDim2.new(0,10,0,48)
scroll.Size=UDim2.new(1,-20,1,-58)
scroll.BackgroundTransparency=1
scroll.BorderSizePixel=0
scroll.ScrollBarThickness=4
scroll.ScrollBarImageColor3=Color3.fromRGB(255,140,40)
scroll.CanvasSize=UDim2.new(0,0,0,0)
scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
scroll.ZIndex=10
scroll.Parent=main
local list=Instance.new("UIListLayout")list.Padding=UDim.new(0,8)list.SortOrder=Enum.SortOrder.LayoutOrder list.Parent=scroll
local cont=scroll

local St={AF=false,SM=false,SP=16,R=true,AntiAFK=false,Recon=false,FPS=false,IJ=false,Noclip=false}
local conns={}

local function sec(n,o)local s=Instance.new("Frame")s.Size=UDim2.new(1,0,0,0)s.AutomaticSize=Enum.AutomaticSize.Y s.BackgroundColor3=Color3.fromRGB(35,25,18)s.BackgroundTransparency=.25 s.BorderSizePixel=0 s.LayoutOrder=o s.ZIndex=10 s.Parent=cont local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,10)c.Parent=s local p=Instance.new("UIPadding")p.PaddingTop=UDim.new(0,8)p.PaddingBottom=UDim.new(0,8)p.PaddingLeft=UDim.new(0,10)p.PaddingRight=UDim.new(0,10)p.Parent=s local l=Instance.new("UIListLayout")l.Padding=UDim.new(0,6)l.SortOrder=Enum.SortOrder.LayoutOrder l.Parent=s local t=Instance.new("TextLabel")t.Text=n t.Font=Enum.Font.GothamBold t.TextSize=12 t.TextColor3=Color3.fromRGB(255,160,60)t.BackgroundTransparency=1 t.Size=UDim2.new(1,0,0,16)t.TextXAlignment=Enum.TextXAlignment.Left t.LayoutOrder=0 t.ZIndex=11 t.Parent=s return s end
local function tog(p,txt,d,cb)local r=Instance.new("Frame")r.Size=UDim2.new(1,0,0,26)r.BackgroundTransparency=1 r.ZIndex=11 r.Parent=p local l=Instance.new("TextLabel")l.Text=txt l.Font=Enum.Font.Gotham l.TextSize=11 l.TextColor3=Color3.fromRGB(240,230,220)l.BackgroundTransparency=1 l.Size=UDim2.new(1,-55,1,0)l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=12 l.Parent=r local b=Instance.new("TextButton")b.Size=UDim2.new(0,44,0,22)b.Position=UDim2.new(1,-44,.5,-11)b.BackgroundColor3=d and Color3.fromRGB(255,140,40)or Color3.fromRGB(65,50,40)b.Text=""b.AutoButtonColor=false b.ZIndex=12 b.Parent=r Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)local k=Instance.new("Frame")k.Size=UDim2.new(0,16,0,16)k.Position=d and UDim2.new(1,-18,.5,-8)or UDim2.new(0,2,.5,-8)k.BackgroundColor3=Color3.fromRGB(255,255,255)k.ZIndex=13 k.Parent=b Instance.new("UICorner",k).CornerRadius=UDim.new(1,0)local st=d b.MouseButton1Click:Connect(function()st=not st T:Create(b,TweenInfo.new(.2),{BackgroundColor3=st and Color3.fromRGB(255,140,40)or Color3.fromRGB(65,50,40)}):Play()T:Create(k,TweenInfo.new(.2),{Position=st and UDim2.new(1,-18,.5,-8)or UDim2.new(0,2,.5,-8)}):Play()if cb then cb(st)end end)end
local function sld(p,txt,mn,mx,df,cb)local h=Instance.new("Frame")h.Size=UDim2.new(1,0,0,44)h.BackgroundTransparency=1 h.ZIndex=11 h.Parent=p local l=Instance.new("TextLabel")l.Text=txt l.Font=Enum.Font.Gotham l.TextSize=11 l.TextColor3=Color3.fromRGB(240,230,220)l.BackgroundTransparency=1 l.Size=UDim2.new(1,-45,0,14)l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=12 l.Parent=h local v=Instance.new("TextLabel")v.Text=tostring(df)v.Font=Enum.Font.GothamBold v.TextSize=11 v.TextColor3=Color3.fromRGB(255,160,60)v.BackgroundTransparency=1 v.Size=UDim2.new(0,40,0,14)v.Position=UDim2.new(1,-40,0,0)v.TextXAlignment=Enum.TextXAlignment.Right v.ZIndex=12 v.Parent=h local bb=Instance.new("Frame")bb.Size=UDim2.new(1,0,0,7)bb.Position=UDim2.new(0,0,0,24)bb.BackgroundColor3=Color3.fromRGB(65,50,40)bb.BorderSizePixel=0 bb.ZIndex=12 bb.Parent=h Instance.new("UICorner",bb).CornerRadius=UDim.new(1,0)local fl=Instance.new("Frame")fl.Size=UDim2.new((df-mn)/(mx-mn),0,1,0)fl.BackgroundColor3=Color3.fromRGB(255,140,40)fl.BorderSizePixel=0 fl.ZIndex=12 fl.Parent=bb Instance.new("UICorner",fl).CornerRadius=UDim.new(1,0)local k=Instance.new("Frame")k.Size=UDim2.new(0,14,0,14)k.Position=UDim2.new((df-mn)/(mx-mn),-7,.5,-7)k.BackgroundColor3=Color3.fromRGB(255,255,255)k.ZIndex=13 k.Parent=bb Instance.new("UICorner",k).CornerRadius=UDim.new(1,0)local dr=false local function up(x)local r=math.clamp((x-bb.AbsolutePosition.X)/bb.AbsoluteSize.X,0,1)local val=math.floor(mn+(mx-mn)*r+.5)fl.Size=UDim2.new(r,0,1,0)k.Position=UDim2.new(r,-7,.5,-7)v.Text=tostring(val)if cb then cb(val)end end bb.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=true up(i.Position.X)end end)U.InputChanged:Connect(function(i)if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then up(i.Position.X)end end)U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end end)end
local function btn(p,txt,c,cb)local b=Instance.new("TextButton")b.Size=UDim2.new(1,0,0,26)b.BackgroundColor3=c b.Text=txt b.Font=Enum.Font.GothamBold b.TextSize=11 b.TextColor3=Color3.fromRGB(25,15,10)b.AutoButtonColor=false b.ZIndex=12 b.Parent=p Instance.new("UICorner",b).CornerRadius=UDim.new(0,7)b.MouseButton1Click:Connect(cb)return b end

-- SEÇÕES
local s1=sec("AUTO FARM",1)
tog(s1,"Ativar Auto Farm (Super Honey)",false,function(v)St.AF=v N("FOX HUB","Auto Farm "..(v and "Ativado"or "Desativado"))end)

local s2=sec("EVENTO SUPER MEL",2)
tog(s2,"Ativar Evento Super Mel",false,function(v)St.SM=v N("FOX HUB","Super Mel "..(v and "Ativado"or "Desativado"))end)

local s3=sec("VELOCIDADE",3)
local spv=16
sld(s3,"Velocidade (16 a 95)",16,95,16,function(v)spv=v local c=L.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=v end end)
btn(s3,"Restaurar padrao (16)",Color3.fromRGB(255,140,40),function()spv=16 local c=L.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=16 end N("FOX HUB","Restaurado para 16")end)

-- MOVIMENTO
local s4=sec("MOVIMENTO",4)
tog(s4,"Pulo Infinito",false,function(v)St.IJ=v N("FOX HUB","Pulo Infinito "..(v and "Ativado"or "Desativado"))end)
tog(s4,"Noclip (atravessar paredes)",false,function(v)
    St.Noclip=v
    N("FOX HUB","Noclip "..(v and "Ativado"or "Desativado"))
    local c=L.Character
    if c then
        for _,p in ipairs(c:GetDescendants())do
            if p:IsA("BasePart")then p.CanCollide=not v end
        end
    end
end)

-- UTILITÁRIOS
local s5=sec("UTILITARIOS",5)
tog(s5,"Anti-AFK",false,function(v)St.AntiAFK=v N("FOX HUB","Anti-AFK "..(v and "Ativado"or "Desativado"))end)
tog(s5,"Auto Reconnect",false,function(v)St.Recon=v N("FOX HUB","Auto Reconnect "..(v and "Ativado"or "Desativado"))end)
tog(s5,"FPS Booster",false,function(v)St.FPS=v N("FOX HUB","FPS Booster "..(v and "Ativado"or "Desativado"))end)

-- ============================================================
-- LÓGICAS
-- ============================================================

-- AUTO FARM
task.spawn(function()while St.R do pcall(function()if St.AF then local c=L.Character local h=c and c:FindFirstChild("HumanoidRootPart")if h then local favos={}for _,o in ipairs(W:GetDescendants())do if o:IsA("Model")and o.Name=="Super Honey"and o.Parent then local prim=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart")if prim then local d=(prim.Position-h.Position).Magnitude table.insert(favos,{prim=prim,dist=d})end end end table.sort(favos,function(a,b)return a.dist<b.dist end)for _,f in ipairs(favos)do if not St.AF or not St.R then break end if f.prim and f.prim.Parent then h.CFrame=CFrame.new(f.prim.Position+Vector3.new(0,3,0))task.wait(0.3)end end end end end)task.wait(0.3)end end)

-- PULO INFINITO
U.JumpRequest:Connect(function()
    if St.IJ then
        local c=L.Character
        local h=c and c:FindFirstChildOfClass("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

-- NOCLIP (mantém CanCollide=false continuamente)
R.Stepped:Connect(function()
    if St.Noclip then
        local c=L.Character
        if c then
            for _,p in ipairs(c:GetDescendants())do
                if p:IsA("BasePart")and p.CanCollide then p.CanCollide=false end
            end
        end
    end
end)

-- ANTI-AFK
task.spawn(function()
    while St.R do
        if St.AntiAFK then
            pcall(function()
                local vu=game:GetService("VirtualUser")
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
            task.wait(60)
        else
            task.wait(3)
        end
    end
end)

-- FPS BOOSTER
local fpsRemovidos={}
task.spawn(function()
    while St.R do
        if St.FPS then
            pcall(function()
                for _,o in ipairs(W:GetDescendants())do
                    if (o:IsA("ParticleEmitter")or o:IsA("Trail")or o:IsA("Smoke")or o:IsA("Fire")or o:IsA("Sparkles")or o:IsA("Beam"))and o.Enabled then
                        o.Enabled=false
                        table.insert(fpsRemovidos,o)
                    end
                end
                for _,o in ipairs(game:GetService("Lighting"):GetChildren())do
                    if o:IsA("PostEffect")then o.Enabled=false end
                end
            end)
            task.wait(2)
        else
            task.wait(2)
        end
    end
end)

-- AUTO RECONNECT
task.spawn(function()
    while St.R do
        if St.Recon then
            pcall(function()
                local ok=pcall(function()
                    if queue_on_teleport then
                        queue_on_teleport([[
                            loadstring(game:HttpGet("COLE_AQUI_URL_DO_SEU_SCRIPT"))()
                        ]])
                    end
                end)
            end)
        end
        task.wait(5)
    end
end)

L.CharacterAdded:Connect(function()task.wait(1)local c=L.Character local h=c and c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=spv end end)
N("FOX HUB","Pronto! Clique no icone")
