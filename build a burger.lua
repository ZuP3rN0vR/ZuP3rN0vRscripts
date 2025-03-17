-- Variables
local player = game.Players.LocalPlayer
local guiEnabled = false
local UIS = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Function to create the GUI
local function createGUI()
    -- Check if the GUI already exists
    local existingGUI = player.PlayerGui:FindFirstChild("ZuP3rN0vR_GUI")
    if existingGUI then
        existingGUI:Destroy() -- Remove the existing GUI to avoid duplicates
    end

    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ZuP3rN0vR_GUI"
    screenGui.ResetOnSpawn = false -- Ensure the GUI doesn't reset when the player respawns
    screenGui.Parent = player.PlayerGui

    -- Create Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 500, 0, 400) -- Larger size
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui

    -- Round the corners of the main frame
    local mainFrameCorner = Instance.new("UICorner")
    mainFrameCorner.CornerRadius = UDim.new(0, 12)
    mainFrameCorner.Parent = mainFrame

    -- Add Drop Shadow for a modern look
    local mainFrameShadow = Instance.new("ImageLabel")
    mainFrameShadow.Name = "Shadow"
    mainFrameShadow.Size = UDim2.new(1, 10, 1, 10)
    mainFrameShadow.Position = UDim2.new(0, -5, 0, -5)
    mainFrameShadow.BackgroundTransparency = 1
    mainFrameShadow.Image = "rbxassetid://5234388158" -- Shadow asset ID
    mainFrameShadow.ScaleType = Enum.ScaleType.Slice
    mainFrameShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    mainFrameShadow.ImageColor3 = Color3.fromRGB(0, 0, 0) -- Ensure shadow is black
    mainFrameShadow.ImageTransparency = 0.5 -- Adjust transparency for a softer shadow
    mainFrameShadow.Parent = mainFrame

    -- Add Title Label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Text = "ZuP3rN0vR's Build A Burger Hub"
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 20
    titleLabel.Parent = mainFrame

    -- Round the corners of the title bar
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 12)
    titleCorner.Parent = titleLabel

    -- Add Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Text = "X"
    closeButton.Size = UDim2.new(0, 40, 0, 40)
    closeButton.Position = UDim2.new(1, -40, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 18
    closeButton.Parent = mainFrame

    -- Round the corners of the close button
    local closeButtonCorner = Instance.new("UICorner")
    closeButtonCorner.CornerRadius = UDim.new(0, 12)
    closeButtonCorner.Parent = closeButton

    -- Delete GUI when "X" is clicked
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy() -- Destroys the entire GUI
    end)

    -- Add Resize Handle
    local resizeHandle = Instance.new("Frame")
    resizeHandle.Name = "ResizeHandle"
    resizeHandle.Size = UDim2.new(0, 15, 0, 15)
    resizeHandle.Position = UDim2.new(1, -15, 1, -15)
    resizeHandle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    resizeHandle.BorderSizePixel = 0
    resizeHandle.Parent = mainFrame

    -- Round the corners of the resize handle
    local resizeHandleCorner = Instance.new("UICorner")
    resizeHandleCorner.CornerRadius = UDim.new(0, 4)
    resizeHandleCorner.Parent = resizeHandle

    -- Add Tabs Frame
    local tabsFrame = Instance.new("Frame")
    tabsFrame.Name = "TabsFrame"
    tabsFrame.Size = UDim2.new(0, 120, 1, -40)
    tabsFrame.Position = UDim2.new(0, 0, 0, 40)
    tabsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tabsFrame.BorderSizePixel = 0
    tabsFrame.Parent = mainFrame

    -- Round the corners of the tabs frame
    local tabsFrameCorner = Instance.new("UICorner")
    tabsFrameCorner.CornerRadius = UDim.new(0, 12)
    tabsFrameCorner.Parent = tabsFrame

    -- Add Scrolling Frame for Tabs
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "ScrollFrame"
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.Position = UDim2.new(0, 0, 0, 0)
    scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    scrollFrame.BorderSizePixel = 0
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = 5
    scrollFrame.Parent = tabsFrame

    -- Add UIListLayout for Tabs
    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Parent = scrollFrame
    uiListLayout.Padding = UDim.new(0, 10)

    -- Add Tabs
    local tabs = {"Ingredients", "Potion"} -- Only two tabs
    for i, tabName in ipairs(tabs) do
        local tabButton = Instance.new("TextButton")
        tabButton.Name = tabName
        tabButton.Text = tabName
        tabButton.Size = UDim2.new(1, -20, 0, 40)
        tabButton.Position = UDim2.new(0, 10, 0, (i - 1) * 50)
        tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.Font = Enum.Font.SourceSansBold
        tabButton.TextSize = 16
        tabButton.Parent = scrollFrame

        -- Round the corners of the tab buttons
        local tabButtonCorner = Instance.new("UICorner")
        tabButtonCorner.CornerRadius = UDim.new(0, 8)
        tabButtonCorner.Parent = tabButton
    end

    -- Update Scroll Frame Canvas Size
    uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y)
    end)

    -- Dragging Functionality
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function updateInput(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateInput(input)
        end
    end)

    -- Resizing Functionality
    local resizing
    local resizeStart
    local startSize

    resizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            resizeStart = input.Position
            startSize = mainFrame.Size
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    resizing = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - resizeStart
            local newWidth = math.clamp(startSize.X.Offset + delta.X, 400, 800) -- Minimum width: 400, Maximum width: 800
            local newHeight = math.clamp(startSize.Y.Offset + delta.Y, 300, 600) -- Minimum height: 300, Maximum height: 600
            mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
        end
    end)

    -- Toggle GUI on Right Shift
    UIS.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            guiEnabled = not guiEnabled
            mainFrame.Visible = guiEnabled
        end
    end)

    -- Hide GUI by default
    mainFrame.Visible = false

    -- Function to create buttons in the Ingredients tab
    local function createIngredientsButtons()
        -- Clear any existing buttons
        for _, child in ipairs(mainFrame:GetChildren()) do
            if child.Name == "IngredientButton" then
                child:Destroy()
            end
        end

        -- Create a frame for the right panel
        local rightPanel = Instance.new("Frame")
        rightPanel.Name = "RightPanel"
        rightPanel.Size = UDim2.new(1, -140, 1, -40) -- Adjust size to fit the right panel
        rightPanel.Position = UDim2.new(0, 130, 0, 40) -- Position to the right of the tabs
        rightPanel.BackgroundTransparency = 1 -- Make it transparent
        rightPanel.Parent = mainFrame

        -- Create 4 buttons and center them in the right panel
        local buttonNames = {"Buns", "Meat and Cheese", "Lettuce", "Chips"} -- Updated button names
        for i, buttonName in ipairs(buttonNames) do
            local button = Instance.new("TextButton")
            button.Name = "IngredientButton"
            button.Text = buttonName
            button.Size = UDim2.new(0.8, 0, 0, 40) -- 80% width of the right panel
            button.Position = UDim2.new(0.1, 0, 0.1 + (i - 1) * 0.2, 0) -- Centered horizontally, spaced vertically
            button.AnchorPoint = Vector2.new(0, 0)
            button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 16
            button.Parent = rightPanel

            -- Round the corners of the buttons
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 8)
            buttonCorner.Parent = button

            -- Add functionality to the buttons
            button.MouseButton1Click:Connect(function()
                if buttonName == "Buns" then
                    -- Fire the ContextAction of OrderButton1
                    local orderButton1 = workspace.Restaurant.IngredientsOrderScreens.MainScreen.OrderButton1
                    if orderButton1 and orderButton1:FindFirstChild("ContextAction") then
                        orderButton1.ContextAction:FireServer()
                        print("Buns button clicked! Fired ContextAction.")
                    else
                        warn("OrderButton1 or ContextAction not found!")
                    end
                elseif buttonName == "Meat and Cheese" then
                    -- Fire the ContextAction of OrderButton2
                    local orderButton2 = workspace.Restaurant.IngredientsOrderScreens.MainScreen.OrderButton2
                    if orderButton2 and orderButton2:FindFirstChild("ContextAction") then
                        orderButton2.ContextAction:FireServer()
                        print("Meat and Cheese button clicked! Fired ContextAction.")
                    else
                        warn("OrderButton2 or ContextAction not found!")
                    end
                elseif buttonName == "Lettuce" then
                    -- Replace this with your custom remote event for Lettuce
                    local lettuceRemote = workspace.Restaurant.IngredientsOrderScreens.MainScreen.OrderButton3.ContextAction
                    if lettuceRemote then
                        lettuceRemote:FireServer()
                        print("Lettuce button clicked! Fired custom remote event.")
                    else
                        warn("Lettuce remote event not found!")
                    end
                elseif buttonName == "Chips" then
                    -- Replace this with your custom remote event for Chips
                    local chipsRemote = workspace.Restaurant.IngredientsOrderScreens.FreezerScreen.OrderButton4.ContextAction
                    if chipsRemote then
                        chipsRemote:FireServer()
                        print("Chips button clicked! Fired custom remote event.")
                    else
                        warn("Chips remote event not found!")
                    end
                end
            end)
        end
    end

