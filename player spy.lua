-- Create a ScreenGui to hold the GUI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame to act as the GUI
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.5, 0) -- 50% of screen width and height
frame.Position = UDim2.new(0.25, 0, 0.25, 0) -- Centered on the screen
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) -- Dark gray background
frame.BorderSizePixel = 0
frame.Visible = true -- Initially visible
frame.Parent = screenGui

-- Add a close button (X) to the top-right corner
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0) -- 10% of the frame's width and height
closeButton.Position = UDim2.new(0.9, 0, 0, 0) -- Top-right corner
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1) -- White text
closeButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

-- Create a ScrollingFrame to hold the player list
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(0.9, 0, 0.8, 0) -- 90% of the frame's width and 80% of its height
scrollingFrame.Position = UDim2.new(0.05, 0, 0.15, 0) -- Slightly below the close button
scrollingFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1) -- Darker gray background
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.Parent = frame

-- Create a UIListLayout to organize the player list
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Padding = UDim.new(0, 5) -- Spacing between items
uiListLayout.Parent = scrollingFrame

-- Function to create a player info menu
local function createPlayerMenu(player)
    -- Create a popup menu frame
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0.4, 0, 0.3, 0) -- 40% of the GUI's width, 30% of its height
    menuFrame.Position = UDim2.new(0.3, 0, 0.35, 0) -- Centered in the GUI
    menuFrame.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3) -- Light gray background
    menuFrame.BorderSizePixel = 0
    menuFrame.Parent = frame

    -- Add a close button for the menu
    local menuCloseButton = Instance.new("TextButton")
    menuCloseButton.Size = UDim2.new(0.1, 0, 0.1, 0) -- 10% of the menu's width and height
    menuCloseButton.Position = UDim2.new(0.9, 0, 0, 0) -- Top-right corner
    menuCloseButton.Text = "X"
    menuCloseButton.TextColor3 = Color3.new(1, 1, 1) -- White text
    menuCloseButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
    menuCloseButton.BorderSizePixel = 0
    menuCloseButton.Parent = menuFrame

    -- Add player info labels
    local displayNameLabel = Instance.new("TextLabel")
    displayNameLabel.Size = UDim2.new(0.8, 0, 0.15, 0) -- 80% of the menu's width, 15% of its height
    displayNameLabel.Position = UDim2.new(0.1, 0, 0.05, 0) -- Slightly indented
    displayNameLabel.Text = "Display Name: " .. player.DisplayName
    displayNameLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
    displayNameLabel.BackgroundTransparency = 1 -- Transparent background
    displayNameLabel.Parent = menuFrame

    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
    usernameLabel.Position = UDim2.new(0.1, 0, 0.2, 0)
    usernameLabel.Text = "Username: " .. player.Name
    usernameLabel.TextColor3 = Color3.new(1, 1, 1)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.Parent = menuFrame

    local healthLabel = Instance.new("TextLabel")
    healthLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
    healthLabel.Position = UDim2.new(0.1, 0, 0.35, 0)
    healthLabel.Text = "Health: " .. tostring(player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or "N/A")
    healthLabel.TextColor3 = Color3.new(1, 1, 1)
    healthLabel.BackgroundTransparency = 1
    healthLabel.Parent = menuFrame

    -- Add a Teleport button
    local teleportButton = Instance.new("TextButton")
    teleportButton.Size = UDim2.new(0.8, 0, 0.15, 0) -- 80% of the menu's width, 15% of its height
    teleportButton.Position = UDim2.new(0.1, 0, 0.55, 0)
    teleportButton.Text = "Teleport to Player"
    teleportButton.TextColor3 = Color3.new(1, 1, 1) -- White text
    teleportButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1) -- Blue background
    teleportButton.BorderSizePixel = 0
    teleportButton.Parent = menuFrame

    -- Add a Watch Player button
    local watchButton = Instance.new("TextButton")
    watchButton.Size = UDim2.new(0.8, 0, 0.15, 0)
    watchButton.Position = UDim2.new(0.1, 0, 0.75, 0)
    watchButton.Text = "Watch Player"
    watchButton.TextColor3 = Color3.new(1, 1, 1)
    watchButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2) -- Green background
    watchButton.BorderSizePixel = 0
    watchButton.Parent = menuFrame

    -- Function to update health in real-time
    local function updateHealth()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            healthLabel.Text = "Health: " .. tostring(player.Character.Humanoid.Health)
        else
            healthLabel.Text = "Health: N/A"
        end
    end

    -- Update health when the player's health changes
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(updateHealth)
    end

    -- Teleport to the player when the Teleport button is clicked
    teleportButton.MouseButton1Click:Connect(function()
        local localPlayer = game.Players.LocalPlayer
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end)

    -- Toggle spectating the player when the Watch button is clicked
    local isSpectating = false
    local originalCameraType = workspace.CurrentCamera.CameraType
    local originalCameraCFrame = workspace.CurrentCamera.CFrame
    local cameraOffset = Vector3.new(0, 5, -10) -- Camera offset for orbiting
    local cameraAngle = 0 -- Angle for orbiting

    watchButton.MouseButton1Click:Connect(function()
        if not isSpectating then
            -- Start spectating
            isSpectating = true
            watchButton.Text = "Stop Watching"
            workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

            -- Create a RunService loop for smooth orbiting
            local runService = game:GetService("RunService")
            local connection
            connection = runService.RenderStepped:Connect(function()
                if not isSpectating or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                    connection:Disconnect() -- Stop if spectating ends or player is invalid
                    return
                end

                -- Calculate camera position for orbiting
                cameraAngle = (cameraAngle + 0.01) % (2 * math.pi)
                local offset = CFrame.new(cameraOffset) * CFrame.Angles(0, cameraAngle, 0)
                local cameraPosition = player.Character.HumanoidRootPart.Position + offset.Position

                -- Update camera position and focus
                workspace.CurrentCamera.CFrame = CFrame.new(cameraPosition, player.Character.HumanoidRootPart.Position)
            end)
        else
            -- Stop spectating
            isSpectating = false
            watchButton.Text = "Watch Player"
            workspace.CurrentCamera.CameraType = originalCameraType
            workspace.CurrentCamera.CFrame = originalCameraCFrame
        end
    end)

    -- Close the menu when the close button is clicked
    menuCloseButton.MouseButton1Click:Connect(function()
        menuFrame:Destroy()
    end)
