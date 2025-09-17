-- Grow a UI - by @adeusdiahduah
local GrowUI = {}

local Themes = {
    ["DeadGarden"] = {
        Background = Color3.fromRGB(50, 50, 50),
        Accent = Color3.fromRGB(80, 30, 30),
        Text = Color3.fromRGB(200, 200, 200),
    },
    ["Spring"] = {
        Background = Color3.fromRGB(255, 230, 240),
        Accent = Color3.fromRGB(200, 120, 180),
        Text = Color3.fromRGB(60, 40, 70),
    },
    ["FallenLeaves"] = {
        Background = Color3.fromRGB(180, 100, 50),
        Accent = Color3.fromRGB(255, 170, 70),
        Text = Color3.fromRGB(60, 30, 20),
    },
    ["Summer"] = {
        Background = Color3.fromRGB(255, 220, 100),
        Accent = Color3.fromRGB(255, 150, 50),
        Text = Color3.fromRGB(50, 30, 0),
    }
}

-- Create the main window
function GrowUI:CreateWindow(themeName)
    local theme = Themes[themeName] or Themes["Spring"]

    local gui = Instance.new("ScreenGui")
    gui.Name = "GrowUI"
    gui.ResetOnSpawn = false
    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 250)
    frame.Position = UDim2.new(0.5, -200, 0.5, -125)
    frame.BackgroundColor3 = theme.Background
    frame.Parent = gui

    Instance.new("UICorner", frame)

    return frame, theme
end

-- Create a customizable minimize button
function GrowUI:AddMinimizeButton(parentFrame, options)
    options = options or {}
    local color = options.Color or Color3.fromRGB(80, 80, 80)
    local icon = options.Icon or "rbxassetid://18879572289"

    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(0, 35, 0, 35)
    holder.Position = UDim2.new(1, -40, 0, 5)
    holder.BackgroundColor3 = color
    holder.Parent = parentFrame
    Instance.new("UICorner", holder)

    local minimize = Instance.new("ImageButton")
    minimize.Size = UDim2.new(1, -5, 1, -5)
    minimize.Position = UDim2.new(0.5, -15, 0.5, -15)
    minimize.BackgroundTransparency = 1
    minimize.Image = icon
    minimize.Parent = holder

    minimize.MouseButton1Click:Connect(function()
        parentFrame.Visible = not parentFrame.Visible
    end)

    return minimize
end

return GrowUI
