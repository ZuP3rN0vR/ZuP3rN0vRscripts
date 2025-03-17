-- Services
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create Screen GUI
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.Name = "CustomMenu"

-- Create Main Frame
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(150, 150, 150)
frame.Visible = false -- Initially hidden

-- Add Rounded Edges
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

-- Scrollable Tab Container
local tabContainer = Instance.new("ScrollingFrame")
tabContainer.Parent = frame
tabContainer.Size = UDim2.new(0.3, 0, 1, 0)
tabContainer.Position = UDim2.new(0, 0, 0, 0)
tabContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabContainer.BorderSizePixel = 1
tabContainer.ScrollBarThickness = 6
tabContainer.CanvasSize = UDim2.new(0, 0, 1.5, 0)

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 5)
tabCorner.Parent = tabContainer

-- Content Frame for Buttons/Actions
local contentFrame = Instance.new("Frame")
contentFrame.Parent = frame
contentFrame.Size = UDim2.new(0.7, 0, 1, 0)
contentFrame.Position = UDim2.new(0.3, 0, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
contentFrame.BorderSizePixel = 0

-- Add Startup Text
local startupLabel = Instance.new("TextLabel")
startupLabel.Parent = contentFrame
startupLabel.Size = UDim2.new(1, 0, 1, 0)
startupLabel.Position = UDim2.new(0, 0, 0, 0)
startupLabel.BackgroundTransparency = 1
startupLabel.Text = "Made by ZuP3rN0vR"
startupLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
startupLabel.TextScaled = true
startupLabel.Font = Enum.Font.SourceSansBold

-- Function to Create Tabs
local function createTab(tabName, onClickFunction)
    local tabButton = Instance.new("TextButton")
    tabButton.Parent = tabContainer
    tabButton.Size = UDim2.new(0.9, 0, 0, 50)
    tabButton.Position = UDim2.new(0.05, 0, 0, (#tabContainer:GetChildren() - 1) * 55)
    tabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    tabButton.Text = tabName
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.TextScaled = true

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = tabButton

    tabButton.MouseButton1Click:Connect(function()
        contentFrame:ClearAllChildren() -- Clear startup text on first tab click
        onClickFunction()
    end)
end

-- Create "Doors" Tab
createTab("Doors", function()
    local deleteButton = Instance.new("TextButton")
    deleteButton.Parent = contentFrame
    deleteButton.Size = UDim2.new(0.5, 0, 0.2, 0)
    deleteButton.Position = UDim2.new(0.25, 0, 0.4, 0)
    deleteButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    deleteButton.Text = "Delete All Doors"
    deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    deleteButton.TextScaled = true

    local deleteCorner = Instance.new("UICorner")
    deleteCorner.CornerRadius = UDim.new(0, 5)
    deleteCorner.Parent = deleteButton

    deleteButton.MouseButton1Click:Connect(function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Model") or obj:IsA("Part") then
                if string.find(obj.Name:lower(), "door") then
                    obj:Destroy()
                end
            end
        end
        print("All objects with 'door' in their name have been destroyed.")
    end)
end)

-- Create "Items" Tab
createTab("Items", function()
    local rifleButton = Instance.new("TextButton")
    rifleButton.Parent = contentFrame
    rifleButton.Size = UDim2.new(0.5, 0, 0.2, 0)
    rifleButton.Position = UDim2.new(0.25, 0, 0.4, 0)
    rifleButton.BackgroundColor3 = Color3.fromRGB(50, 150, 200)
    rifleButton.Text = "Rifle"
    rifleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    rifleButton.TextScaled = true

    local rifleCorner = Instance.new("UICorner")
    rifleCorner.CornerRadius = UDim.new(0, 5)
    rifleCorner.Parent = rifleButton

    rifleButton.MouseButton1Click:Connect(function()
        local givers = workspace:FindFirstChild("Givers")
        if givers then
            for _, station in ipairs(givers:GetChildren()) do
                if station:IsA("Model") and station.Name == "Station" then
                    local item = station:FindFirstChild("Item")
                    if item and item:IsA("StringValue") and item.Value == "RifleSWAT" then
                        if not station.PrimaryPart then
                            local firstChild = station:FindFirstChildOfClass("Part") or station:FindFirstChildOfClass("MeshPart")
                            if firstChild then
                                station.PrimaryPart = firstChild
                            else
                                print("No valid PrimaryPart found for", station.Name)
                                continue
                            end
                        end
                        station:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                    end
                end
            end
        else
            print("Givers folder not found in the workspace!")
        end
    end)
end)

-- Create "Movement" Tab
createTab("Movement", function()
    local jumpPowerLabel = Instance.new("TextLabel")
    jumpPowerLabel.Parent = contentFrame
    jumpPowerLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
    jumpPowerLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
    jumpPowerLabel.BackgroundTransparency = 1
    jumpPowerLabel.Text = "JumpPower"
    jumpPowerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    jumpPowerLabel.TextScaled = true

    local jumpPowerSlider = Instance.new("TextBox")
    jumpPowerSlider.Parent = contentFrame
    jumpPowerSlider.Size = UDim2.new(0.8, 0, 0.1, 0)
    jumpPowerSlider.Position = UDim2.new(0.1, 0, 0.25, 0)
    jumpPowerSlider.Text = "50"
    jumpPowerSlider.FocusLost:Connect(function()
        local newJump = tonumber(jumpPowerSlider.Text)
        if newJump and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = newJump
        end
    end)
end)

-- Create Close Button
local closeButton = Instance.new("TextButton")
closeButton.Parent = frame
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.9, -10, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Toggle UI Visibility with RightShift
local isVisible = false
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        isVisible = not isVisible
        frame.Visible = isVisible
    end
end)