end

-- Function to update the player list
local function updatePlayerList()
    -- Clear the existing player list
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Add each player to the list
    for _, player in ipairs(game.Players:GetPlayers()) do
        local playerButton = Instance.new("TextButton")
        playerButton.Size = UDim2.new(1, 0, 0, 30) -- Full width, fixed height
        playerButton.Text = player.Name
        playerButton.TextColor3 = Color3.new(1, 1, 1) -- White text
        playerButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) -- Dark gray background
        playerButton.BorderSizePixel = 0
        playerButton.Parent = scrollingFrame

        -- Open the player menu when the button is clicked
        playerButton.MouseButton1Click:Connect(function()
            createPlayerMenu(player)
        end)
    end
end

-- Update the player list initially
updatePlayerList()

-- Update the player list when a player joins or leaves
game.Players.PlayerAdded:Connect(updatePlayerList)
game.Players.PlayerRemoving:Connect(updatePlayerList)

-- Function to toggle GUI visibility
local function toggleVisibility()
    frame.Visible = not frame.Visible
end

-- Function to destroy the GUI
local function destroyGUI()
    screenGui:Destroy()
end

-- Detect when the Right Control key is pressed
local userInputService = game:GetService("UserInputService")

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end -- Ignore if the game is processing the input

    if input.KeyCode == Enum.KeyCode.RightControl then
        toggleVisibility()
    end
end)

-- Detect when the close button is clicked
closeButton.MouseButton1Click:Connect(destroyGUI)