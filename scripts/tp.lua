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

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Position = UDim2.new(0.5, -150, 0.4, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

local TabContainer = Instance.new("Frame", MainFrame)
TabContainer.Size = UDim2.new(1, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local Tab1Frame = Instance.new("Frame", MainFrame)
Tab1Frame.Size = UDim2.new(1, -20, 1, -50)
Tab1Frame.Position = UDim2.new(0, 10, 0, 45)
Tab1Frame.BackgroundTransparency = 1

local Tab2Frame = Tab1Frame:Clone()
Tab2Frame.Parent = MainFrame
Tab2Frame.Visible = false

local waypoints = {A = nil, B = nil, T2 = nil, LastPos = nil}
local looping = false

local function createButton(parent, text, pos, color)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Position = pos
    btn.Text = text
    btn.BackgroundColor3 = color or Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = true
    return btn
end

local setA = createButton(Tab1Frame, "Set Waypoint A", UDim2.new(0, 0, 0, 10))
local setB = createButton(Tab1Frame, "Set Waypoint B", UDim2.new(0, 0, 0, 55))
local timeInput = Instance.new("TextBox", Tab1Frame)
timeInput.Size = UDim2.new(1, 0, 0, 35)
timeInput.Position = UDim2.new(0, 0, 0, 100)
timeInput.PlaceholderText = "Time (ms)"
timeInput.Text = "2000"
timeInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
timeInput.TextColor3 = Color3.new(1, 1, 1)

local loopBtn = createButton(Tab1Frame, "START LOOP", UDim2.new(0, 0, 0, 145), Color3.fromRGB(40, 80, 40))

setA.MouseButton1Click:Connect(function() waypoints.A = Player.Character.HumanoidRootPart.CFrame setA.Text = "A Set" end)
setB.MouseButton1Click:Connect(function() waypoints.B = Player.Character.HumanoidRootPart.CFrame setB.Text = "B Set" end)

loopBtn.MouseButton1Click:Connect(function()
    looping = not looping
    if looping then
        loopBtn.Text = "STOP LOOP"
        loopBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
        
        task.spawn(function()
            while looping do
                if not waypoints.A or not waypoints.B then break end
                local char = Player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    local duration = (tonumber(timeInput.Text) or 2000) / 1000

                    hrp.CFrame = waypoints.A
                    local t1 = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = waypoints.B})
                    t1:Play()
                    t1.Completed:Wait()
                    
                    if not looping then break end

                    local t2 = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = waypoints.A})
                    t2:Play()
                    t2.Completed:Wait()
                end
                task.wait()
            end
        end)
    else
        loopBtn.Text = "START LOOP"
        loopBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
    end
end)

local setT2 = createButton(Tab2Frame, "Set Target Waypoint", UDim2.new(0, 0, 0, 10))
local tpButton = createButton(Tab2Frame, "Teleport", UDim2.new(0, 0, 0, 55))

setT2.MouseButton1Click:Connect(function() 
    waypoints.T2 = Player.Character.HumanoidRootPart.CFrame 
    setT2.Text = "Target Saved!" 
end)

tpButton.MouseButton1Click:Connect(function()
    local hrp = Player.Character.HumanoidRootPart
    if tpButton.Text == "Teleport" then
        if waypoints.T2 then
            waypoints.LastPos = hrp.CFrame
            hrp.CFrame = waypoints.T2
            tpButton.Text = "Go Back"
            tpButton.BackgroundColor3 = Color3.fromRGB(80, 40, 40)
        end
    else
        hrp.CFrame = waypoints.LastPos
        tpButton.Text = "Teleport"
        tpButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

local b1 = createButton(TabContainer, "Loop Tween", UDim2.new(0, 0, 0, 0))
b1.Size = UDim2.new(0.5, 0, 1, 0)
local b2 = createButton(TabContainer, "Return TP", UDim2.new(0.5, 0, 0, 0))
b2.Size = UDim2.new(0.5, 0, 1, 0)

b1.MouseButton1Click:Connect(function() Tab1Frame.Visible = true Tab2Frame.Visible = false end)
b2.MouseButton1Click:Connect(function() Tab1Frame.Visible = false Tab2Frame.Visible = true end)
