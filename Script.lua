-- ============================================================================
-- THÀNH ĐẠT - AIM KILL EDITION (DELTA X EXCLUSIVE)
-- ============================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("ThanhDatAimKill") then
    CoreGui.ThanhDatAimKill:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ThanhDatAimKill"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
MainFrame.Position = UDim2.new(0.5, -235, 0.5, -240)
MainFrame.Size = UDim2.new(0, 470, 0, 480)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(0, 255, 180)
UIStroke.Thickness = 2

local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BorderSizePixel = 0
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 14)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Size = UDim2.new(1, -30, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "💎 THÀNH ĐẠT - AIM KILL EDITION 💎"
TitleText.TextColor3 = Color3.fromRGB(0, 255, 180)
TitleText.TextSize = 12
TitleText.TextXAlignment = Enum.TextXAlignment.Left

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ToggleButton.Position = UDim2.new(0, 20, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 55, 0, 55)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "MENU"
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 180)
ToggleButton.TextSize = 12
ToggleButton.Active = true
ToggleButton.Draggable = true
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleButton)
ToggleStroke.Color = Color3.fromRGB(0, 255, 180)
ToggleStroke.Thickness = 1.5

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 12, 0, 55)
Container.Size = UDim2.new(1, -24, 1, -65)
Container.CanvasSize = UDim2.new(0, 0, 5.2, 0)
Container.ScrollBarThickness = 4

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Container
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

