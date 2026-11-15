-- ============================================================================
-- THÀNH ĐẠT V1.5 - ULTIMATE MASTERPIECE & AUTO AIM KILL (DELTA X)
-- ============================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Xóa menu cũ nếu chạy lại tránh chồng chéo
if CoreGui:FindFirstChild("ThanhDatV1Master") then
    CoreGui.ThanhDatV1Master:Destroy()
end

-- Khởi tạo UI Menu chính
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ThanhDatV1Master"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -240)
MainFrame.Size = UDim2.new(0, 460, 0, 480)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(0, 255, 180)
UIStroke.Thickness = 2

-- Tiêu đề Menu
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
TitleText.Text = "💎 THÀNH ĐẠT V1.5 - ULTIMATE MASTERPIECE 💎"
TitleText.TextColor3 = Color3.fromRGB(0, 255, 180)
TitleText.TextSize = 12
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Nút thu nhỏ/mở menu nhanh
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

-- Container chứa chức năng
local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 12, 0, 55)
Container.Size = UDim2.new(1, -24, 1, -65)
Container.CanvasSize = UDim2.new(0, 0, 5.5, 0)
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
-- 1. CHỨC NĂNG CHẠY NHANH (KHÓA CỨNG WALKBCK CHỐNG RESET)
--------------------------------------------------------------------------------
local SpeedSection = Instance.new("Frame", Container)
SpeedSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
SpeedSection.Size = UDim2.new(1, 0, 0, 75)
Instance.new("UICorner", SpeedSection).CornerRadius = UDim.new(0, 8)

local SText = Instance.new("TextLabel", SpeedSection)
SText.BackgroundTransparency = 1
SText.Position = UDim2.new(0, 10, 0, 6)
SText.Size = UDim2.new(1, -20, 0, 20)
SText.Font = Enum.Font.GothamBold
SText.Text = "🏃 Tốc độ chạy (Khóa cứng chống reset)"
SText.TextColor3 = Color3.fromRGB(255, 255, 255)
SText.TextSize = 12
SText.TextXAlignment = Enum.TextXAlignment.Left

local SpeedBox = Instance.new("TextBox", SpeedSection)
SpeedBox.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
SpeedBox.Position = UDim2.new(0, 10, 0, 32)
SpeedBox.Size = UDim2.new(1, -20, 0, 32)
SpeedBox.Font = Enum.Font.Gotham
SpeedBox.Text = "16"
SpeedBox.TextColor3 = Color3.fromRGB(0, 255, 180)
SpeedBox.TextSize = 12
Instance.new("UICorner", SpeedBox).CornerRadius = UDim.new(0, 6)

local customSpeed = 16
SpeedBox.FocusLost:Connect(function()
    local val = tonumber(SpeedBox.Text)
    if val and val > 0 then customSpeed = val else SpeedBox.Text = tostring(customSpeed) end
end)

RunService.RenderStepped:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum and hum.WalkSpeed ~= customSpeed then
                hum.WalkSpeed = customSpeed
            end
        end
    end)
end)

--------------------------------------------------------------------------------
-- 2. CHỨC NĂNG XUYÊN TƯỜNG (NOCLIP)
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
-- 3. CHỨC NĂNG NHẢY VÔ TẬN (INFINITE JUMP)
--------------------------------------------------------------------------------
local InfJumpSection = Instance.new("Frame", Container)
InfJumpSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
InfJumpSection.Size = UDim2.new(1, 0, 0, 50)
Instance.new("UICorner", InfJumpSection).CornerRadius = UDim.new(0, 8)

local infJumpActive = false
local InfJumpBtn = createToggleBtn(InfJumpSection, "🚀 Nhảy Vô Tận (Inf Jump)")
InfJumpBtn.Position = UDim2.new(0, 10, 0, 6)
InfJumpBtn.Size = UDim2.new(1, -20, 0, 38)

