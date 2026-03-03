local lp = game:GetService("Players").LocalPlayer
local mouse = lp:GetMouse()
local uis = game:GetService("UserInputService")
local run = game:GetService("RunService")

local camera = workspace.CurrentCamera
local speed = 1 
local flying = false

-- botão simples na tela para ligar/desligar
local screenGui = Instance.new("ScreenGui", game.CoreGui)
local button = Instance.new("TextButton", screenGui)
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.5, -50, 0, 10)
button.Text = "Freecam: OFF"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

button.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        button.Text = "Freecam: ON"
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        camera.CameraType = Enum.CameraType.Scriptable
    else
        button.Text = "Freecam: OFF"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        camera.CameraType = Enum.CameraType.Custom
    end
end)

run.RenderStepped:Connect(function()
    if flying then
        local lookVector = camera.CFrame.LookVector
        -- valores de movimento automático
        camera.CFrame = camera.CFrame * CFrame.new(0, 0, -speed) 
    end
end)
-- codigo pra rodar esse script: loadstring(game:HttpGet("https://raw.githubusercontent.com/usoparacetamol/scripts-delta-luau/refs/heads/main/freecam.luau"))()