-- Function to create buttons in the Potions tab
local function createPotionsButtons()
    -- Clear any existing buttons
    for _, child in ipairs(mainFrame:GetChildren()) do
        if child.Name == "IngredientButton" or child.Name == "PotionButton" then
            child:Destroy()
        end
    end

    -- Create a frame for the right panel
    local rightPanel = Instance.new("Frame")
    rightPanel.Name = "RightPanel"
    rightPanel.Size = UDim2.new(1, -140, 1, -40) -- Adjust size to fit the right panel
    rightPanel.Position = UDim2.new(0, 130, 0, 40) -- Position to the right of the tabs
    rightPanel.BackgroundTransparency = 1 -- Make it transparent
    rightPanel.Parent = mainFrame

    -- Create Rat button and counter
    local ratButton = Instance.new("TextButton")
    ratButton.Name = "PotionButton"
    ratButton.Text = "Rat"
    ratButton.Size = UDim2.new(0.8, 0, 0, 40) -- 80% width of the right panel
    ratButton.Position = UDim2.new(0.1, 0, 0.1, 0) -- Centered horizontally, spaced vertically
    ratButton.AnchorPoint = Vector2.new(0, 0)
    ratButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    ratButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ratButton.Font = Enum.Font.SourceSansBold
    ratButton.TextSize = 16
    ratButton.Parent = rightPanel

    -- Round the corners of the Rat button
    local ratButtonCorner = Instance.new("UICorner")
    ratButtonCorner.CornerRadius = UDim.new(0, 8)
    ratButtonCorner.Parent = ratButton

    -- Create Rat counter
    local ratCounter = Instance.new("TextLabel")
    ratCounter.Name = "RatCounter"
    ratCounter.Text = "0"
    ratCounter.Size = UDim2.new(0, 50, 0, 40)
    ratCounter.Position = UDim2.new(0.9, -50, 0.1, 0)
    ratCounter.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ratCounter.TextColor3 = Color3.fromRGB(255, 255, 255)
    ratCounter.Font = Enum.Font.SourceSansBold
    ratCounter.TextSize = 16
    ratCounter.Parent = rightPanel

    -- Round the corners of the Rat counter
    local ratCounterCorner = Instance.new("UICorner")
    ratCounterCorner.CornerRadius = UDim.new(0, 8)
    ratCounterCorner.Parent = ratCounter

    -- Function to update the Rat counter
    local function updateRatCounter()
        local ratPotionCount = 0
        for _, item in ipairs(workspace.Entities.Items:GetChildren()) do
            if item.Name == "Potion" then
                ratPotionCount = ratPotionCount + 1
            end
        end
        ratCounter.Text = tostring(ratPotionCount)
    end

    -- Update the Rat counter initially
    updateRatCounter()

    -- Connect the Rat counter to changes in the workspace.Entities.Items folder
    workspace.Entities.Items.ChildAdded:Connect(function(child)
        if child.Name == "Potion" then
            updateRatCounter()
        end
    end)

    workspace.Entities.Items.ChildRemoved:Connect(function(child)
        if child.Name == "Potion" then
            updateRatCounter()
        end
    end)

    -- Add functionality to the Rat button
    ratButton.MouseButton1Click:Connect(function()
        -- Fire server event for Rat
        local remoteEventForRat = workspace.Entities.Items.Potion.ContextAction
        if remoteEventForRat then
            remoteEventForRat:FireServer()
            print("Rat button clicked! Fired server event.")
        else
            warn("Remote event for Rat not found!")
        end
    end)

    -- Create Cat button and counter
    local catButton = Instance.new("TextButton")
    catButton.Name = "PotionButton"
    catButton.Text = "Cat"
    catButton.Size = UDim2.new(0.8, 0, 0, 40) -- 80% width of the right panel
    catButton.Position = UDim2.new(0.1, 0, 0.3, 0) -- Centered horizontally, spaced vertically
    catButton.AnchorPoint = Vector2.new(0, 0)
    catButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    catButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    catButton.Font = Enum.Font.SourceSansBold
    catButton.TextSize = 16
    catButton.Parent = rightPanel

    -- Round the corners of the Cat button
    local catButtonCorner = Instance.new("UICorner")
    catButtonCorner.CornerRadius = UDim.new(0, 8)
    catButtonCorner.Parent = catButton

    -- Create Cat counter
    local catCounter = Instance.new("TextLabel")
    catCounter.Name = "CatCounter"
    catCounter.Text = "0"
    catCounter.Size = UDim2.new(0, 50, 0, 40)
    catCounter.Position = UDim2.new(0.9, -50, 0.3, 0)
    catCounter.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    catCounter.TextColor3 = Color3.fromRGB(255, 255, 255)
    catCounter.Font = Enum.Font.SourceSansBold
    catCounter.TextSize = 16
    catCounter.Parent = rightPanel

    -- Round the corners of the Cat counter
    local catCounterCorner = Instance.new("UICorner")
    catCounterCorner.CornerRadius = UDim.new(0, 8)
    catCounterCorner.Parent = catCounter

    -- Function to update the Cat counter
    local function updateCatCounter()
        local catPotionCount = 0
        for _, item in ipairs(workspace.Entities.Items:GetChildren()) do
            if item.Name == "CatPotion" then
                catPotionCount = catPotionCount + 1
            end
        end
        catCounter.Text = tostring(catPotionCount)
    end

    -- Update the Cat counter initially
    updateCatCounter()

    -- Connect the Cat counter to changes in the workspace.Entities.Items folder
    workspace.Entities.Items.ChildAdded:Connect(function(child)
        if child.Name == "CatPotion" then
            updateCatCounter()
        end
    end)

    workspace.Entities.Items.ChildRemoved:Connect(function(child)
        if child.Name == "CatPotion" then
            updateCatCounter()
        end
    end)

    -- Add functionality to the Cat button
    catButton.MouseButton1Click:Connect(function()
        -- Fire server event for Cat
        local remoteEventForCat = workspace.Entities.Items.CatPotion.ContextAction
        if remoteEventForCat then
            remoteEventForCat:FireServer()
            print("Cat button clicked! Fired server event.")
        else
            warn("Remote event for Cat not found!")
        end
    end)

    -- Create Exotic Potion button and counter
    local exoticButton = Instance.new("TextButton")
    exoticButton.Name = "PotionButton"
    exoticButton.Text = "Exotic Potion"
    exoticButton.Size = UDim2.new(0.8, 0, 0, 40) -- 80% width of the right panel
    exoticButton.Position = UDim2.new(0.1, 0, 0.5, 0) -- Centered horizontally, spaced vertically
    exoticButton.AnchorPoint = Vector2.new(0, 0)
    exoticButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    exoticButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    exoticButton.Font = Enum.Font.SourceSansBold
    exoticButton.TextSize = 16
    exoticButton.Parent = rightPanel

    -- Round the corners of the Exotic Potion button
    local exoticButtonCorner = Instance.new("UICorner")
    exoticButtonCorner.CornerRadius = UDim.new(0, 8)
    exoticButtonCorner.Parent = exoticButton

    -- Create Exotic Potion counter
    local exoticCounter = Instance.new("TextLabel")
    exoticCounter.Name = "ExoticCounter"
    exoticCounter.Text = "0"
    exoticCounter.Size = UDim2.new(0, 50, 0, 40)
    exoticCounter.Position = UDim2.new(0.9, -50, 0.5, 0)
    exoticCounter.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    exoticCounter.TextColor3 = Color3.fromRGB(255, 255, 255)
    exoticCounter.Font = Enum.Font.SourceSansBold
    exoticCounter.TextSize = 16
    exoticCounter.Parent = rightPanel

    -- Round the corners of the Exotic Potion counter
    local exoticCounterCorner = Instance.new("UICorner")
    exoticCounterCorner.CornerRadius = UDim.new(0, 8)
    exoticCounterCorner.Parent = exoticCounter

    -- Function to update the Exotic Potion counter
    local function updateExoticCounter()
        local exoticPotionCount = 0
        for _, item in ipairs(workspace.Entities.Items:GetChildren()) do
            if item.Name == "ExoticPotion" then
                exoticPotionCount = exoticPotionCount + 1
            end
        end
        exoticCounter.Text = tostring(exoticPotionCount)
    end

    -- Update the Exotic Potion counter initially
    updateExoticCounter()

    -- Connect the Exotic Potion counter to changes in the workspace.Entities.Items folder
    workspace.Entities.Items.ChildAdded:Connect(function(child)
        if child.Name == "ExoticPotion" then
            updateExoticCounter()
        end
    end)

    workspace.Entities.Items.ChildRemoved:Connect(function(child)
        if child.Name == "ExoticPotion" then
            updateExoticCounter()
        end
    end)

    -- Add functionality to the Exotic Potion button
    exoticButton.MouseButton1Click:Connect(function()
        -- Fire server event for Exotic Potion
        local remoteEventForExotic = workspace.Entities.Items.ExoticPotion.ContextAction
        if remoteEventForExotic then
            remoteEventForExotic:FireServer()
            print("Exotic Potion button clicked! Fired server event.")
        else
            warn("Remote event for Exotic Potion not found!")
        end
    end)
end

    -- Connect the Ingredients tab button to create the buttons
    local ingredientsTabButton = scrollFrame:FindFirstChild("Ingredients")
    if ingredientsTabButton then
        ingredientsTabButton.MouseButton1Click:Connect(function()
            createIngredientsButtons()
        end)
    end

    -- Connect the Potion tab button to create the buttons
    local potionTabButton = scrollFrame:FindFirstChild("Potion")
    if potionTabButton then
        potionTabButton.MouseButton1Click:Connect(function()
            createPotionsButtons()
        end)
    end
end

-- Create the GUI when the script runs
createGUI()