local function createToggleBtn(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text .. ": TẮT"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

--------------------------------------------------------------------------------
-- 1. XUYÊN TƯỜNG (NOCLIP)
--------------------------------------------------------------------------------
local NoclipSection = Instance.new("Frame", Container)
NoclipSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
NoclipSection.Size = UDim2.new(1, 0, 0, 50)
Instance.new("UICorner", NoclipSection).CornerRadius = UDim.new(0, 8)

local noclipActive = false
local NoclipBtn = createToggleBtn(NoclipSection, "👻 Xuyên Tường")
NoclipBtn.Position = UDim2.new(0, 10, 0, 6)
NoclipBtn.Size = UDim2.new(1, -20, 0, 38)

NoclipBtn.MouseButton1Click:Connect(function()
    noclipActive = not noclipActive
    NoclipBtn.BackgroundColor3 = noclipActive and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(180, 40, 40)
    NoclipBtn.Text = noclipActive and "👻 Xuyên Tường: BẬT" or "👻 Xuyên Tường: TẮT"
end)

RunService.Stepped:Connect(function()
    if noclipActive then
        pcall(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    end
end)

--------------------------------------------------------------------------------
-- 2. ESP TÊN, KHOẢNG CÁCH & KHUNG BOX
--------------------------------------------------------------------------------
local ESPSection = Instance.new("Frame", Container)
ESPSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ESPSection.Size = UDim2.new(1, 0, 0, 50)
Instance.new("UICorner", ESPSection).CornerRadius = UDim.new(0, 8)

local espActive = false
local ESPBtn = createToggleBtn(ESPSection, "👁️ ESP Tên & Khung Box")
ESPBtn.Position = UDim2.new(0, 10, 0, 6)
ESPBtn.Size = UDim2.new(1, -20, 0, 38)

ESPBtn.MouseButton1Click:Connect(function()
    espActive = not espActive
    ESPBtn.BackgroundColor3 = espActive and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(180, 40, 40)
    ESPBtn.Text = espActive and "👁️ ESP Tên & Khung: BẬT" or "👁️ ESP Tên & Khung: TẮT"
end)

local activeTags = {}
local activeBoxes = {}

RunService.RenderStepped:Connect(function()
    pcall(function()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local char = p.Character
                if espActive and char and char:FindFirstChild("Head") and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                    local root = char.HumanoidRootPart
                    local tag = activeTags[p]
                    if not tag or not tag.Parent then
                        local bill = Instance.new("BillboardGui", char)
                        bill.Name = "ThanhDatESP"
                        bill.AlwaysOnTop = true
                        bill.Size = UDim2.new(0, 160, 0, 40)
                        bill.StudsOffset = Vector3.new(0, 2.8, 0)
                        
                        local txt = Instance.new("TextLabel", bill)
                        txt.Name = "Info"
                        txt.BackgroundTransparency = 1
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.Font = Enum.Font.GothamBold
                        txt.TextSize = 11
                        txt.TextColor3 = Color3.fromRGB(0, 255, 180)
                        txt.TextStrokeTransparency = 0.3
                        
                        activeTags[p] = bill
                        tag = bill
                    end
                    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local dist = myRoot and math.floor((root.Position - myRoot.Position).Magnitude) or 0
                    if tag:FindFirstChild("Info") then
                        tag.Info.Text = "👤 " .. p.Name .. " [" .. dist .. "m]"
                    end
                    tag.Enabled = true

                    local box = activeBoxes[p]
                    if not box or not box.Parent then
                        local highlight = Instance.new("Highlight", char)
                        highlight.Name = "ThanhDatBox"
                        highlight.FillColor = Color3.fromRGB(0, 255, 180)
                        highlight.FillTransparency = 0.85
                        highlight.OutlineColor = Color3.fromRGB(0, 255, 180)
                        highlight.OutlineTransparency = 0.2
                        activeBoxes[p] = highlight
                    end
                else
                    if activeTags[p] then activeTags[p].Enabled = false end
                    if activeBoxes[p] then activeBoxes[p]:Destroy() activeBoxes[p] = nil end
                end
            end
        end
    end)
end)

--------------------------------------------------------------------------------
-- 3. XOAY NHÂN VẬT (SPINBOT)
--------------------------------------------------------------------------------
local SpinSection = Instance.new("Frame", Container)
SpinSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
SpinSection.Size = UDim2.new(1, 0, 0, 50)
Instance.new("UICorner", SpinSection).CornerRadius = UDim.new(0, 8)

local spinActive = false
local SpinBtn = createToggleBtn(SpinSection, "🌀 Xoay Nhân Vật (Spinbot)")
SpinBtn.Position = UDim2.new(0, 10, 0, 6)
SpinBtn.Size = UDim2.new(1, -20, 0, 38)

SpinBtn.MouseButton1Click:Connect(function()
    spinActive = not spinActive
    SpinBtn.BackgroundColor3 = spinActive and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(180, 40, 40)
    SpinBtn.Text = spinActive and "🌀 Xoay Nhân Vật: BẬT" or "🌀 Xoay Nhân Vật: TẮT"
end)

RunService.RenderStepped:Connect(function()
    if spinActive then
        pcall(function()
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(35), 0)
            end
        end)
    end
end)

--------------------------------------------------------------------------------
-- 4. AIMBOT VÒNG TRÒN FOV (AIM CŨ)
--------------------------------------------------------------------------------
local AimbotSection = Instance.new("Frame", Container)
AimbotSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
AimbotSection.Size = UDim2.new(1, 0, 0, 100)
Instance.new("UICorner", AimbotSection).CornerRadius = UDim.new(0, 8)

local aimbotActive = false
local AimbotBtn = createToggleBtn(AimbotSection, "🎯 Aimbot Vòng Tròn (Aim Cũ)")
AimbotBtn.Position = UDim2.new(0, 10, 0, 8)
AimbotBtn.Size = UDim2.new(1, -20, 0, 32)

AimbotBtn.MouseButton1Click:Connect(function()
    aimbotActive = not aimbotActive
    AimbotBtn.BackgroundColor3 = aimbotActive and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(180, 40, 40)
    AimbotBtn.Text = aimbotActive and "🎯 Aimbot Vòng Tròn: BẬT" or "🎯 Aimbot Vòng Tròn: TẮT"
end)

local FOVBox = Instance.new("TextBox", AimbotSection)
FOVBox.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
FOVBox.Position = UDim2.new(0, 10, 0, 48)
FOVBox.Size = UDim2.new(1, -20, 0, 32)
FOVBox.Font = Enum.Font.Gotham
FOVBox.Text = "Bán kính FOV: 150"
FOVBox.TextColor3 = Color3.fromRGB(0, 255, 180)
FOVBox.TextSize = 11
Instance.new("UICorner", FOVBox).CornerRadius = UDim.new(0, 6)

local fovRadius = 150
FOVBox.FocusLost:Connect(function()
    local val = tonumber(FOVBox.Text:match("%d+"))
    if val then fovRadius = val FOVBox.Text = "Bán kính FOV: " .. val else FOVBox.Text = "Bán kính FOV: " .. fovRadius end
end)

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1.5
fovCircle.NumSides = 64
fovCircle.Radius = fovRadius
fovCircle.Filled = false
fovCircle.Color = Color3.fromRGB(0, 255, 180)
fovCircle.Visible = false

local isShooting = false
local currentWeaponConn = nil

local function hookWeapon(char)
    if currentWeaponConn then currentWeaponConn:Disconnect() currentWeaponConn = nil end
    local tool = char:FindFirstChildOfClass("Tool")
    if tool then
        currentWeaponConn = tool.Activated:Connect(function()
            isShooting = true
            task.delay(0.2, function() isShooting = false end)
        end)
    end
end

LocalPlayer.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then hookWeapon(char) end
    end)
