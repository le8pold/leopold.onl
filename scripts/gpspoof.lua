local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Market = game:GetService("MarketplaceService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SIXSEVEN ignore ts"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 360, 0, 440)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "leo gp spoofer"
Title.TextColor3 = Color3.fromRGB(40, 40, 40)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, 0, 0, 30)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local MainTabBtn = Instance.new("TextButton")
MainTabBtn.Size = UDim2.new(0.333, 0, 1, 0)
MainTabBtn.Text = "Main"
MainTabBtn.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
MainTabBtn.TextColor3 = Color3.fromRGB(40, 40, 40)
MainTabBtn.Font = Enum.Font.GothamSemibold
MainTabBtn.Parent = TabContainer

local WhitelistTabBtn = Instance.new("TextButton")
WhitelistTabBtn.Size = UDim2.new(0.333, 0, 1, 0)
WhitelistTabBtn.Position = UDim2.new(0.333, 0, 0, 0)
WhitelistTabBtn.Text = "Whitelist"
WhitelistTabBtn.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
WhitelistTabBtn.TextColor3 = Color3.fromRGB(130, 130, 130)
WhitelistTabBtn.Font = Enum.Font.GothamSemibold
WhitelistTabBtn.Parent = TabContainer

local IdsTabBtn = Instance.new("TextButton")
IdsTabBtn.Size = UDim2.new(0.334, 0, 1, 0)
IdsTabBtn.Position = UDim2.new(0.666, 0, 0, 0)
IdsTabBtn.Text = "Spoof IDs"
IdsTabBtn.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
IdsTabBtn.TextColor3 = Color3.fromRGB(130, 130, 130)
IdsTabBtn.Font = Enum.Font.GothamSemibold
IdsTabBtn.Parent = TabContainer

local Pages = Instance.new("Frame")
Pages.Size = UDim2.new(1, 0, 1, -70)
Pages.Position = UDim2.new(0, 0, 0, 70)
Pages.BackgroundTransparency = 1
Pages.Parent = MainFrame

local MainPage = Instance.new("Frame")
MainPage.Size = UDim2.new(1, 0, 1, 0)
MainPage.BackgroundTransparency = 1
MainPage.Parent = Pages

local Dropdown = Instance.new("TextButton")
Dropdown.Size = UDim2.new(0.8, 0, 0, 35)
Dropdown.Position = UDim2.new(0.1, 0, 0, 15)
Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dropdown.Text = "Select ID..."
Dropdown.TextColor3 = Color3.fromRGB(40, 40, 40)
Dropdown.Font = Enum.Font.Gotham
Dropdown.ZIndex = 20
Dropdown.Parent = MainPage
Dropdown.TextTruncate = Enum.TextTruncate.AtEnd
Instance.new("UICorner", Dropdown)

local Arrow = Instance.new("TextLabel")
Arrow.Size = UDim2.new(0, 35, 1, 0)
Arrow.Position = UDim2.new(1, -35, 0, 0)
Arrow.Text = "▼"
Arrow.BackgroundTransparency = 1
Arrow.TextColor3 = Color3.fromRGB(100, 100, 100)
Arrow.ZIndex = 20
Arrow.Parent = Dropdown

local DropList = Instance.new("ScrollingFrame")
DropList.Size = UDim2.new(1, 0, 0, 100)
DropList.Position = UDim2.new(0, 0, 1, 5)
DropList.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
DropList.Visible = false
DropList.ZIndex = 22
DropList.ScrollBarThickness = 4
DropList.AutomaticCanvasSize = Enum.AutomaticSize.Y
DropList.Parent = Dropdown
Instance.new("UICorner", DropList)

local DropListLayout = Instance.new("UIListLayout")
DropListLayout.Parent = DropList

local FireBtn = Instance.new("TextButton")
FireBtn.Size = UDim2.new(0.8, 0, 0, 50)
FireBtn.Position = UDim2.new(0.1, 0, 0, 250)
FireBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
FireBtn.Text = "SPOOF"
FireBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FireBtn.Font = Enum.Font.GothamBold
FireBtn.TextSize = 16
FireBtn.Parent = MainPage
Instance.new("UICorner", FireBtn)

local WhitelistPage = Instance.new("Frame")
WhitelistPage.Size = UDim2.new(1, 0, 1, 0)
WhitelistPage.BackgroundTransparency = 1
WhitelistPage.Visible = false
WhitelistPage.Parent = Pages

