local maxOrbitRadius = 20
local AttackTime = 2
local OrbitRadius = 2
local velocityMultiplier = 10
local RotateSpeed = 2
local OrbitSpeed = 1.5
function n(t, m, d)
    game:GetService("StarterGui"):SetCore(
        "SendNotification",
        {
            Title = t,
            Text = m,
            Duration = d
        }
    )
end
local a
local atest =
    pcall(
    function()
        a = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    end
)
if atest then
    local ogpos = a.CFrame
    local RunService = game:GetService("RunService")
    local walkflinging = false

    function walkfling()
        walkflinging = true
        repeat
            RunService.Heartbeat:Wait()
            local root = a
            local vel, movel = nil, 0.1

            vel = root.Velocity
            root.Velocity = vel * 1000000 + Vector3.new(0, 1000000, 0)

            RunService.RenderStepped:Wait()
            if character and character.Parent and root and root.Parent then
                root.Velocity = vel
            end

            RunService.Stepped:Wait()
            root.Velocity = vel + Vector3.new(0, movel, 0)
            movel = movel * -1
        until walkflinging == false
    end
    local Players = game:GetService("Players")
    local FLYING = false
    function fuckfly(vfly)
        local T = a
        local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local SPEED = 0

        local function FLY()
            FLYING = true
            local BG = Instance.new("BodyGyro")
            local BV = Instance.new("BodyVelocity")
            BG.P = 9e4
            BG.Parent = T
            BV.Parent = T
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BV.velocity = Vector3.new(0, 0, 0)
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
            task.spawn(
                function()
                    repeat
                        wait()
                        if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                            Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                        end
                        if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                            SPEED = 50
                        elseif
                            not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and
                                SPEED ~= 0
                         then
                            SPEED = 0
                        end
                        if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                            BV.velocity =
                                ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) +
                                ((workspace.CurrentCamera.CoordinateFrame *
                                    CFrame.new(
                                        CONTROL.L + CONTROL.R,
                                        (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,
                                        0
                                    ).p) -
                                    workspace.CurrentCamera.CoordinateFrame.p)) *
                                SPEED
                            lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                        elseif
                            (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and
                                (CONTROL.Q + CONTROL.E) == 0 and
                                SPEED ~= 0
                         then
                            BV.velocity =
                                ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) +
                                ((workspace.CurrentCamera.CoordinateFrame *
                                    CFrame.new(
                                        lCONTROL.L + lCONTROL.R,
                                        (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,
                                        0
                                    ).p) -
                                    workspace.CurrentCamera.CoordinateFrame.p)) *
                                SPEED
                        else
                            BV.velocity = Vector3.new(0, 0, 0)
                        end
                        BG.cframe = workspace.CurrentCamera.CoordinateFrame
                    until not FLYING
                    CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                    lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                    SPEED = 0
                    BG:Destroy()
                    BV:Destroy()
                    task.wait(1)
                    Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
            )
        end
        FLY()
    end

    n("NIGGABLING TECHNOLOGIES", "RAPING NIGGERS", 5)
    fuckfly()
    task.spawn(walkfling)
    local b = game.Players.LocalPlayer.Character.HumanoidRootPart
    local c = true
    local f = false
    local x = 0
    local lastPosition = b.Position
    task.spawn(
        function()
            while task.wait() and c do
                if a:IsDescendantOf(workspace) and a.Parent.Humanoid.Health > 0 then
                    local currentPosition = b.Position
					local calc1 = Vector3.new(currentPosition.X,0,currentPosition.Z)
					local calc2 = Vector3.new(lastPosition.X,0,lastPosition.Z)
                    local velocity = (calc1 - calc2).Magnitude
                    local adjustedOrbitRadius =
                        math.clamp(OrbitRadius + (velocity * velocityMultiplier), OrbitRadius, maxOrbitRadius)
                    local rotationAngle = CFrame.Angles(x, 0, 0)
                    local orbitOffset =
                        CFrame.new(math.cos(x*OrbitSpeed) * adjustedOrbitRadius, 0, math.sin(x*OrbitSpeed) * adjustedOrbitRadius)
                    a.CFrame = b.CFrame * orbitOffset * rotationAngle
                    x = x + 0.1
                    lastPosition = currentPosition
                else
                    c = false
                    f = true
                    n("NIGGABLING TECHNOLOGIES", "FUCK", 5)
                    walkflinging = false
                    FLYING = false
                end
            end
            if not f then
                n("NIGGABLING TECHNOLOGIES", "DONE", 5)
                Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                for i = 1, 10 do
                    a.CFrame = ogpos
                    task.wait(0.01)
                end
				c = false
    			walkflinging = false
    			FLYING = false
            end
        end
    )

    for i, v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer then
            pcall(
                function()
                    b = v.Character.HumanoidRootPart
                end
            )
            task.wait(AttackTime)
        end
    end
    c = false
    walkflinging = false
    FLYING = false
else
    n("NIGGABLING TECHNOLOGIES", "NIGGA???", 5)
end