end)

if LocalPlayer.Character then
    hookWeapon(LocalPlayer.Character)
    LocalPlayer.Character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then hookWeapon(LocalPlayer.Character) end
    end)
end

RunService.RenderStepped:Connect(function()
    pcall(function()
        local Cam = workspace.CurrentCamera
        if not Cam then return end
        local screenCenter = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2)
        
        if aimbotActive then
            fovCircle.Visible = true
            fovCircle.Radius = fovRadius
            fovCircle.Position = screenCenter
        else
            fovCircle.Visible = false
        end

        if not aimbotActive or not isShooting then return end

        local nearestTarget = nil
        local shortestDist = fovRadius
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") then
                if p.Character.Humanoid.Health > 0 then
                    local head = p.Character.Head
                    local screenPoint, onScreen = Cam:WorldToViewportPoint(head.Position)
                    if onScreen then
                        local dist = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            nearestTarget = head
                        end
                    end
                end
            end
        end
        if nearestTarget then
            Cam.CFrame = CFrame.new(Cam.CFrame.Position, nearestTarget.Position)
        end
    end)
end)

--------------------------------------------------------------------------------
-- 5. AUTO AIM KILL PVP NẰM NGANG (SĂN ĐẾN KHI CHẾT HẲN + LỌC PVP)
--------------------------------------------------------------------------------
local PVPSection = Instance.new("Frame", Container)
PVPSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
PVPSection.Size = UDim2.new(1, 0, 0, 50)
Instance.new("UICorner", PVPSection).CornerRadius = UDim.new(0, 8)

local pvpAutoActive = false
local PVPBtn = createToggleBtn(PVPSection, "⚡ Auto Aim Kill (Nằm Ngang Úp Đầu)")
PVPBtn.Position = UDim2.new(0, 10, 0, 6)
PVPBtn.Size = UDim2.new(1, -20, 0, 38)

PVPBtn.MouseButton1Click:Connect(function()
    pvpAutoActive = not pvpAutoActive
    PVPBtn.BackgroundColor3 = pvpAutoActive and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(180, 40, 40)
    PVPBtn.Text = pvpAutoActive and "⚡ Auto Aim Kill: BẬT" or "⚡ Auto Aim Kill: TẮT"
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if pvpAutoActive then
            pcall(function()
                for _, target in ipairs(Players:GetPlayers()) do
                    if not pvpAutoActive then break end
                    if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and target.Character:FindFirstChild("Humanoid") then
                        local tHum = target.Character.Humanoid
                        local tRoot = target.Character.HumanoidRootPart
                        
                        if tHum.Health > 0 and tHum.MaxHealth > 0 then
                            local isSafe = false
                            pcall(function()
                                if target.Character:FindFirstChild("ForceField") then
                                    isSafe = true
                                end
                            end)
                            
                            if not isSafe then
                                local killStartTime = tick()
                                while tHum.Health > 0 and pvpAutoActive and target.Parent and target.Character:FindFirstChild("HumanoidRootPart") and (tick() - killStartTime < 15) do
                                    task.wait(0.02)
                                    pcall(function()
                                        local Cam = workspace.CurrentCamera
                                        local myChar = LocalPlayer.Character
                                        local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                                        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                                        
                                        if myRoot and tRoot and myHum then
                                            myHum.PlatformStand = true
                                            myRoot.Velocity = Vector3.new(0, 0, 0)
                                            myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 4, 0) * CFrame.Angles(math.rad(90), 0, 0)
                                            
                                            if Cam and target.Character:FindFirstChild("Head") then
                                                Cam.CFrame = CFrame.new(Cam.CFrame.Position, target.Character.Head.Position)
                                            end
                                            
                                            local tool = myChar and myChar:FindFirstChildOfClass("Tool")
                                            if tool then
                                                pcall(function()
                                                    tool:Activate()
                                                    if tool:FindFirstChild("RemoteEvent") then
                                                        tool.RemoteEvent:FireServer()
                                                    elseif tool:FindFirstChild("Handle") and tool.Handle:FindFirstChild("Fire") then
                                                        tool.Handle.Fire:FireServer()
                                                    end
                                                end)
                                            end
                                        end
                                    end)
                                end
                                
                                pcall(function()
                                    local myChar = LocalPlayer.Character
                                    local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                                    if myHum then myHum.PlatformStand = false end
                                end)
                            end
                        end
                    end
                end
            end)
        else
            pcall(function()
                local myChar = LocalPlayer.Character
                local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                if myHum then myHum.PlatformStand = false end
            end)
        end
    end