local WLInput = Instance.new("TextBox")
WLInput.Size = UDim2.new(0.8, 0, 0, 35)
WLInput.Position = UDim2.new(0.1, 0, 0, 10)
WLInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WLInput.PlaceholderText = "Enter Username..."
WLInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
WLInput.Text = ""
WLInput.TextColor3 = Color3.fromRGB(40, 40, 40)
WLInput.Font = Enum.Font.Gotham
WLInput.Parent = WhitelistPage
Instance.new("UICorner", WLInput)

local WLAdd = Instance.new("TextButton")
WLAdd.Size = UDim2.new(0.8, 0, 0, 35)
WLAdd.Position = UDim2.new(0.1, 0, 0, 55)
WLAdd.BackgroundColor3 = Color3.fromRGB(123, 123, 123)
WLAdd.Text = "Add Username"
WLAdd.TextColor3 = Color3.fromRGB(255, 255, 255)
WLAdd.Font = Enum.Font.GothamBold
WLAdd.Parent = WhitelistPage
Instance.new("UICorner", WLAdd)

local WLScroll = Instance.new("ScrollingFrame")
WLScroll.Size = UDim2.new(0.8, 0, 1, -110)
WLScroll.Position = UDim2.new(0.1, 0, 0, 100)
WLScroll.BackgroundTransparency = 1
WLScroll.BorderSizePixel = 0
WLScroll.ScrollBarThickness = 2
WLScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
WLScroll.Parent = WhitelistPage

local WLList = Instance.new("UIListLayout")
WLList.Padding = UDim.new(0, 5)
WLList.Parent = WLScroll

local IdsPage = Instance.new("Frame")
IdsPage.Size = UDim2.new(1, 0, 1, 0)
IdsPage.BackgroundTransparency = 1
IdsPage.Visible = false
IdsPage.Parent = Pages

local IDInput = Instance.new("TextBox")
IDInput.Size = UDim2.new(0.8, 0, 0, 35)
IDInput.Position = UDim2.new(0.1, 0, 0, 10)
IDInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IDInput.PlaceholderText = "Manual Input ID..."
IDInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
IDInput.Text = ""
IDInput.TextColor3 = Color3.fromRGB(40, 40, 40)
IDInput.Font = Enum.Font.Gotham
IDInput.Parent = IdsPage
Instance.new("UICorner", IDInput)

local IDAdd = Instance.new("TextButton")
IDAdd.Size = UDim2.new(0.38, 0, 0, 35)
IDAdd.Position = UDim2.new(0.1, 0, 0, 55)
IDAdd.BackgroundColor3 = Color3.fromRGB(123, 123, 123)
IDAdd.Text = "Add Manual"
IDAdd.TextColor3 = Color3.fromRGB(255, 255, 255)
IDAdd.Font = Enum.Font.GothamBold
IDAdd.Parent = IdsPage
Instance.new("UICorner", IDAdd)

local RecordBtn = Instance.new("TextButton")
RecordBtn.Size = UDim2.new(0.38, 0, 0, 35)
RecordBtn.Position = UDim2.new(0.52, 0, 0, 55)
RecordBtn.BackgroundColor3 = Color3.fromRGB(123, 123, 123)
RecordBtn.Text = "Record"
RecordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RecordBtn.Font = Enum.Font.GothamBold
RecordBtn.Parent = IdsPage
Instance.new("UICorner", RecordBtn)

local IDScroll = Instance.new("ScrollingFrame")
IDScroll.Size = UDim2.new(0.8, 0, 1, -110)
IDScroll.Position = UDim2.new(0.1, 0, 0, 100)
IDScroll.BackgroundTransparency = 1
IDScroll.BorderSizePixel = 0
IDScroll.ScrollBarThickness = 2
IDScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
IDScroll.Parent = IdsPage

local IDListLayout = Instance.new("UIListLayout")
IDListLayout.Padding = UDim.new(0, 5)
IDListLayout.Parent = IDScroll

-- // LOGIC & DATA
local whitelist = {}
local spoofIDs = {3530789704, 3530790199}
local selectedID = spoofIDs[1]
local idNamesCache = {}

