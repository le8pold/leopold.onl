--[[
                                                                                                                                                                                                                             
MMMMMMMM               MMMMMMMM               AAA               DDDDDDDDDDDDD      EEEEEEEEEEEEEEEEEEEEEE     BBBBBBBBBBBBBBBBB   YYYYYYY       YYYYYYY     LLLLLLLLLLL             EEEEEEEEEEEEEEEEEEEEEE     OOOOOOOOO     
M:::::::M             M:::::::M              A:::A              D::::::::::::DDD   E::::::::::::::::::::E     B::::::::::::::::B  Y:::::Y       Y:::::Y     L:::::::::L             E::::::::::::::::::::E   OO:::::::::OO   
M::::::::M           M::::::::M             A:::::A             D:::::::::::::::DD E::::::::::::::::::::E     B::::::BBBBBB:::::B Y:::::Y       Y:::::Y     L:::::::::L             E::::::::::::::::::::E OO:::::::::::::OO 
M:::::::::M         M:::::::::M            A:::::::A            DDD:::::DDDDD:::::DEE::::::EEEEEEEEE::::E     BB:::::B     B:::::BY::::::Y     Y::::::Y     LL:::::::LL             EE::::::EEEEEEEEE::::EO:::::::OOO:::::::O
M::::::::::M       M::::::::::M           A:::::::::A             D:::::D    D:::::D E:::::E       EEEEEE       B::::B     B:::::BYYY:::::Y   Y:::::YYY       L:::::L                 E:::::E       EEEEEEO::::::O   O::::::O
M:::::::::::M     M:::::::::::M          A:::::A:::::A            D:::::D     D:::::DE:::::E                    B::::B     B:::::B   Y:::::Y Y:::::Y          L:::::L                 E:::::E             O:::::O     O:::::O
M:::::::M::::M   M::::M:::::::M         A:::::A A:::::A           D:::::D     D:::::DE::::::EEEEEEEEEE          B::::BBBBBB:::::B     Y:::::Y:::::Y           L:::::L                 E::::::EEEEEEEEEE   O:::::O     O:::::O
M::::::M M::::M M::::M M::::::M        A:::::A   A:::::A          D:::::D     D:::::DE:::::::::::::::E          B:::::::::::::BB       Y:::::::::Y            L:::::L                 E:::::::::::::::E   O:::::O     O:::::O
M::::::M  M::::M::::M  M::::::M       A:::::A     A:::::A         D:::::D     D:::::DE:::::::::::::::E          B::::BBBBBB:::::B       Y:::::::Y             L:::::L                 E:::::::::::::::E   O:::::O     O:::::O
M::::::M   M:::::::M   M::::::M      A:::::AAAAAAAAA:::::A        D:::::D     D:::::DE::::::EEEEEEEEEE          B::::B     B:::::B       Y:::::Y              L:::::L                 E::::::EEEEEEEEEE   O:::::O     O:::::O
M::::::M    M:::::M    M::::::M     A:::::::::::::::::::::A       D:::::D     D:::::DE:::::E                    B::::B     B:::::B       Y:::::Y              L:::::L                 E:::::E             O:::::O     O:::::O
M::::::M     MMMMM     M::::::M    A:::::AAAAAAAAAAAAA:::::A      D:::::D    D:::::D E:::::E       EEEEEE       B::::B     B:::::B       Y:::::Y              L:::::L         LLLLLL  E:::::E       EEEEEEO::::::O   O::::::O
M::::::M               M::::::M   A:::::A             A:::::A   DDD:::::DDDDD:::::DEE::::::EEEEEEEE:::::E     BB:::::BBBBBB::::::B       Y:::::Y            LL:::::::LLLLLLLLL:::::LEE::::::EEEEEEEE:::::EO:::::::OOO:::::::O
M::::::M               M::::::M  A:::::A               A:::::A  D:::::::::::::::DD E::::::::::::::::::::E     B:::::::::::::::::B     YYYY:::::YYYY         L::::::::::::::::::::::LE::::::::::::::::::::E OO:::::::::::::OO 
M::::::M               M::::::M A:::::A                 A:::::A D::::::::::::DDD   E::::::::::::::::::::E     B::::::::::::::::B      Y:::::::::::Y         L::::::::::::::::::::::LE::::::::::::::::::::E   OO:::::::::OO   
MMMMMMMM               MMMMMMMMAAAAAAA                   AAAAAAADDDDDDDDDDDDD      EEEEEEEEEEEEEEEEEEEEEE     BBBBBBBBBBBBBBBBB       YYYYYYYYYYYYY         LLLLLLLLLLLLLLLLLLLLLLLLEEEEEEEEEEEEEEEEEEEEEE     OOOOOOOOO     
                                                                                                                                                                                                                             
]]--

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

if CoreGui:FindFirstChild("leoui") then CoreGui.leoui:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "leoui"
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
Title.Text = "leo script hub"
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

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -30, 1, -60)
Container.Position = UDim2.new(0, 15, 0, 45)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.CellSize = UDim2.new(0.5, -5, 0, 100)
UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
UIGridLayout.Parent = Container

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

local infYield = createModuleCard("Infinite Yield", "Made by EdgeIY")
local gps = createModuleCard("GP Spoof", "Gamepass spoofer usually works in laser tower games on the troll section, and other games that use SignalPromptProductPurchaseFinished")
local tp = createModuleCard("Tp script", "Loop tween tp and a uh like tp and return tp thing")
local fly = createModuleCard("Fly", "Made by 396abc")
local azure = createModuleCard("Azure", "Made by Azure Modded team, or idk who, not me though")

infYield.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

gps.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://leopold.onl/scripts/gpspoof.lua"))()
end)

tp.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://leopold.onl/scripts/tp.lua"))()
end)

fly.MouseButton1Click:Connect(function()
    local char = Players.LocalPlayer.Character
    if not char or not char:FindFirstChildOfClass("Humanoid") then return end
    local url = (char.Humanoid.RigType == Enum.HumanoidRigType.R6) and 
        "https://raw.githubusercontent.com/396abc/Script/refs/heads/main/Fly.lua" or 
        "https://raw.githubusercontent.com/396abc/Script/refs/heads/main/FlyR15.lua"
    loadstring(game:HttpGet(url))()
end)

azure.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/a5634aabd753f56a9ddaed14257eae1f.lua"))()
end)
