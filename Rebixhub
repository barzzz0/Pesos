local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Cek dan buat suara
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9122943949" -- suara scream
sound.Volume = 10
sound.Parent = workspace

-- Buat UI jumpscare
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ScareGUI"
gui.ResetOnSpawn = false

local image = Instance.new("ImageLabel", gui)
image.Size = UDim2.new(1, 0, 1, 0)
image.Position = UDim2.new(0, 0, 0, 0)
image.Image = "rbxassetid://10420157920" -- gambar jumpscare
image.BackgroundTransparency = 1
image.ImageTransparency = 1
image.ZIndex = 999

-- Kunci kamera dan kontrol
pcall(function()
    local controls = require(player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
    controls:Disable()
end)

camera.CameraType = Enum.CameraType.Scriptable
sound:Play()
TweenService:Create(image, TweenInfo.new(0.3), {ImageTransparency = 0}):Play()

task.wait(3)

TweenService:Create(image, TweenInfo.new(1), {ImageTransparency = 1}):Play()
camera.CameraType = Enum.CameraType.Custom

pcall(function()
    local controls = require(player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
    controls:Enable()
end)

gui:Destroy()