-- Async fetcher so the UI doesn't freeze
local function fetchNameAsync(id, textElement)
    if idNamesCache[id] then
        textElement.Text = idNamesCache[id]
        return
    end
    
    textElement.Text = "Fetching... [" .. id .. "]"
    
    task.spawn(function()
        -- 1. Try checking as Developer Product
        local s, i = pcall(function() return Market:GetProductInfo(id, Enum.InfoType.Product) end)
        if s and i and i.Name then 
            idNamesCache[id] = i.Name .. " [" .. id .. "]" 
            textElement.Text = idNamesCache[id] 
            return 
        end
        
        -- 2. Try checking as Gamepass
        s, i = pcall(function() return Market:GetProductInfo(id, Enum.InfoType.GamePass) end)
        if s and i and i.Name then 
            idNamesCache[id] = i.Name .. " [" .. id .. "]" 
            textElement.Text = idNamesCache[id] 
            return 
        end
        
        -- 3. Try checking as standard Asset
        s, i = pcall(function() return Market:GetProductInfo(id, Enum.InfoType.Asset) end)
        if s and i and i.Name then 
            idNamesCache[id] = i.Name .. " [" .. id .. "]" 
            textElement.Text = idNamesCache[id] 
            return 
        end
        
        -- Fallback if all fail
        idNamesCache[id] = "Unknown [" .. id .. "]"
        textElement.Text = idNamesCache[id]
    end)
end

-- Initialize Dropdown Text
fetchNameAsync(selectedID, Dropdown)

local function updateDropdown()
    for _, item in pairs(DropList:GetChildren()) do
        if item:IsA("TextButton") then item:Destroy() end
    end
    
    for _, id in ipairs(spoofIDs) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(40, 40, 40)
        btn.Font = Enum.Font.Gotham
        btn.TextTruncate = Enum.TextTruncate.AtEnd
        btn.ZIndex = 25
        btn.Parent = DropList
        
        fetchNameAsync(id, btn)
        
        btn.MouseButton1Click:Connect(function()
            selectedID = id
            fetchNameAsync(id, Dropdown)
            DropList.Visible = false
        end)
    end
end

local function updateWhitelistUI()
    for _, item in pairs(WLScroll:GetChildren()) do
        if item:IsA("Frame") then item:Destroy() end
    end
    for id, name in pairs(whitelist) do
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -5, 0, 30)
        frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        frame.Parent = WLScroll
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.8, 0, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name .. " (" .. id .. ")"
        label.TextColor3 = Color3.fromRGB(40, 40, 40)
        label.Font = Enum.Font.Gotham
        label.TextSize = 12
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextTruncate = Enum.TextTruncate.AtEnd
        label.Parent = frame
        
        local removeBtn = Instance.new("TextButton")
        removeBtn.Size = UDim2.new(0, 24, 0, 24)
        removeBtn.Position = UDim2.new(1, -30, 0.5, -12)
        removeBtn.BackgroundColor3 = Color3.fromRGB(192, 57, 43)
        removeBtn.Text = "X"
        removeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        removeBtn.Font = Enum.Font.GothamBold
        removeBtn.Parent = frame
        Instance.new("UICorner", removeBtn).CornerRadius = UDim.new(0, 4)
        
        removeBtn.MouseButton1Click:Connect(function()
            whitelist[id] = nil
            updateWhitelistUI()
        end)
    end
end

local function updateIDsUI()
    for _, item in pairs(IDScroll:GetChildren()) do
        if item:IsA("Frame") then item:Destroy() end
    end
    for index, id in ipairs(spoofIDs) do
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -5, 0, 30)
        frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        frame.Parent = IDScroll
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.8, 0, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.fromRGB(40, 40, 40)
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextTruncate = Enum.TextTruncate.AtEnd
        label.Parent = frame
        
        fetchNameAsync(id, label)
        
        local removeBtn = Instance.new("TextButton")
        removeBtn.Size = UDim2.new(0, 24, 0, 24)
        removeBtn.Position = UDim2.new(1, -30, 0.5, -12)
        removeBtn.BackgroundColor3 = Color3.fromRGB(192, 57, 43)
        removeBtn.Text = "X"
        removeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        removeBtn.Font = Enum.Font.GothamBold
        removeBtn.Parent = frame
        Instance.new("UICorner", removeBtn).CornerRadius = UDim.new(0, 4)
        
        removeBtn.MouseButton1Click:Connect(function()
            table.remove(spoofIDs, index)
            if selectedID == id then 
                selectedID = spoofIDs[1] or 0 
                if selectedID ~= 0 then
                    fetchNameAsync(selectedID, Dropdown)
                else
                    Dropdown.Text = "Select ID..."
                end
            end
            updateIDsUI()
            updateDropdown()
        end)
    end
    updateDropdown()
end

updateWhitelistUI()
updateIDsUI()

Dropdown.MouseButton1Click:Connect(function() DropList.Visible = not DropList.Visible end)

