-- โค้ดฝั่ง Client (LocalScript) ใส่ไว้ใน StarterPlayerScripts หรือ StarterGui
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- สร้าง ScreenGui สำหรับ Jumpscare
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpscareGui"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- สร้าง ImageLabel สำหรับรูปหน้าผี
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "ScareImage"
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://1474959146" -- ภาพหน้าผี
imageLabel.Visible = false
imageLabel.Parent = screenGui

-- สร้าง Sound สำหรับเสียงกรี๊ด
local sound = Instance.new("Sound")
sound.Name = "ScareSound"
sound.SoundId = "rbxassetid://9114251202" -- เสียงสยองขวัญ
sound.Volume = 5
sound.Parent = screenGui

-- ฟังก์ชันสำหรับสั่งการ Jumpscare
local function triggerJumpscare()
    if imageLabel.Visible then return end
    
    imageLabel.Visible = true
    sound:Play()
    
    task.wait(1.5) -- ระยะเวลาแสดงผล (วินาที)
    
    imageLabel.Visible = false
    screenGui:Destroy()
end

-- ตัวอย่างการเชื่อมโยงกับ Part (Trigger ใน Workspace)
local triggerPart = Workspace:WaitForChild("JumpscareTrigger", 10)

if triggerPart then
    triggerPart.Touched:Connect(function(hit)
        local character = hit.Parent
        if character and character:FindFirstChild("Humanoid") then
            local hitPlayer = Players:GetPlayerFromCharacter(character)
            if hitPlayer == player then
                triggerPart:Destroy() -- ลบ Part ทิ้งเพื่อให้ทำงานครั้งเดียว
                triggerJumpscare()
            end
        end
    end)
end
