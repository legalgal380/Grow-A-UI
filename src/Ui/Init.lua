local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local GrowAUI = {}

local Themes = {
	["Default"] = {
		Main = Color3.fromRGB(255, 178, 31),
		Tabs = Color3.fromRGB(216, 150, 26),
		TopBar = Color3.fromRGB(97, 255, 33),
		Content = Color3.fromRGB(216, 150, 26),
	}
}

function GrowAUI:CreateMenu(options)
	options = options or {}
	local theme = Themes[options.Theme] or Themes["Default"]

	local Gui = Instance.new("ScreenGui", PlayerGui)
	Gui.Name = options.Name or "NameOfGrowAUIMenu"
	Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	CollectionService:AddTag(Gui, "main")

	-- Minimize Button
	local Minimize = Instance.new("ImageLabel", Gui)
	Minimize.Name = "MinimizeUI"
	Minimize.Size = UDim2.new(0, 50, 0, 50)
	Minimize.Position = UDim2.new(0, 126, 0, 138)
	Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.Image = "icon"
	Instance.new("UICorner", Minimize).CornerRadius = UDim.new(1, 0)
	Instance.new("UIStroke", Minimize)

	local Main = Instance.new("ImageLabel", Gui)
	Main.Name = "MainFrame"
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 384, 0, 252)
	Main.BackgroundColor3 = theme.Main
	Main.Image = "rbxassetid://18878365966"
	Main.ScaleType = Enum.ScaleType.Tile
	Main.TileSize = UDim2.new(0.5, 0, 0.5, 0)
	Instance.new("UICorner", Main)
	Instance.new("UIStroke", Main)

	-- Tabs
	local Tabs = Instance.new("ImageLabel", Main)
	Tabs.Name = "Tabs"
	Tabs.Position = UDim2.new(0, 8, 0, 36)
	Tabs.Size = UDim2.new(0, 86, 0, 208)
	Tabs.BackgroundColor3 = theme.Tabs
	Tabs.Image = "rbxassetid://18878365966"
	Tabs.ScaleType = Enum.ScaleType.Tile
	Tabs.TileSize = UDim2.new(2, 0, 0.5, 0)
	Instance.new("UICorner", Tabs)
	Instance.new("UIStroke", Tabs)

	-- Top Bar
	local TopBar = Instance.new("ImageLabel", Main)
	TopBar.Name = "TopBar"
	TopBar.Position = UDim2.new(0, 0, 0, -26)
	TopBar.Size = UDim2.new(0, 384, 0, 54)
	TopBar.BackgroundColor3 = theme.TopBar
	TopBar.Image = "rbxassetid://18878365966"
	TopBar.ScaleType = Enum.ScaleType.Tile
	TopBar.TileSize = UDim2.new(0.5, 0, 2, 0)
	Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 2)
	local stroke = Instance.new("UIStroke", TopBar)
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	-- Content
	local Content = Instance.new("ImageLabel", Main)
	Content.Name = "Content"
	Content.Position = UDim2.new(0, 98, 0, 38)
	Content.Size = UDim2.new(0, 276, 0, 206)
	Content.BackgroundColor3 = theme.Content
	Content.Image = "rbxassetid://18878365966"
	Content.ScaleType = Enum.ScaleType.Tile
	Content.TileSize = UDim2.new(0.5, 0, 0.5, 0)
	Instance.new("UICorner", Content)
	Instance.new("UIStroke", Content)

	return Gui
end

return GrowAUI