InfJumpBtn.MouseButton1Click:Connect(function()
    infJumpActive = not infJumpActive
    InfJumpBtn.BackgroundColor3 = infJumpActive and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(180, 40, 40)
    InfJumpBtn.Text = infJumpActive and "🚀 Nhảy Vô Tận: BẬT" or "🚀 Nhảy Vô Tận: TẮT"
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpActive then
        pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

--------------------------------------------------------------------------------
-- 4. AIMBOT VÒNG TRÒN FOV
--------------------------------------------------------------------------------
local AimbotSection = Instance.new("Frame", Container)
AimbotSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
AimbotSection.Size = UDim2.new(1, 0, 0, 110)
Instance.new("UICorner", AimbotSection).CornerRadius = UDim.new(0, 8)

local aimbotActive = false
local AimbotBtn = createToggleBtn(AimbotSection, "🎯 Aimbot FOV + Nhịp Bắn")
AimbotBtn.Position = UDim2.new(0, 10, 0, 8)
AimbotBtn.Size = UDim2.new(1, -20, 0, 32)

AimbotBtn.MouseButton1Click:Connect(function()
    aimbotActive = not aimbotActive
    AimbotBtn.BackgroundColor3 = aimbotActive and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(180, 40, 40)
    AimbotBtn.Text = aimbotActive and "🎯 Aimbot FOV: BẬT" or "🎯 Aimbot FOV: TẮT"
end)

local FOVBox = Instance.new("TextBox", AimbotSection)
FOVBox.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
FOVBox.Position = UDim2.new(0, 10, 0, 48)
FOVBox.Size = UDim2.new(1, -20, 0, 28)
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
    if currentWeaponConn then 
        currentWeaponConn:Disconnect() 
        currentWeaponConn = nil 
    end
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
-- 5. ESP TÊN, KHOẢNG CÁCH & ESP KHUNG (BOX ESP)
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
-- 6. AIM KILL PVP (TỰ ĐỘNG BÁM LƠ LỶNG + TỰ ĐỘNG BÓP CÒ XẢ ĐẠN 100%)
--------------------------------------------------------------------------------
local PVPSection = Instance.new("Frame", Container)
PVPSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
PVPSection.Size = UDim2.new(1, 0, 0, 50)
Instance.new("UICorner", PVPSection).CornerRadius = UDim.new(0, 8)

local pvpAutoActive = false
local PVPBtn = createToggleBtn(PVPSection, "⚡ Auto Aim Kill + Auto Shoot")
PVPBtn.Position = UDim2.new(0, 10, 0, 6)
PVPBtn.Size = UDim2.new(1, -20, 0, 38)

PVPBtn.MouseButton1Click:Connect(function()
    pvpAutoActive = not pvpAutoActive
    PVPBtn.BackgroundColor3 = pvpAutoActive and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(180, 40, 40)
    PVPBtn.Text = pvpAutoActive and "⚡ Auto Aim + Shoot: BẬT" or "⚡ Auto Aim + Shoot: TẮT"
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
                        
                        if tHum.Health > 0 then
                            local startTime = tick()
                            while tHum.Health > 0 and pvpAutoActive and target.Parent and (tick() - startTime < 6) do
                                task.wait(0.03)
                                pcall(function()
                                    local Cam = workspace.CurrentCamera
                                    local myChar = LocalPlayer.Character
                                    local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                                    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                                    
                                    if myRoot and tRoot and myHum then
                                        -- Khóa trạng thái treo, vô hiệu hóa trọng lực
                                        myHum.PlatformStand = true
                                        myRoot.Velocity = Vector3.new(0, 0, 0)
                                        myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 6, 0)
                                        
                                        -- Ghim thẳng camera vào đầu mục tiêu
                                        if Cam and target.Character:FindFirstChild("Head") then
                                            Cam.CFrame = CFrame.new(Cam.CFrame.Position, target.Character.Head.Position)
                                        end
                                        
                                        -- Tự động kích hoạt súng liên tục (Bóp cò tự động)
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
                            -- Trả lại trạng thái bình thường khi hạ xong 1 người
                            pcall(function()
                                local myChar = LocalPlayer.Character
                                local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                                if myHum then myHum.PlatformStand = false end
                            end)
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
-- 7. TELEPORT NHANH ĐẾN NGƯỜI CHƠI
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
TeleTitle.TextSize = 11
TeleTitle.TextXAlignment = Enum.TextXAlignment.Left

local TeleScroll = Instance.new("ScrollingFrame", TeleSection)
TeleScroll.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
TeleScroll.Position = UDim2.new(0, 10, 0, 32)
TeleScroll.Size = UDim2.new(1, -20, 0, 130)
TeleScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
TeleScroll.ScrollBarThickness = 3
Instance.new("UICorner", TeleScroll).CornerRadius = UDim.new(0, 6)

local TeleListLayout = Instance.new("UIListLayout", TeleScroll)
TeleListLayout.Padding = UDim.new(0, 3)

local RefreshTeleBtn = Instance.new("TextButton", TeleSection)
RefreshTeleBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 200)
RefreshTeleBtn.Position = UDim2.new(0, 10, 0, 168)
RefreshTeleBtn.Size = UDim2.new(1, -20, 0, 32)
RefreshTeleBtn.Font = Enum.Font.GothamBold
RefreshTeleBtn.Text = "🔄 Cập Nhật Danh Sách Người Chơi"
RefreshTeleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshTeleBtn.TextSize = 11
Instance.new("UICorner", RefreshTeleBtn).CornerRadius = UDim.new(0, 6)

local function refreshTeleList()
    pcall(function()
        for _, child in ipairs(TeleScroll:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local pBtn = Instance.new("TextButton", TeleScroll)
                pBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
                pBtn.Size = UDim2.new(1, 0, 0, 32)
                pBtn.Font = Enum.Font.GothamBold
                pBtn.Text = "🎯 " .. p.Name
                pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                pBtn.TextSize = 11
                Instance.new("UICorner", pBtn).CornerRadius = UDim.new(0, 5)
                
                pBtn.MouseButton1Click:Connect(function()
                    pcall(function()
                        if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if myRoot then
                                myRoot.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 2)
                            end
                        end
                    end)
                end)
            end
        end
        TeleScroll.CanvasSize = UDim2.new(0, 0, 0, #Players:GetPlayers() * 35)
    end)
end

refreshTeleList()
RefreshTeleBtn.MouseButton1Click:Connect(refreshTeleList)

print("💎 Thành Đạt V1.5 - Ultimate Masterpiece đã hoạt động mượt mà hoàn hảo!")
