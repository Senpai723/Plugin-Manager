return {
    {
        Name = "Interactable / ITP",
        Desc = "Proximity, Door, Click, Touch & ITP",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Interactable",
        SubFeatures = {
            { Name = "PPESP", Desc = "Memunculkan Box dan Nama ESP Objek yang di Pencet/Tekan", Cmd = "proximityesp", UnCmd = "unproximityesp" },
            { Name = "ITP", Desc = "Memunculkan window berisikan list objek yang bisa diteleport", Cmd = "itp", UnCmd = "itp" },
            { Name = "CDESP", Desc = "Memunculkan Box dan Nama ESP Objek yang di Klik", Cmd = "clickdetectoresp", UnCmd = "unclickdetectoresp" },
            { Name = "DESP", Desc = "Memuncukkan ESP sebuah Pintu", Cmd = "dooresp", UnCmd = "undooresp" },
            { Name = "ITESP", Desc = "Memunculkan Box dan Nama ESP yang di sentuh", Cmd = "itemtouchesp", UnCmd = "untouchinterestesp" },
            { Name = "TESP", Desc = "Memunculkan ESP Trigger / Scene Event", Cmd = "touchinterestesp", UnCmd = "untouchinterestesp" }
        }
    },
    {
        Name = "Color ESP",
        Desc = "Player & Enemy ESP",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/colorESP",
        SubFeatures = {
            { Name = "PESP", Desc = "Player ESP (All Green)", Cmd = "pesp", UnCmd = "unloadColorESP" },
            { Name = "EESP", Desc = "Enemy / NPC ESP", Cmd = "eesp", UnCmd = "unloadColorESP" }
        }
    },
    {
        Name = "Instant Prompts",
        Desc = "Always instant interaction",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/InstanPrompt",
        SubFeatures = {
            { Name = "INSTANTPROMPTS", Desc = "Always Instant Proximity", Cmd = "instantprompts", UnCmd = "uninstantprompts" }
        }
    },
    {
        Name = "Streaming Radar",
        Desc = "Checkpoint & Waypoint Manager",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Waypoint",
        SubFeatures = {
            { Name = "SCP", Desc = "Streaming Radar Window", Cmd = "scp", UnCmd = "scp_close" },
            { Name = "CPN", Desc = "Waypoint/CP Manager Window", Cmd = "cpn", UnCmd = "cpn_close" }
        }
    },
    {
        Name = "F1Lock",
        Desc = "Camera Lock Keybind F1",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/F1Lock",
        SubFeatures = {
            { Name = "F1LOCK", Desc = "Bind Shift Lock to F1", Cmd = "f1lock", UnCmd = "unlockedcam" }
        }
    }
}
