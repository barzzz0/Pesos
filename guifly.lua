-- leynascripts.lua -- hasil deobfuscation dari MoonSec V3 (bot.js) + GUI Menu + Fly integration + Speed control -- Script Name: Leyna Script

-- Notifikasi saat script dieksekusi local StarterGui = game:GetService("StarterGui") StarterGui:SetCore("SendNotification", { Title = "Leyna Script", Text = "Welcome to script keynazx", Duration = 5 })

local http = game:GetService("HttpService") local Players = game:GetService("Players") local player = Players.LocalPlayer

-- Fungsi Fly dengan pengaturan kecepatan (hingga 200) local function startFly(maxSpeed) local character = player.Character or player.CharacterAdded:Wait() local humanoidRootPart = character:WaitForChild("HumanoidRootPart") local camera = workspace.CurrentCamera

local bodyGyro = Instance.new("BodyGyro")
bodyGyro.P = 9e4
bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
bodyGyro.CFrame = humanoidRootPart.CFrame
bodyGyro.Parent = humanoidRootPart

local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = Vector3.new(0, 0.1, 0)
bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
bodyVelocity.Parent = humanoidRootPart

local flying = true
local speed = 0
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastCtrl = {f = 0, b = 0, l = 0, r = 0}

game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
    if gp then return end
    local k = input.KeyCode
    if k == Enum.KeyCode.W then ctrl.f = 1
    elseif k == Enum.KeyCode.S then ctrl.b = -1
    elseif k == Enum.KeyCode.A then ctrl.l = -1
    elseif k == Enum.KeyCode.D then ctrl.r = 1 end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
    if gp then return end
    local k = input.KeyCode
    if k == Enum.KeyCode.W then ctrl.f = 0
    elseif k == Enum.KeyCode.S then ctrl.b = 0
    elseif k == Enum.KeyCode.A then ctrl.l = 0
    elseif k == Enum.KeyCode.D then ctrl.r = 0 end
end)

spawn(function()
    while flying do
        game:GetService("RunService").RenderStepped:Wait()

        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
            speed = speed + 1 + (speed / maxSpeed)
            if speed > maxSpeed then speed = maxSpeed end
        elseif speed > 0 then
            speed = speed - 1
            if speed < 0 then speed = 0 end
        end

        local moveVec = ((camera.CFrame.lookVector * (ctrl.f + ctrl.b)) + 
                        ((camera.CFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0)).p - camera.CFrame.p))
        bodyVelocity.Velocity = moveVec * speed
        bodyGyro.CFrame = camera.CFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxSpeed), 0, 0)
    end
end)

return function()
    flying = false
    bodyGyro:Destroy()
    bodyVelocity:Destroy()
end

end

-- Fungsi untuk membuat menu GUI local function createMenu() local screenGui = Instance.new("ScreenGui") screenGui.Name = "LeynaScriptsMenu" screenGui.ResetOnSpawn = false screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 350)
mainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Text = "💀 Leyna Script"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Parent = mainFrame

local flySpeedBox = Instance.new("TextBox")
flySpeedBox.PlaceholderText = "Enter Fly Speed (max 200)"
flySpeedBox.Text = ""
flySpeedBox.Size = UDim2.new(0.9, 0, 0, 35)
flySpeedBox.Position = UDim2.new(0.05, 0, 0.2, 0)
flySpeedBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
flySpeedBox.TextColor3 = Color3.new(1, 1, 1)
flySpeedBox.ClearTextOnFocus = false
flySpeedBox.Font = Enum.Font.Gotham
flySpeedBox.TextSize = 14
flySpeedBox.Parent = mainFrame

local flyButton = Instance.new("TextButton")
flyButton.Text = "🌟 Fly Mode"
flyButton.Size = UDim2.new(0.9, 0, 0, 40)
flyButton.Position = UDim2.new(0.05, 0, 0.35, 0)
flyButton.Font = Enum.Font.Gotham
flyButton.TextSize = 16
flyButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
flyButton.TextColor3 = Color3.new(1,1,1)
flyButton.Parent = mainFrame

local currentStopFly = nil

flyButton.MouseButton1Click:Connect(function()
    if currentStopFly then currentStopFly() end
    local speed = tonumber(flySpeedBox.Text) or 50
    if speed > 200 then speed = 200 end
    currentStopFly = startFly(speed)
end)

local closeButton = Instance.new("TextButton")
closeButton.Text = "❌"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    if currentStopFly then currentStopFly() end
    screenGui:Destroy()
end)

end

-- Jalankan menu createMenu()

