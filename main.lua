-- [[ 109er_0 Hub - GitHub Version ]] --

local MyExPlus = {}

function MyExPlus.Player(target)
    -- التحقق من الهوية
    if target ~= "109er_0" then 
        warn("🚫 Unauthorized User")
        return 
    end

    print("🚀 [GitHub Loader]: Starting UI...")

    local function _Run_Main_Hub()
        -- استدعاء مكتبة Rayfield
        local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
        
        local Window = Rayfield:CreateWindow({
           Name = "🔥 Server Control - 109er_0 🔥",
           LoadingTitle = "Accessing Server Core...",
           LoadingSubtitle = "By Mahdi Technical",
           ConfigurationSaving = { Enabled = false }
        })

        local Tab = Window:CreateTab("Main Control", 4483362458)

        local Config = {
            AssetID = "98381723384335", 
            MusicID = "100828050594137", 
            Message = "Team 109er_0 Join Today!!"
        }

        -- زر الموسيقى والرسائل
        Tab:CreateButton({
           Name = "🔊 Play Music & Show Message",
           Callback = function()
               local s = Instance.new("Sound", game.Workspace)
               s.SoundId = "rbxassetid://" .. Config.MusicID
               s.Volume = 10
               s.Looped = true
               s:Play()
               
               task.spawn(function()
                   while true do
                       local hint = Instance.new("Hint", game.Workspace)
                       hint.Text = "🔥 " .. Config.Message .. " 🔥"
                       task.wait(5)
                       hint:Destroy()
                       task.wait(0.5)
                   end
               end)
           end,
        })

        -- زر Chaos Mode للسماء والملصقات
        Tab:CreateButton({
           Name = "🌌 Chaos Mode (Sky & Decals)",
           Callback = function()
               local tex = "http://www.roblox.com/asset/?id=" .. Config.AssetID
               local lighting = game:GetService("Lighting")
               local sky = Instance.new("Sky", lighting)
               sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt, sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = tex, tex, tex, tex, tex, tex
               lighting.TimeOfDay = "00:00:00"
               
               for _, part in pairs(game.Workspace:GetDescendants()) do
                   if part:IsA("BasePart") then
                       local d = Instance.new("Decal", part)
                       d.Texture = tex
                       d.Face = Enum.NormalId.Top
                   end
               end
           end,
        })

        -- زر Physics Chaos (فك التثبيت)
        Tab:CreateButton({
           Name = "💥 Physics Chaos (Unanchor All)",
           Callback = function()
               for _, obj in pairs(game.Workspace:GetDescendants()) do
                   if obj:IsA("BasePart") then
                       pcall(function()
                           obj.Locked = false
                           obj.Anchored = false
                       end)
                   end
               end
           end,
        })
        
        print("✅ [MyExPlus]: Hub is Active!")
    end

    -- تشغيل الواجهة
    pcall(_Run_Main_Hub)
end

return MyExPlus
