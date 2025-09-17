local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local GrowAUI = {}

function GrowAUI:CreateMenu(config)
	local Gui = Instance.new("ScreenGui")
	Gui.Name = config.Name
	Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Gui.Parent = PlayerGui
	CollectionService:AddTag(Gui, "main")
	
	local function makeCornerStroke(parent, radius)
		local c = Instance.new("UICorner", parent)
		c.CornerRadius = radius or UDim.new(0, 4)
		Instance.new("UIStroke", parent)
	end
	
	local MainFrame = Instance.new("ImageLabel", Gui)
	MainFrame.Name = "MainFrame"
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 384, 0, 252)
	MainFrame.BackgroundColor3 = Color3.fromRGB(255, 178, 31)
	MainFrame.Image = "rbxassetid://18878365966"
	MainFrame.ScaleType = Enum.ScaleType.Tile
	MainFrame.TileSize = UDim2.new(0.5, 0, 0.5, 0)
	makeCornerStroke(MainFrame)
	
	local Tabs = Instance.new("ImageLabel", MainFrame)
	Tabs.Name = "Tabs"
	Tabs.Position = UDim2.new(0, 8, 0, 36)
	Tabs.Size = UDim2.new(0, 86, 0, 208)
	Tabs.BackgroundColor3 = Color3.fromRGB(216, 150, 26)
	Tabs.Image = "rbxassetid://18878365966"
	Tabs.ScaleType = Enum.ScaleType.Tile
	Tabs.TileSize = UDim2.new(2, 0, 0.5, 0)
	makeCornerStroke(Tabs)
	
	local TopBar = Instance.new("ImageLabel", MainFrame)
	TopBar.Name = "TopBar"
	TopBar.Position = UDim2.new(0, 0, 0, -14)
	TopBar.Size = UDim2.new(0, 384, 0, 36)
	TopBar.BackgroundColor3 = Color3.fromRGB(97, 255, 33)
	TopBar.Image = "rbxassetid://18878365966"
	TopBar.ScaleType = Enum.ScaleType.Tile
	TopBar.TileSize = UDim2.new(0.2, 0, 2, 0)
	makeCornerStroke(TopBar, UDim.new(0, 2))
	
	local Title = Instance.new("TextLabel", TopBar)
	Title.Name = "Title"
	Title.Text = config.Title
	Title.Size = UDim2.new(0, 386, 0, 28)
	Title.Position = UDim2.new(0, -110, 0, 4)
	Title.BackgroundTransparency = 1
	Title.TextColor3 = Color3.new(1,1,1)
	Title.TextScaled = true
	Instance.new("UIStroke", Title)
	
	local Desc = Instance.new("TextLabel", TopBar)
	Desc.Name = "Desc"
	Desc.Text = config.Desc
	Desc.Size = UDim2.new(0, 386, 0, 12)
	Desc.Position = UDim2.new(0, -32, 0, 18)
	Desc.BackgroundTransparency = 1
	Desc.TextColor3 = Color3.new(1,1,1)
	Desc.TextScaled = true
	Instance.new("UIStroke", Desc)
	
	local Items = Instance.new("ImageLabel", TopBar)
	Items.Name = "Items"
	Items.Position = UDim2.new(0, 236, 0, 6)
	Items.Size = UDim2.new(0, 144, 0, 26)
	Items.BackgroundColor3 = Color3.fromRGB(85, 225, 29)
	Items.Image = "rbxassetid://18878365966"
	Items.ScaleType = Enum.ScaleType.Tile
	Items.TileSize = UDim2.new(0.5, 0, 2, 0)
	makeCornerStroke(Items, UDim.new(0, 2))
	
	
	local function makeButton(parent, name, txt, pos, color)
		local b = Instance.new("TextButton", parent)
		b.Name = name
		b.Text = txt
		b.Position = pos
		b.Size = UDim2.new(0, 52, 0, 18)
		b.BackgroundColor3 = color
		b.TextColor3 = Color3.new(1,1,1)
		b.TextScaled = true
		Instance.new("UIStroke", b)
		return b
	end
	
	makeButton(Items, "CloseButton", "X", UDim2.new(0, 70, 0, 4), Color3.new(1,0,0))
	makeButton(Items, "MinimizeButton", "-", UDim2.new(0, 6, 0, 4), Color3.fromRGB(255,170,37))
	
	local Content = Instance.new("ImageLabel", MainFrame)
	Content.Name = "Content"
	Content.Position = UDim2.new(0, 98, 0, 38)
	Content.Size = UDim2.new(0, 276, 0, 206)
	Content.BackgroundColor3 = Color3.fromRGB(216, 150, 26)
	Content.Image = "rbxassetid://18878365966"
	Content.ScaleType = Enum.ScaleType.Tile
	Content.TileSize = UDim2.new(0.5, 0, 0.5, 0)
	makeCornerStroke(Content)
	
	function GrowAUI:CreateMinimizeButton(config)
	    local MinimizeUI = Instance.new("ImageLabel", Gui)
		MinimizeUI.Name = "MinimizeUI"
		MinimizeUI.Size = UDim2.new(0, 50, 0, 50)
		MinimizeUI.Position = UDim2.new(0, 126, 0, 138)
		MinimizeUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MinimizeUI.Image = config.Icon
		makeCornerStroke(MinimizeUI, UDim.new(1, 0))
	end
end




return GrowAUI