WLAdd.MouseButton1Click:Connect(function()
    local name = WLInput.Text
    local success, userId = pcall(function() return Players:GetUserIdFromNameAsync(name) end)
    
    if success then
        whitelist[userId] = name
        WLInput.Text = ""
        WLAdd.Text = "Added!"
        updateWhitelistUI()
        task.wait(1)
        WLAdd.Text = "Add Username"
    else
        WLAdd.Text = "Not Found!"
        WLAdd.BackgroundColor3 = Color3.fromRGB(192, 57, 43)
        task.wait(1)
        WLAdd.Text = "Add Username"
        WLAdd.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
    end
end)

IDAdd.MouseButton1Click:Connect(function()
    local id = tonumber(IDInput.Text)
    if id and not table.find(spoofIDs, id) then
        table.insert(spoofIDs, id)
        IDInput.Text = ""
        IDAdd.Text = "Added!"
        updateIDsUI()
        task.wait(1)
        IDAdd.Text = "Add Manual"
    else
        IDAdd.Text = "Invalid/Dup"
        IDAdd.BackgroundColor3 = Color3.fromRGB(192, 57, 43)
        task.wait(1)
        IDAdd.Text = "Add Manual"
        IDAdd.BackgroundColor3 = Color3.fromRGB(41, 128, 185)
    end
end)

local isRecording = false
local recordingConnections = {}

local function toggleRecording()
    isRecording = not isRecording
    
    if isRecording then
        RecordBtn.Text = "⏹ Stop Record"
        RecordBtn.BackgroundColor3 = Color3.fromRGB(192, 57, 43)

        local c1 = Market.PromptProductPurchaseRequested:Connect(function(player, productId)
            if player == Players.LocalPlayer and not table.find(spoofIDs, productId) then
                table.insert(spoofIDs, productId)
                updateIDsUI()
            end
        end)

        local c2 = Market.PromptGamePassPurchaseRequested:Connect(function(player, gamePassId)
            if player == Players.LocalPlayer and not table.find(spoofIDs, gamePassId) then
                table.insert(spoofIDs, gamePassId)
                updateIDsUI()
            end
        end)

        local c3 = Market.PromptPurchaseRequested:Connect(function(player, assetId)
             if player == Players.LocalPlayer and not table.find(spoofIDs, assetId) then
                table.insert(spoofIDs, assetId)
                updateIDsUI()
            end
        end)
        
        table.insert(recordingConnections, c1)
        table.insert(recordingConnections, c2)
        table.insert(recordingConnections, c3)
    else
        RecordBtn.Text = "Record"
        RecordBtn.BackgroundColor3 = Color3.fromRGB(123, 123, 123)
        
        for _, conn in ipairs(recordingConnections) do
            conn:Disconnect()
        end
        table.clear(recordingConnections)
    end
end

RecordBtn.MouseButton1Click:Connect(toggleRecording)

FireBtn.MouseButton1Click:Connect(function()
    if selectedID == 0 then return end
    
    for _, v in pairs(Players:GetPlayers()) do
        if v == Players.LocalPlayer or whitelist[v.UserId] then continue end
        
        local trollFolder = Players.LocalPlayer:FindFirstChild("PlayerGui")
            :FindFirstChild("Troll", true)
        
        if trollFolder then
            local remote = trollFolder:FindFirstChild("RemoteEvent", true)
            if remote then
                remote:FireServer(v.Name)
                task.wait()
                Market:SignalPromptProductPurchaseFinished(Players.LocalPlayer.UserId, selectedID, true)
                task.wait(0.1)
            end
        end
    end
end)

local function switchTab(activeBtn, activePage)
    local tabs = {MainTabBtn, WhitelistTabBtn, IdsTabBtn}
    local pages = {MainPage, WhitelistPage, IdsPage}
    
    for i, btn in ipairs(tabs) do
        if btn == activeBtn then
            btn.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
            btn.TextColor3 = Color3.fromRGB(40, 40, 40)
            pages[i].Visible = true
        else
            btn.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            btn.TextColor3 = Color3.fromRGB(130, 130, 130)
            pages[i].Visible = false
        end
    end
end

MainTabBtn.MouseButton1Click:Connect(function() switchTab(MainTabBtn) end)
WhitelistTabBtn.MouseButton1Click:Connect(function() switchTab(WhitelistTabBtn) end)
IdsTabBtn.MouseButton1Click:Connect(function() switchTab(IdsTabBtn) end)

local dragging, dragInput, dragStart, startPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true dragStart = input.Position startPos = MainFrame.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
