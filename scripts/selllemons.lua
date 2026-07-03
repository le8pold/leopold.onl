local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local userTycoon = (function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Folder") and v.Name:match("Tycoon%d") then
            if v:FindFirstChild("Owner") and v.Owner.Value == LocalPlayer then
                return v
            end
        end
    end
end)()

if not userTycoon then
    warn("Tycoon not found!")
    return
end

if CoreGui:FindFirstChild("leoui") then CoreGui.leoui:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "leouilemons"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Sell Lemons Script"
Title.TextColor3 = Color3.fromRGB(30, 35, 45)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Buttons = Instance.new("Frame")
Buttons.Size = UDim2.new(0, 80, 1, 0)
Buttons.Position = UDim2.new(1, -85, 0, 0)
Buttons.BackgroundTransparency = 1
Buttons.Parent = Header

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.Parent = Buttons

local function createTopBtn(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextColor3 = color
    btn.Parent = Buttons
    return btn
end

local MinBtn = createTopBtn("-", Color3.fromRGB(100, 100, 100))
local CloseBtn = createTopBtn("×", Color3.fromRGB(200, 50, 50))

local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -20, 1, -60)
Container.Position = UDim2.new(0, 10, 0, 45)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.ScrollBarThickness = 4
Container.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 200)
Container.CanvasSize = UDim2.new(0, 0, 0, 0)
Container.Parent = MainFrame

local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.CellSize = UDim2.new(0.5, -10, 0, 100)
UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
UIGridLayout.Parent = Container

UIGridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Container.CanvasSize = UDim2.new(0, 0, 0, UIGridLayout.AbsoluteContentSize.Y + 10)
end)

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 500, 0, 45), "Out", "Quad", 0.3, true)
        Container.Visible = false
        MinBtn.Text = "+"
    else
        MainFrame:TweenSize(UDim2.new(0, 500, 0, 320), "Out", "Quad", 0.3, true)
        Container.Visible = true
        MinBtn.Text = "-"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local dragging, dragInput, dragStart, startPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

local function createToggleCard(name, description, callback)
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

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 75, 0, 25)
    ToggleBtn.Position = UDim2.new(1, -85, 1, -35)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    ToggleBtn.Text = "OFF"
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.TextSize = 10
    ToggleBtn.TextColor3 = Color3.fromRGB(60, 60, 60)
    ToggleBtn.Parent = Card
    
    Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 4)
    
    local isOn = false
    ToggleBtn.MouseButton1Click:Connect(function()
        isOn = not isOn
        if isOn then
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 230, 180)
            ToggleBtn.TextColor3 = Color3.fromRGB(40, 100, 40)
            ToggleBtn.Text = "ON"
        else
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
            ToggleBtn.TextColor3 = Color3.fromRGB(60, 60, 60)
            ToggleBtn.Text = "OFF"
        end
        task.spawn(callback, isOn)
    end)

    return Card
end

local AutoBuy = false
local AutoUpgrade = false
local AutoFruit = false

local originalButtonCFrames = {}

local function getButtons()
    local Buttons = {}
    for _, obj in ipairs(userTycoon.Purchases:GetDescendants()) do
        if obj:IsA("Model") then
            local shown = obj:GetAttribute("Shown")
            local purchased = obj:GetAttribute("Purchased")

            if shown == true and purchased ~= true then
                local buttonPart = obj:FindFirstChild("Button")
                if buttonPart and buttonPart:IsA("BasePart") then
                    table.insert(Buttons, buttonPart)
                end
            end
        end
    end
    return Buttons
end

local function restoreButtons()
    for part, originalCFrame in pairs(originalButtonCFrames) do
        if part and part.Parent then
            part.CFrame = originalCFrame
        end
    end
    table.clear(originalButtonCFrames)
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if AutoBuy then
            local character = LocalPlayer.Character
            local hrp = character and character:FindFirstChild("HumanoidRootPart")
            
            if hrp then
                local Buttons = getButtons()
                for _, buttonPart in ipairs(Buttons) do

                    if not originalButtonCFrames[buttonPart] then
                        originalButtonCFrames[buttonPart] = buttonPart.CFrame
                    end

                    pcall(function()
                        buttonPart.CFrame = hrp.CFrame
                        firetouchinterest(hrp, buttonPart, 0)
                        firetouchinterest(hrp, buttonPart, 1)
                    end)
                end
            end
        end
    end
end)

local function upgradeMachines()
    for _, obj in ipairs(userTycoon.Purchases:GetDescendants()) do
        if obj:IsA("RemoteFunction") and obj.Name == "Upgrade" then
            pcall(function()
                for level = 1, 100 do
                    obj:InvokeServer(level)
                end
            end)
        end
    end
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if AutoUpgrade then
            pcall(function()
                upgradeMachines()
            end)
        end
    end
end)

local Trees = {}

local function addTree(obj)
    if obj:IsA("Model") and obj.Name == "LemonTree" then
        if not table.find(Trees, obj) then
            table.insert(Trees, obj)
        end
    end
end

local function removeTree(obj)
    local index = table.find(Trees, obj)
    if index then
        table.remove(Trees, index)
    end
end

for _, v in ipairs(workspace:GetDescendants()) do
    addTree(v)
end

workspace.DescendantAdded:Connect(addTree)
workspace.DescendantRemoving:Connect(removeTree)

local function collectFruit(tree)
    for _, obj in ipairs(tree:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.CanCollide = false
        end
    end

    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = tree:GetPivot() + Vector3.new(0, 5, 0)

    for _, obj in ipairs(tree:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "Fruit" then
            obj.CanCollide = false
            local clickPart = obj:FindFirstChild("ClickPart")
            if clickPart then
                local detector = clickPart:FindFirstChildOfClass("ClickDetector")
                if detector then
                    task.wait(0.45)
                    pcall(function()
                        fireclickdetector(detector)
                    end)
                end
            end
        end
    end
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if AutoFruit then
            for _, tree in ipairs(Trees) do
                if not AutoFruit then break end
                if tree and tree.Parent then
                    pcall(function()
                        collectFruit(tree)
                    end)
                end
            end
        end
    end
end)

createToggleCard("Auto Buy", "Teleports buttons to player to auto purchase. Returns them when off.", function(Value)
    AutoBuy = Value
    if not Value then

        restoreButtons()
    end
end)

createToggleCard("Auto Upgrade", "Automatically maxes out your earner upgrades.", function(Value)
    AutoUpgrade = Value
end)

createToggleCard("Auto Fruit", "Teleports to trees and automatically collects fruit. Doesn't work and I stole it from another script so idk", function(Value)
    AutoFruit = Value
end)