end)

--------------------------------------------------------------------------------
-- 6. DỊCH CHUYỂN NHANH TỚI NGƯỜI CHƠI (TELEVIP)
--------------------------------------------------------------------------------
local TeleSection = Instance.new("Frame", Container)
TeleSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TeleSection.Size = UDim2.new(1, 0, 0, 210)
Instance.new("UICorner", TeleSection).CornerRadius = UDim.new(0, 8)

local TeleTitle = Instance.new("TextLabel", TeleSection)
TeleTitle.BackgroundTransparency = 1
TeleTitle.Position = UDim2.new(0, 10, 0, 6)
TeleTitle.Size = UDim2.new(1, -20, 0, 20)
TeleTitle.Font = Enum.Font.GothamBold
TeleTitle.Text = "🚀 Dịch Chuyển Nhanh Tới Người Chơi"
TeleTitle.TextColor3 = Color3.fromRGB(0, 255, 180)
TeleTitle.TextSize = 12
TeleTitle.TextXAlignment = Enum.TextXAlignment.Left

local RefreshTeleBtn = Instance.new("TextButton", TeleSection)
RefreshTeleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 136)
RefreshTeleBtn.Position = UDim2.new(0, 10, 0, 32)
RefreshTeleBtn.Size = UDim2.new(0.48, 0, 0, 28)
RefreshTeleBtn.Font = Enum.Font.GothamBold
RefreshTeleBtn.Text = "🔄 Cập Nhật Server"
RefreshTeleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshTeleBtn.TextSize = 11
Instance.new("UICorner", RefreshTeleBtn).CornerRadius = UDim.new(0, 6)

local TeleBtn = Instance.new("TextButton", TeleSection)
TeleBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
TeleBtn.Position = UDim2.new(0.51, 0, 0, 32)
TeleBtn.Size = UDim2.new(0.49, -10, 0, 28)
TeleBtn.Font = Enum.Font.GothamBold
TeleBtn.Text = "🚀 Dịch Chuyển"
TeleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleBtn.TextSize = 11
Instance.new("UICorner", TeleBtn).CornerRadius = UDim.new(0, 6)

local PlayerScroll = Instance.new("ScrollingFrame", TeleSection)
PlayerScroll.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
PlayerScroll.Position = UDim2.new(0, 10, 0, 68)
PlayerScroll.Size = UDim2.new(1, -20, 0, 132)
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.ScrollBarThickness = 3
Instance.new("UICorner", PlayerScroll).CornerRadius = UDim.new(0, 6)

local PlayerListLayout = Instance.new("UIListLayout", PlayerScroll)
PlayerListLayout.Padding = UDim.new(0, 3)

local selectedTarget = nil

local function refreshServerList()
    pcall(function()
        for _, child in ipairs(PlayerScroll:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local pBtn = Instance.new("TextButton", PlayerScroll)
                pBtn.BackgroundColor3 = (selectedTarget == p) and Color3.fromRGB(0, 160, 100) or Color3.fromRGB(30, 30, 42)
                pBtn.Size = UDim2.new(1, 0, 0, 32)
                pBtn.Font = Enum.Font.GothamBold
                pBtn.Text = "🎯 " .. p.Name
                pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                pBtn.TextSize = 11
                Instance.new("UICorner", pBtn).CornerRadius = UDim.new(0, 5)
                
                pBtn.MouseButton1Click:Connect(function()
                    selectedTarget = p
                    for _, b in ipairs(PlayerScroll:GetChildren()) do
                        if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(30, 30, 42) end
                    end
                    pBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 100)
                end)
            end
        end
        PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, #Players:GetPlayers() * 35)
    end)
end

refreshServerList()
RefreshTeleBtn.MouseButton1Click:Connect(refreshServerList)

TeleBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
            local myChar = LocalPlayer.Character
            if myChar then
                local myRoot = myChar:FindFirstChild("HumanoidRootPart")
                if myRoot then
                    myRoot.CFrame = selectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 2)
                end
            end
        end
    end)
end)

print("💎 THÀNH ĐẠT - AIM KILL EDITION ĐÃ SẴN SÀNG HOẠT ĐỘNG!")
