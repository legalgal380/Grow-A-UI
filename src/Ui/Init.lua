local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local Themes = {
	Default = {
		MainColor = Color3.fromRGB(255, 178, 31),
		TabColor = Color3.fromRGB(216, 150, 26),
		TopBarColor = Color3.fromRGB(97, 255, 33),
		ContentColor = Color3.fromRGB(216, 150, 26)
	}
}

local function ApplyDraggable(frame)
	local dragging, dragInput, dragStart, startPos
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

local function CreateMenu(config)
	local theme = Themes[config.Theme or "Default"]
	local player = Players.LocalPlayer
	local gui = Instance.new("ScreenGui", player.PlayerGui)
	gui.Name = config.Name or "GrowAUIMenu"
	
	local blur = Instance.new("BlurEffect", Lighting)
	blur.Size = 0
	TweenService:Create(blur, TweenInfo.new(0.5), {Size = 20}):Play()
	
	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0, 384, 0, 252)
	main.Position = UDim2.new(0.5, 0, 0.5, 0)
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = theme.MainColor
	ApplyDraggable(main)
	
	local top = Instance.new("Frame", main)
	top.Size = UDim2.new(1, 0, 0, 36)
	top.BackgroundColor3 = theme.TopBarColor
	
	local title = Instance.new("TextLabel", top)
	title.Size = UDim2.new(1, -100, 1, 0)
	title.Position = UDim2.new(0, 10, 0, 0)
	title.BackgroundTransparency = 1
	title.Text = config.Name or "Grow a UI"
	title.TextColor3 = Color3.fromRGB(255,255,255)
	title.Font = Enum.Font.GothamBold
	title.TextScaled = true
	
	local closeBtn = Instance.new("TextButton", top)
	closeBtn.Size = UDim2.new(0, 40, 0, 28)
	closeBtn.Position = UDim2.new(1, -45, 0, 4)
	closeBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
	closeBtn.Text = "X"
	closeBtn.TextScaled = true
	closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
	
	local minBtn = Instance.new("TextButton", top)
	minBtn.Size = UDim2.new(0, 40, 0, 28)
	minBtn.Position = UDim2.new(1, -90, 0, 4)
	minBtn.BackgroundColor3 = Color3.fromRGB(255,170,37)
	minBtn.Text = "-"
	minBtn.TextScaled = true
	minBtn.TextColor3 = Color3.fromRGB(255,255,255)
	
	local content = Instance.new("Frame", main)
	content.Size = UDim2.new(1, -20, 1, -50)
	content.Position = UDim2.new(0, 10, 0, 40)
	content.BackgroundColor3 = theme.ContentColor
	
	minBtn.MouseButton1Click:Connect(function()
		local goal = main.Size.Y.Offset > 40 and UDim2.new(0,384,0,36) or UDim2.new(0,384,0,252)
		TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = goal}):Play()
	end)
	
	closeBtn.MouseButton1Click:Connect(function()
		TweenService:Create(main, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
		TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
		wait(0.5)
		gui:Destroy()
		blur:Destroy()
	end)
	
	return {Gui = gui, MainFrame = main, Content = content}
end

return {CreateMenu = CreateMenu, Themes = Themes}
