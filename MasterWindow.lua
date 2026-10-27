return function(speaker)
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    if not _G.MasterPluginHub_States then
        _G.MasterPluginHub_States = {}
    end
    local featureStates = _G.MasterPluginHub_States
    
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

    warn("[MasterWindow] Memulai pembuatan window Universal & Fleksibel...")

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

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 280, 0, 340)
    Frame.Position = UDim2.new(0.5, -140, 0.5, -170)
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

    -- Tab Bar (UTAMA & OTHER)
    local TabBar = Instance.new("Frame")
    TabBar.Size = UDim2.new(1, -12, 0, 26)
    TabBar.Position = UDim2.new(0, 6, 0, 36)
    TabBar.BackgroundTransparency = 1
    TabBar.Parent = Frame

    local TabMainBtn = Instance.new("TextButton")
    TabMainBtn.Size = UDim2.new(0.5, -3, 1, 0)
    TabMainBtn.Position = UDim2.new(0, 0, 0, 0)
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
    TabMainBtn.BorderSizePixel = 0
    TabMainBtn.Font = Enum.Font.GothamBold
    TabMainBtn.Text = "Main"
    TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabMainBtn.TextSize = 10
    TabMainBtn.Parent = TabBar
    Instance.new("UICorner", TabMainBtn).CornerRadius = UDim.new(0, 4)

    local TabOtherBtn = Instance.new("TextButton")
    TabOtherBtn.Size = UDim2.new(0.5, -3, 1, 0)
    TabOtherBtn.Position = UDim2.new(0.5, 3, 0, 0)
    TabOtherBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    TabOtherBtn.BorderSizePixel = 0
    TabOtherBtn.Font = Enum.Font.GothamBold
    TabOtherBtn.Text = "Tools"
    TabOtherBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabOtherBtn.TextSize = 10
    TabOtherBtn.Parent = TabBar
    Instance.new("UICorner", TabOtherBtn).CornerRadius = UDim.new(0, 4)

    local ContentArea = Instance.new("Frame")
    ContentArea.Size = UDim2.new(1, -12, 1, -70)
    ContentArea.Position = UDim2.new(0, 6, 0, 66)
    ContentArea.BackgroundTransparency = 1
    ContentArea.BorderSizePixel = 0
    ContentArea.Parent = Frame

    -- Scroll Area Tab Utama
    local MainScrollingFrame = Instance.new("ScrollingFrame")
    MainScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    MainScrollingFrame.BackgroundTransparency = 1
    MainScrollingFrame.BorderSizePixel = 0
    MainScrollingFrame.ScrollBarThickness = 4
    MainScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    MainScrollingFrame.Parent = ContentArea

    local MainLayout = Instance.new("UIListLayout")
    MainLayout.SortOrder = Enum.SortOrder.LayoutOrder
    MainLayout.Padding = UDim.new(0, 5)
    MainLayout.Parent = MainScrollingFrame

    local SubMenuContainer = Instance.new("Frame")
    SubMenuContainer.Size = UDim2.new(1, 0, 1, 0)
    SubMenuContainer.BackgroundTransparency = 1
    SubMenuContainer.BorderSizePixel = 0
    SubMenuContainer.Visible = false
    SubMenuContainer.Parent = ContentArea

    -- Scroll Area Tab Other
    local OtherScrollingFrame = Instance.new("ScrollingFrame")
    OtherScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    OtherScrollingFrame.BackgroundTransparency = 1
    OtherScrollingFrame.BorderSizePixel = 0
    OtherScrollingFrame.ScrollBarThickness = 4
    OtherScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    OtherScrollingFrame.Visible = false
    OtherScrollingFrame.Parent = ContentArea

    local OtherLayout = Instance.new("UIListLayout")
    OtherLayout.SortOrder = Enum.SortOrder.LayoutOrder
    OtherLayout.Padding = UDim.new(0, 5)
    OtherLayout.Parent = OtherScrollingFrame

    local isCurrentlyInSubMenu = false
    local currentActiveScroll = MainScrollingFrame

    TabMainBtn.MouseButton1Click:Connect(function()
        TabMainBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
        TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabOtherBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
        TabOtherBtn.TextColor3 = Color3.fromRGB(200, 200, 200)

        OtherScrollingFrame.Visible = false
        if isCurrentlyInSubMenu then
            SubMenuContainer.Visible = true
            MainScrollingFrame.Visible = false
        else
            SubMenuContainer.Visible = false
            MainScrollingFrame.Visible = true
        end
        currentActiveScroll = MainScrollingFrame
    end)

    TabOtherBtn.MouseButton1Click:Connect(function()
        TabOtherBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
        TabOtherBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabMainBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
        TabMainBtn.TextColor3 = Color3.fromRGB(200, 200, 200)

        MainScrollingFrame.Visible = false
        SubMenuContainer.Visible = false
        OtherScrollingFrame.Visible = true
        currentActiveScroll = OtherScrollingFrame
    end)

    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Frame.Size = UDim2.new(0, 280, 0, 30)
            MinBtn.Text = "+"
            TabBar.Visible = false
            ContentArea.Visible = false
        else
            Frame.Size = UDim2.new(0, 280, 0, 340)
            MinBtn.Text = "-"
            TabBar.Visible = true
            ContentArea.Visible = true
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
        TextBox.PlaceholderText = "Baca Deskripsi..."
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
        MainScrollingFrame.Visible = false
        OtherScrollingFrame.Visible = false

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
            currentActiveScroll.Visible = true
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
                local function runCommand(customArgs, isUnexec)
                    pcall(function()
                        local targetRaw = (subFeat.RawUrl and subFeat.RawUrl ~= "") and subFeat.RawUrl or rawUrl

                        if not loadedModules[targetRaw] then
                            loadedModules[targetRaw] = loadstring(game:HttpGet(targetRaw))()
                        end
                        local pluginMod = loadedModules[targetRaw]
                        if pluginMod and pluginMod.Commands then
                            local targetCmd = isUnexec and subFeat.UnCmd or subFeat.Cmd

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

                local isCurrentlyActive = featureStates[subFeat.Name]
                if isCurrentlyActive then
                    runCommand({}, true)
                else
                    if subFeat.NeedInput then
                        showInputDialog(subFeat.Name, function(typedText)
                            local argsTable = {}
                            for word in string.gmatch(typedText, "%S+") do
                                table.insert(argsTable, word)
                            end
                            runCommand(argsTable, false)
                        end)
                    else
                        runCommand({}, false)
                    end
                end
            end)
        end
        SubScroll.CanvasSize = UDim2.new(0, 0, 0, #subFeatures * 57)
    end

    -- FUNGSI UNIVERSAL UNTUK RENDER MENU (BISA PAKAI SUB / LANGSUNG EXECUTE)
    local function renderMenuCategory(menuList, targetParentScroll)
        if not menuList then return end

        for _, item in ipairs(menuList) do
            local ItemFrame = Instance.new("Frame")
            ItemFrame.Size = UDim2.new(1, 0, 0, 52)
            ItemFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            ItemFrame.BorderSizePixel = 0
            ItemFrame.Parent = targetParentScroll

            Instance.new("UICorner", ItemFrame).CornerRadius = UDim.new(0, 4)

            local NameLabel = Instance.new("TextLabel")
            NameLabel.Size = UDim2.new(1, -90, 0, 18)
            NameLabel.Position = UDim2.new(0, 8, 0, 4)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = item.Name
            NameLabel.TextColor3 = Color3.fromRGB(0, 220, 255)
            NameLabel.Font = Enum.Font.GothamBold
            NameLabel.TextSize = 11
            NameLabel.TextXAlignment = Enum.TextXAlignment.Left
            NameLabel.Parent = ItemFrame

            local DescLabel = Instance.new("TextLabel")
            DescLabel.Size = UDim2.new(1, -90, 0, 26)
            DescLabel.Position = UDim2.new(0, 8, 0, 22)
            DescLabel.BackgroundTransparency = 1
            DescLabel.Text = item.Desc
            DescLabel.TextColor3 = Color3.fromRGB(160, 160, 165)
            DescLabel.Font = Enum.Font.Gotham
            DescLabel.TextSize = 10
            DescLabel.TextXAlignment = Enum.TextXAlignment.Left
            DescLabel.TextYAlignment = Enum.TextYAlignment.Top
            DescLabel.TextWrapped = true
            DescLabel.Parent = ItemFrame

            -- JIKA PUNYA SUB-FEATURES (MUNCULKAN TOMBOL OPEN)
            if item.SubFeatures and #item.SubFeatures > 0 then
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
                    showSubMenu(item.Name, item.RawUrl, item.SubFeatures)
                end)
            else
                -- JIKA TIDAK PUNYA SUB-FEATURES (LANGSUNG MUNCULKAN EXECUTE / UNEXECUTE)
                if featureStates[item.Name] == nil then featureStates[item.Name] = false end

                local ExecBtn = Instance.new("TextButton")
                ExecBtn.Size = UDim2.new(0, 75, 0, 24)
                ExecBtn.Position = UDim2.new(1, -80, 0, 14)
                ExecBtn.BackgroundColor3 = featureStates[item.Name] and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(0, 150, 90)
                ExecBtn.BorderSizePixel = 0
                ExecBtn.Text = featureStates[item.Name] and "UNEXECUTE" or "EXECUTE"
                ExecBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                ExecBtn.Font = Enum.Font.GothamBold
                ExecBtn.TextSize = 10
                ExecBtn.Parent = ItemFrame
                Instance.new("UICorner", ExecBtn).CornerRadius = UDim.new(0, 4)

                local hasUnCmd = item.UnCmd and item.UnCmd ~= ""
                if not hasUnCmd then
                    ExecBtn.Text = "EXECUTE"
                    ExecBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
                end

                ExecBtn.MouseButton1Click:Connect(function()
                    local function runDirectCommand(customArgs, isUnexec)
                        pcall(function()
                            if not loadedModules[item.RawUrl] then
                                loadedModules[item.RawUrl] = loadstring(game:HttpGet(item.RawUrl))()
                            end
                            local pluginMod = loadedModules[item.RawUrl]
                            if pluginMod and pluginMod.Commands then
                                local targetCmd = isUnexec and item.UnCmd or item.Cmd
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
                            featureStates[item.Name] = not featureStates[item.Name]
                            if featureStates[item.Name] then
                                ExecBtn.Text = "UNEXECUTE"
                                ExecBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                            else
                                ExecBtn.Text = "EXECUTE"
                                ExecBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
                            end
                        else
                            ExecBtn.Text = "EXECUTE"
                            ExecBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
                        end
                    end

                    local isCurrentlyActive = featureStates[item.Name]
                    if isCurrentlyActive then
                        runDirectCommand({}, true)
                    else
                        if item.NeedInput then
                            showInputDialog(item.Name, function(typedText)
                                local argsTable = {}
                                for word in string.gmatch(typedText, "%S+") do
                                    table.insert(argsTable, word)
                                end
                                runDirectCommand(argsTable, false)
                            end)
                        else
                            runDirectCommand({}, false)
                        end
                    end
                end)
            end
        end
        targetParentScroll.CanvasSize = UDim2.new(0, 0, 0, #menuList * 57)
    end

    -- EKSEKUSI FETCH LOADER.LUA
    local configOk, configErr = xpcall(function()
        local configUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Loader.lua"
        local source = game:HttpGet(configUrl)
        local chunk = loadstring(source)
        local data = chunk()

        if data.Main then
            renderMenuCategory(data.Main, MainScrollingFrame)
        end

        if data.Tools then
            renderMenuCategory(data.Tools, OtherScrollingFrame)
        end
    end, function(e)
        return (debug and debug.traceback and debug.traceback(tostring(e), 2)) or tostring(e)
    end)

    if not configOk then
        warn("[MasterWindow] GAGAL memuat Loader.lua: " .. tostring(configErr))
    end

    warn("[MasterWindow] Proses pembuatan window selesai.")
end
