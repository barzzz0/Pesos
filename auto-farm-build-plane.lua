local island
for _,v in workspace.Islands:GetChildren() do
    if v.Important.OwnerID.Value == game:GetService("Players").LocalPlayer.UserId then
        island = v
        break
    end
end

while true do
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Launch"):FireServer()
repeat
task.wait()
until island.PlacedBlocks:FindFirstChild("driver_seat_1") and island.PlacedBlocks:FindFirstChild("driver_seat_1")["Driver Seat"].Occupant
task.wait(2)
if island.PlacedBlocks:FindFirstChild("driver_seat_1") then
island.PlacedBlocks:FindFirstChild("driver_seat_1").PrimaryPart.CFrame = CFrame.new(90000,800,-910)
end
task.wait()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Return"):FireServer()
endmainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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

