return function(speaker)
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local featureStates = {}
    local loadedModules = {}

    local oldCore = CoreGui:FindFirstChild("MasterPluginHub")
    if oldCore then oldCore:Destroy() end

    local playerGui
    local playerGuiOk, playerGuiResult = pcall(function()
        return LocalPlayer:WaitForChild("PlayerGui", 10)
    end)
    if playerGuiOk then playerGui = playerGuiResult end

    if playerGui then
        local oldPlayer = playerGui:FindFirstChild("MasterPluginHub")
        if oldPlayer then oldPlayer:Destroy() end
    end

    warn("[MasterWindow] Memulai pembuatan window...")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MasterPluginHub"
    ScreenGui.ResetOnSpawn = false
    local parentOk, parentErr = pcall(function()
        ScreenGui.Parent = CoreGui
    end)

    if not parentOk or not ScreenGui.Parent then
        if not playerGui then
            playerGui = LocalPlayer:WaitForChild("PlayerGui")
        end
        ScreenGui.Parent = playerGui
    end

    if not ScreenGui.Parent then
        error("ScreenGui gagal dipasang ke CoreGui maupun PlayerGui.")
    end
    warn("[MasterWindow] ScreenGui berhasil dipasang ke " .. ScreenGui.Parent.Name)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 280, 0, 310)
    Frame.Position = UDim2.new(0.5, -140, 0.5, -155)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true
    Frame.Parent = ScreenGui

    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TopBar.BorderSizePixel = 0
    TopBar.ZIndex = 10
    TopBar.Parent = Frame

    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 6)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -70, 1, 0)
    TitleLabel.Position = UDim2.new(0, 8, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "PLUGIN MANAGER By Tryo"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 12
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 11
    TitleLabel.Parent = TopBar

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 20, 0, 20)
    CloseBtn.Position = UDim2.new(1, -25, 0, 5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 10
    CloseBtn.ZIndex = 11
    CloseBtn.Parent = TopBar
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 20, 0, 20)
    MinBtn.Position = UDim2.new(1, -50, 0, 5)
    MinBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    MinBtn.BorderSizePixel = 0
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinBtn.TextSize = 11
    MinBtn.ZIndex = 11
    MinBtn.Parent = TopBar
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 4)

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Size = UDim2.new(1, -12, 1, -40)
    ScrollingFrame.Position = UDim2.new(0, 6, 0, 36)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.ScrollBarThickness = 4
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.Parent = Frame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)
    UIListLayout.Parent = ScrollingFrame

    local SubMenuContainer = Instance.new("Frame")
    SubMenuContainer.Size = UDim2.new(1, -12, 1, -40)
    SubMenuContainer.Position = UDim2.new(0, 6, 0, 36)
    SubMenuContainer.BackgroundTransparency = 1
    SubMenuContainer.BorderSizePixel = 0
    SubMenuContainer.Visible = false
    SubMenuContainer.Parent = Frame

    local isCurrentlyInSubMenu = false

    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Frame.Size = UDim2.new(0, 280, 0, 30)
            MinBtn.Text = "+"
            ScrollingFrame.Visible = false
            SubMenuContainer.Visible = false
        else
            Frame.Size = UDim2.new(0, 280, 0, 310)
            MinBtn.Text = "-"
            if isCurrentlyInSubMenu then
                SubMenuContainer.Visible = true
                ScrollingFrame.Visible = false
            else
                SubMenuContainer.Visible = false
                ScrollingFrame.Visible = true
            end
        end
    end)

    local function showInputDialog(titleText, onSubmit)
        local PromptOverlay = Instance.new("Frame")
        PromptOverlay.Size = UDim2.new(1, 0, 1, 0)
        PromptOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        PromptOverlay.BackgroundTransparency = 0.5
        PromptOverlay.ZIndex = 50
        PromptOverlay.Parent = Frame

        local PromptBox = Instance.new("Frame")
        PromptBox.Size = UDim2.new(0, 220, 0, 110)
        PromptBox.Position = UDim2.new(0.5, -110, 0.5, -55)
        PromptBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
        PromptBox.BorderSizePixel = 0
        PromptBox.ZIndex = 51
        PromptBox.Parent = PromptOverlay
        Instance.new("UICorner", PromptBox).CornerRadius = UDim.new(0, 6)

        local PromptTitle = Instance.new("TextLabel")
        PromptTitle.Size = UDim2.new(1, 0, 0, 25)
        PromptTitle.Position = UDim2.new(0, 0, 0, 5)
        PromptTitle.BackgroundTransparency = 1
        PromptTitle.Font = Enum.Font.GothamBold
        PromptTitle.Text = "INPUT: " .. titleText
        PromptTitle.TextColor3 = Color3.fromRGB(0, 220, 255)
        PromptTitle.TextSize = 11
        PromptTitle.ZIndex = 52
        PromptTitle.Parent = PromptBox

        local TextBox = Instance.new("TextBox")
        TextBox.Size = UDim2.new(1, -20, 0, 30)
        TextBox.Position = UDim2.new(0, 10, 0, 35)
        TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.PlaceholderText = "Baca Deskripsi sebelum mengetik..."
        TextBox.Text = ""
        TextBox.Font = Enum.Font.Gotham
        TextBox.TextSize = 11
        TextBox.ZIndex = 52
        TextBox.Parent = PromptBox
        Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 4)

        local SubmitBtn = Instance.new("TextButton")
        SubmitBtn.Size = UDim2.new(0, 95, 0, 24)
        SubmitBtn.Position = UDim2.new(0, 10, 0, 75)
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
        SubmitBtn.Text = "SUBMIT"
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        SubmitBtn.Font = Enum.Font.GothamBold
        SubmitBtn.TextSize = 10
        SubmitBtn.ZIndex = 52
        SubmitBtn.Parent = PromptBox
        Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 4)

        local CancelBtn = Instance.new("TextButton")
        CancelBtn.Size = UDim2.new(0, 95, 0, 24)
        CancelBtn.Position = UDim2.new(1, -105, 0, 75)
        CancelBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        CancelBtn.Text = "CANCEL"
        CancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        CancelBtn.Font = Enum.Font.GothamBold
        CancelBtn.TextSize = 10
        CancelBtn.ZIndex = 52
        CancelBtn.Parent = PromptBox
        Instance.new("UICorner", CancelBtn).CornerRadius = UDim.new(0, 4)

        SubmitBtn.MouseButton1Click:Connect(function()
            local inputVal = TextBox.Text
            PromptOverlay:Destroy()
            if onSubmit then onSubmit(inputVal) end
        end)

        CancelBtn.MouseButton1Click:Connect(function()
            PromptOverlay:Destroy()
        end)
    end

    local function showSubMenu(menuTitle, rawUrl, subFeatures)
        isCurrentlyInSubMenu = true
        for _, child in ipairs(SubMenuContainer:GetChildren()) do
            child:Destroy()
        end
        SubMenuContainer.Visible = true
        ScrollingFrame.Visible = false

        local BackBtn = Instance.new("TextButton")
        BackBtn.Size = UDim2.new(1, 0, 0, 26)
        BackBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
        BackBtn.BorderSizePixel = 0
        BackBtn.Font = Enum.Font.GothamBold
        BackBtn.Text = "< BACK : " .. menuTitle
        BackBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
        BackBtn.TextSize = 10
        BackBtn.Parent = SubMenuContainer
        Instance.new("UICorner", BackBtn).CornerRadius = UDim.new(0, 4)

        local SubScroll = Instance.new("ScrollingFrame")
        SubScroll.Size = UDim2.new(1, 0, 1, -30)
        SubScroll.Position = UDim2.new(0, 0, 0, 30)
        SubScroll.BackgroundTransparency = 1
        SubScroll.BorderSizePixel = 0
        SubScroll.ScrollBarThickness = 4
        SubScroll.Parent = SubMenuContainer

        local SubLayout = Instance.new("UIListLayout")
        SubLayout.SortOrder = Enum.SortOrder.LayoutOrder
        SubLayout.Padding = UDim.new(0, 5)
        SubLayout.Parent = SubScroll

        BackBtn.MouseButton1Click:Connect(function()
            isCurrentlyInSubMenu = false
            SubMenuContainer.Visible = false
            ScrollingFrame.Visible = true
        end)

        for _, subFeat in ipairs(subFeatures) do
            if featureStates[subFeat.Name] == nil then featureStates[subFeat.Name] = false end

            local Item = Instance.new("Frame")
            Item.Size = UDim2.new(1, 0, 0, 52)
            Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Item.BorderSizePixel = 0
            Item.Parent = SubScroll

            Instance.new("UICorner", Item).CornerRadius = UDim.new(0, 4)

            local LblName = Instance.new("TextLabel")
            LblName.Size = UDim2.new(1, -90, 0, 18)
            LblName.Position = UDim2.new(0, 8, 0, 4)
            LblName.BackgroundTransparency = 1
            LblName.Text = subFeat.Name
            LblName.TextColor3 = Color3.fromRGB(0, 220, 255)
            LblName.Font = Enum.Font.GothamBold
            LblName.TextSize = 11
            LblName.TextXAlignment = Enum.TextXAlignment.Left
            LblName.Parent = Item

            local LblDesc = Instance.new("TextLabel")
            LblDesc.Size = UDim2.new(1, -90, 0, 26)
            LblDesc.Position = UDim2.new(0, 8, 0, 22)
            LblDesc.BackgroundTransparency = 1
            LblDesc.Text = subFeat.Desc
            LblDesc.TextColor3 = Color3.fromRGB(160, 160, 165)
            LblDesc.Font = Enum.Font.Gotham
            LblDesc.TextSize = 10
            LblDesc.TextXAlignment = Enum.TextXAlignment.Left
            LblDesc.TextYAlignment = Enum.TextYAlignment.Top
            LblDesc.TextWrapped = true
            LblDesc.Parent = Item

            local ExecSub = Instance.new("TextButton")
            ExecSub.Size = UDim2.new(0, 75, 0, 24)
            ExecSub.Position = UDim2.new(1, -80, 0, 14)
            ExecSub.BackgroundColor3 = featureStates[subFeat.Name] and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(0, 150, 90)
            ExecSub.BorderSizePixel = 0
            ExecSub.Text = featureStates[subFeat.Name] and "UNEXECUTE" or "EXECUTE"
            ExecSub.TextColor3 = Color3.fromRGB(255, 255, 255)
            ExecSub.Font = Enum.Font.GothamBold
            ExecSub.TextSize = 10
            ExecSub.Parent = Item

            Instance.new("UICorner", ExecSub).CornerRadius = UDim.new(0, 4)

            local hasUnCmd = subFeat.UnCmd and subFeat.UnCmd ~= ""
            if not hasUnCmd then
                ExecSub.Text = "EXECUTE"
                ExecSub.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
            end

            ExecSub.MouseButton1Click:Connect(function()
                local function runCommand(customArgs)
                    pcall(function()
                        if not loadedModules[rawUrl] then
                            loadedModules[rawUrl] = loadstring(game:HttpGet(rawUrl))()
                        end
                        local pluginMod = loadedModules[rawUrl]
                        if pluginMod and pluginMod.Commands then
                            local targetCmd = (hasUnCmd and featureStates[subFeat.Name]) and subFeat.UnCmd or subFeat.Cmd

                            local foundFunc = nil
                            for cmdName, cmdData in pairs(pluginMod.Commands) do
                                if string.lower(cmdName) == string.lower(tostring(targetCmd)) then
                                    if type(cmdData.Function) == "function" then
                                        foundFunc = cmdData.Function
                                        break
                                    end
                                end
                            end

                            if foundFunc then
                                local finalArgs = customArgs or {}
                                task.spawn(function() foundFunc(finalArgs, speaker) end)
                            end
                        end
                    end)

                    if hasUnCmd then
                        featureStates[subFeat.Name] = not featureStates[subFeat.Name]
                        if featureStates[subFeat.Name] then
                            ExecSub.Text = "UNEXECUTE"
                            ExecSub.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                        else
                            ExecSub.Text = "EXECUTE"
                            ExecSub.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
                        end
                    else
                        ExecSub.Text = "EXECUTE"
                        ExecSub.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
                    end
                end

                -- SYARAT PERBAIKAN: Jika butuh input DAN sedang aktif (mau unexecute), JANGAN munculkan kotak input!
                local isCurrentlyActive = featureStates[subFeat.Name]
                if subFeat.NeedInput and not isCurrentlyActive then
                    showInputDialog(subFeat.Name, function(typedText)
                        local argsTable = {}
                        for word in string.gmatch(typedText, "%S+") do
                            table.insert(argsTable, word)
                        end
                        runCommand(argsTable)
                    end)
                else
                    runCommand({})
                end
            end)
        end
        SubScroll.CanvasSize = UDim2.new(0, 0, 0, #subFeatures * 57)
    end

    local configOk, configErr = xpcall(function()
        local menuConfigUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Loader.lua"
        local downloadOk, menuSource = pcall(function()
            return game:HttpGet(menuConfigUrl)
        end)
        if not downloadOk then
            error("Gagal mengunduh Loader.lua dari branch main: " .. tostring(menuSource))
        end
        if type(menuSource) ~= "string" or menuSource == "" then
            error("Loader.lua kosong atau respons bukan teks.")
        end

        local compileOk, menuChunk = pcall(function()
            return loadstring(menuSource)
        end)
        if not compileOk or type(menuChunk) ~= "function" then
            error("Loader.lua gagal dikompilasi: " .. tostring(menuChunk))
        end

        local runOk, menuList = pcall(menuChunk)
        if not runOk then
            error("Loader.lua error saat dijalankan: " .. tostring(menuList))
        end
        if type(menuList) ~= "table" then
            error("Loader.lua harus mengembalikan table; tipe yang diterima: " .. type(menuList))
        end

        warn("[MasterWindow] Loader.lua berhasil dimuat; jumlah menu: " .. tostring(#menuList))
            for _, menu in ipairs(menuList) do
                local ItemFrame = Instance.new("Frame")
                ItemFrame.Size = UDim2.new(1, 0, 0, 52)
                ItemFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                ItemFrame.BorderSizePixel = 0
                ItemFrame.Parent = ScrollingFrame

                Instance.new("UICorner", ItemFrame).CornerRadius = UDim.new(0, 4)

                local NameLabel = Instance.new("TextLabel")
                NameLabel.Size = UDim2.new(1, -90, 0, 18)
                NameLabel.Position = UDim2.new(0, 8, 0, 4)
                NameLabel.BackgroundTransparency = 1
                NameLabel.Text = menu.Name
                NameLabel.TextColor3 = Color3.fromRGB(0, 220, 255)
                NameLabel.Font = Enum.Font.GothamBold
                NameLabel.TextSize = 11
                NameLabel.TextXAlignment = Enum.TextXAlignment.Left
                NameLabel.Parent = ItemFrame

                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -90, 0, 26)
                DescLabel.Position = UDim2.new(0, 8, 0, 22)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = menu.Desc
                DescLabel.TextColor3 = Color3.fromRGB(160, 160, 165)
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextSize = 10
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextYAlignment = Enum.TextYAlignment.Top
                DescLabel.TextWrapped = true
                DescLabel.Parent = ItemFrame

                local OpenBtn = Instance.new("TextButton")
                OpenBtn.Size = UDim2.new(0, 75, 0, 24)
                OpenBtn.Position = UDim2.new(1, -80, 0, 14)
                OpenBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 220)
                OpenBtn.BorderSizePixel = 0
                OpenBtn.Text = "OPEN"
                OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                OpenBtn.Font = Enum.Font.GothamBold
                OpenBtn.TextSize = 10
                OpenBtn.Parent = ItemFrame

                Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 4)

                OpenBtn.MouseButton1Click:Connect(function()
                    if menu.SubFeatures then
                        showSubMenu(menu.Name, menu.RawUrl, menu.SubFeatures)
                    end
                end)
            end
            ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #menuList * 57)
    end, function(e)
        return (debug and debug.traceback and debug.traceback(tostring(e), 2)) or tostring(e)
    end)

    if not configOk then
        warn("[MasterWindow] GAGAL memuat daftar menu: " .. tostring(configErr))
    end

    warn("[MasterWindow] Proses pembuatan window selesai.")
end
