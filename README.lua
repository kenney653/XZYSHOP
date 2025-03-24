local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XZYSHOPUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Size = UDim2.new(0, 350, 0, 450)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner_Main = Instance.new("UICorner", MainFrame)
UICorner_Main.CornerRadius = UDim.new(0, 12)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = " XZYSHOP "
TitleLabel.TextSize = 22
TitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TitleLabel.TextStrokeTransparency = 0.3

local FunctionButtonsFrame = Instance.new("ScrollingFrame")
FunctionButtonsFrame.Parent = MainFrame
FunctionButtonsFrame.BackgroundTransparency = 1
FunctionButtonsFrame.Size = UDim2.new(1, -20, 1, -60)
FunctionButtonsFrame.Position = UDim2.new(0, 10, 0, 60)
FunctionButtonsFrame.ScrollBarThickness = 5
FunctionButtonsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

local functionCategories = {
    ["⚔️ | การโจมตี"] = {
        ["[+] XZYSHOP"] = "https://pastebin.com/WMdUCfHG",
        ["[+] ล็อคหัว"] = "https://gist.githubusercontent.com/Aimboter477387/582af6aec49782899d5d375ab239039e/raw"
    },
    ["⚡ | การเคลื่อนที่"] = {
        ["[+] บิน V1"] = "https://pastebin.com/raw/PRmEBc49",
        ["[+] วาป"] = "https://pastebin.com/raw/K5FYvtvN",
        ["[+] ทะลุกำแพง"] = "https://pastebin.com/raw/7Qab6kg9",
        ["[+] วิ่งเร็ว 4 เท่า"] = "https://pastebin.com/raw/pZhkm5mD"
    },
    [" |  ESP & การมองเห็น"] = {
        ["[+] ESP Players"] = "https://pastebin.com/raw/ZkLhNuDL",
        ["[+] ESP BOT,NPC"] = "https://pastebin.com/raw/q26QuBF"
    },
    ["⚒️ | เครื่องมือช่วยเล่น"] = {
        ["[+] เสกของ"] = "https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua",
        ["[+] บูส FPS"] = "https://raw.githubusercontent.com/XNEOFF/FPS-BOOSTER/main/FPSBooster.txt",
        ["[+] Hitbox 32%"] = "https://pastebin.com/raw/iRyTtfmf",
        ["[+] อมตะ"] = "https://pastebin.com/raw/EjrTrMwC",
        ["[+] คำสั่งแอดมิน"] = "https://pastebin.com/raw/3P1z104N",
        ["[+] คีย์บอร์ด"] = "https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt",
        ["[+] หายตัว"] = "https://pastebin.com/raw/3Rnd9rHf"
    },
    [" |  ปั่นประสาทผู้เล่น"] = {
        ["[+] หลุมดำ"] = "https://pastebin.com/raw/pkZnU5P5",
        ["[+] 18+"] = "https://pastefy.app/wa3v2Vgm/raw",
        ["[+] ดีดกระเด็น"] = "https://pastebin.com/raw/TXMNj1yy",
        ["[+] ดึงคน false"] = "https://pastebin.com/raw/CuDBzSm6",
        ["[+] เสก AK47ได้บางเเมพ"] = "https://pastebin.com/raw/wgqMHz9V"
    }
}

local orderedCategories = {
    "⚔️ | การโจมตี",
    " |  ESP & การมองเห็น",
    "⚡ | การเคลื่อนที่",
    "⚒️ | เครื่องมือช่วยเล่น",
    " |  ปั่นประสาทผู้เล่น"
}

local yOffset = 0
for _, category in ipairs(orderedCategories) do
    local scripts = functionCategories[category]

    local categoryLabel = Instance.new("TextLabel")
    categoryLabel.Parent = FunctionButtonsFrame
    categoryLabel.BackgroundTransparency = 1
    categoryLabel.Size = UDim2.new(1, -20, 0, 25)
    categoryLabel.Position = UDim2.new(0, 10, 0, yOffset)
    categoryLabel.Font = Enum.Font.GothamBold
    categoryLabel.TextSize = 16
    categoryLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    categoryLabel.Text = category
    categoryLabel.TextXAlignment = Enum.TextXAlignment.Left

    yOffset = yOffset + 30

    for name, url in pairs(scripts) do
        local button = Instance.new("TextButton")
        button.Parent = FunctionButtonsFrame
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Size = UDim2.new(1, -20, 0, 35)
        button.Position = UDim2.new(0, 10, 0, yOffset)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 14
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Text = name

        local corner = Instance.new("UICorner", button)
        corner.CornerRadius = UDim.new(0, 8)

        button.MouseButton1Click:Connect(function()
            local success, result = pcall(function()
                return game:HttpGet(url, true)
            end)
            if success then
                local loadSuccess, loadResult = pcall(function()
                    loadstring(result)()
                end)
                if not loadSuccess then
                    warn("Error loading script: " .. loadResult)
                end
            else
                warn("Error fetching script: " .. result)
            end
        end)

        yOffset = yOffset + 40
    end
end
FunctionButtonsFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)

local ToggleFrame = Instance.new("Frame")
ToggleFrame.Parent = ScreenGui
ToggleFrame.Size = UDim2.new(0, 50, 0, 50)
ToggleFrame.Position = UDim2.new(0, 10, 0, 10)
ToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleFrame.Active = true
ToggleFrame.Draggable = true

local UICorner_Toggle = Instance.new("UICorner", ToggleFrame)
UICorner_Toggle.CornerRadius = UDim.new(1, 0)

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ToggleFrame
ToggleButton.Size = UDim2.new(1, 0, 1, 0)
ToggleButton.BackgroundTransparency = 1
ToggleButton.Text = "👽"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 20
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
