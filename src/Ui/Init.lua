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

    return frame
end

function GrowUI:AddMinimize(frame, options)
    options = options or {}
    
    local icon = options.Icon or "rbxassetid://18879572289"
    local buttonColor = options.Color or Color3.fromRGB(255, 255, 255)
    local size = options.Size or UDim2.new(0, 30, 0, 30)
    local position = options.Position or UDim2.new(1, -35, 0, 5)

    local minimize = Instance.new("ImageButton")
    minimize.Size = size
    minimize.Position = position
    minimize.BackgroundColor3 = buttonColor
    minimize.Image = icon
    minimize.Parent = frame

    Instance.new("UICorner", minimize)

    minimize.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
    end)

    return minimize
end

return GrowUI
