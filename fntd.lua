-- 📦 Five Nights TD Marco GUI by Jotaro (English Version)
-- ⚠️ Paste this into your executor (Synapse, Fluxus, KRNL, etc.)

-- Toggle flags
_G.AutoMoney = false
_G.AutoSummon = false
_G.AutoJoin = false

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoMoneyBtn = Instance.new("TextButton")
local AutoSummonBtn = Instance.new("TextButton")
local AutoJoinBtn = Instance.new("TextButton")

ScreenGui.Name = "MarcoGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 20, 0, 200)
Frame.Size = UDim2.new(0, 180, 0, 140)

Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Text = "📌 Five Nights TD Marco"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

-- Auto Money Button
AutoMoneyBtn.Parent = Frame
AutoMoneyBtn.Position = UDim2.new(0, 10, 0, 35)
AutoMoneyBtn.Size = UDim2.new(0, 160, 0, 25)
AutoMoneyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoMoneyBtn.TextColor3 = Color3.new(1, 1, 1)
AutoMoneyBtn.Text = "Auto Money: OFF"
AutoMoneyBtn.Font = Enum.Font.SourceSans
AutoMoneyBtn.TextSize = 16

-- Auto Summon Button
AutoSummonBtn.Parent = Frame
AutoSummonBtn.Position = UDim2.new(0, 10, 0, 65)
AutoSummonBtn.Size = UDim2.new(0, 160, 0, 25)
AutoSummonBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoSummonBtn.TextColor3 = Color3.new(1, 1, 1)
AutoSummonBtn.Text = "Auto Summon: OFF"
AutoSummonBtn.Font = Enum.Font.SourceSans
AutoSummonBtn.TextSize = 16

-- Auto Join Button
AutoJoinBtn.Parent = Frame
AutoJoinBtn.Position = UDim2.new(0, 10, 0, 95)
AutoJoinBtn.Size = UDim2.new(0, 160, 0, 25)
AutoJoinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoJoinBtn.TextColor3 = Color3.new(1, 1, 1)
AutoJoinBtn.Text = "Auto Join: OFF"
AutoJoinBtn.Font = Enum.Font.SourceSans
AutoJoinBtn.TextSize = 16

-- Button Functions
AutoMoneyBtn.MouseButton1Click:Connect(function()
    _G.AutoMoney = not _G.AutoMoney
    AutoMoneyBtn.Text = "Auto Money: " .. (_G.AutoMoney and "ON" or "OFF")
end)

AutoSummonBtn.MouseButton1Click:Connect(function()
    _G.AutoSummon = not _G.AutoSummon
    AutoSummonBtn.Text = "Auto Summon: " .. (_G.AutoSummon and "ON" or "OFF")
end)

AutoJoinBtn.MouseButton1Click:Connect(function()
    _G.AutoJoin = not _G.AutoJoin
    AutoJoinBtn.Text = "Auto Join: " .. (_G.AutoJoin and "ON" or "OFF")
end)

-- Logic for Auto Features
spawn(function()
    while true do
        if _G.AutoMoney then
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("GiveCash")
            if remote then
                remote:FireServer(9999)
            end
        end
        wait(0.5)
    end
end)

spawn(function()
    while true do
        if _G.AutoSummon then
            local summon = game:GetService("ReplicatedStorage"):FindFirstChild("PlaceUnit") or game:GetService("ReplicatedStorage"):FindFirstChild("PlaceTower")
            if summon then
                local unitName = "Freddy" -- Replace with actual unit name
                local pos = Vector3.new(math.random(-10,10), 0, math.random(-10,10))
                summon:FireServer(unitName, pos)
            end
        end
        wait(2)
    end
end)

spawn(function()
    while true do
        if _G.AutoJoin then
            local join = game:GetService("ReplicatedStorage"):FindFirstChild("JoinMatch")
            if join then
                join:FireServer()
            end
        end
        wait(3)
    end
end)
