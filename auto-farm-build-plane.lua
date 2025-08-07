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
island.PlacedBlocks:FindFirstChild("driver_seat_1").PrimaryPart.CFrame = CFrame.new(40000,300,-410)
end
task.wait()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Return"):FireServer()
endcloseButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    if currentStopFly then currentStopFly() end
    screenGui:Destroy()
end)

end

-- Jalankan menu createMenu()

