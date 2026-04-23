local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("leoui") then CoreGui.leoui:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "leoui"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(200, 200, 200)
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "leo script hub"
Title.TextColor3 = Color3.fromRGB(30, 35, 45)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = Header

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -30, 1, -60)
Container.Position = UDim2.new(0, 15, 0, 45)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.CellSize = UDim2.new(0.5, -5, 0, 100)
UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
UIGridLayout.Parent = Container

local function createModuleCard(name, description)
    local Card = Instance.new("Frame")
    Card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Card.BorderColor3 = Color3.fromRGB(220, 220, 220)
    Card.BorderSizePixel = 1
    Card.Parent = Container
    
    Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 14
    Label.TextColor3 = Color3.fromRGB(40, 40, 40)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Card

    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -20, 0, 30)
    Desc.Position = UDim2.new(0, 10, 0, 30)
    Desc.BackgroundTransparency = 1
    Desc.Text = description
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 10
    Desc.TextColor3 = Color3.fromRGB(120, 120, 120)
    Desc.TextWrapped = true
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Card

    local ExecuteBtn = Instance.new("TextButton")
    ExecuteBtn.Size = UDim2.new(0, 60, 0, 25)
    ExecuteBtn.Position = UDim2.new(1, -70, 1, -35)
    ExecuteBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    ExecuteBtn.Text = "RUN"
    ExecuteBtn.Font = Enum.Font.GothamBold
    ExecuteBtn.TextSize = 11
    ExecuteBtn.TextColor3 = Color3.fromRGB(60, 60, 60)
    ExecuteBtn.Parent = Card
    
    local btnCorner = Instance.new("UICorner", ExecuteBtn)
    btnCorner.CornerRadius = UDim.new(0, 4)
    
    ExecuteBtn.MouseEnter:Connect(function() ExecuteBtn.BackgroundColor3 = Color3.fromRGB(230, 230, 230) end)
    ExecuteBtn.MouseLeave:Connect(function() ExecuteBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240) end)

    return ExecuteBtn
end

local infYield = createModuleCard("Infinite Yield", "Admin command palette for various utilities.")
local gps = createModuleCard("GP Spoof", "Manipulate positional data for localized scripts.")
local tp = createModuleCard("Teleport", "Instant movement to designated map coordinates.")
local fly = createModuleCard("Fly Mode", "Toggle flight mechanics for R6/R15 rigs.")

local function closeUI() ScreenGui:Destroy() end

infYield.MouseButton1Click:Connect(function()
    closeUI()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

gps.MouseButton1Click:Connect(function()
    closeUI()
    loadstring(game:HttpGet("https://leopold.onl/scripts/gpspoof.lua"))()
end)

tp.MouseButton1Click:Connect(function()
    closeUI()
    loadstring(game:HttpGet("https://leopold.onl/scripts/tp.lua"))()
end)

fly.MouseButton1Click:Connect(function()
    closeUI()
    local char = Players.LocalPlayer.Character
    if not char or not char:FindFirstChildOfClass("Humanoid") then return end
    
    local url = (char.Humanoid.RigType == Enum.HumanoidRigType.R6) and 
        "https://raw.githubusercontent.com/396abc/Script/refs/heads/main/Fly.lua" or 
        "https://raw.githubusercontent.com/396abc/Script/refs/heads/main/FlyR15.lua"
    loadstring(game:HttpGet(url))()
end)
