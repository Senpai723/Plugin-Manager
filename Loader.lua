local LoaderData = {}

-- ==========================================================
-- 🛠️ GUDANG MASTER DATA (SEMUA FITUR ADA DI SINI)
-- ==========================================================
local SharedFeatures = {
    InteractableITP = {
        Name = "Interactable / ITP",
        Desc = "Memunculkan ESP Objek berdasarkan Promot, Touch, Click, Pintu atau Trigger",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/Interactable",
        SubFeatures = {
            { Name = "ITP", Desc = "Memunculkan window berisikan list objek yang bisa diteleport", Cmd = "itp", UnCmd = "" },
            { Name = "PPESP", Desc = "Masukan 1 nama objek untuk filter, kosongkan kolom untuk mendeteksi semua Objek", Cmd = "proximityesp", UnCmd = "unproximityesp", NeedInput = true },
            { Name = "CDESP", Desc = "Masukan 1 nama objek untuk filter, kosongkan kolom untuk mendeteksi semua Objek", Cmd = "clickdetectoresp", UnCmd = "unclickdetectoresp", NeedInput = true },
            { Name = "DESP", Desc = "Masukan 1 nama objek untuk filter, kosongkan kolom untuk mendeteksi semua Objek", Cmd = "dooresp", UnCmd = "undooresp", NeedInput = true },
            { Name = "ITESP", Desc = "Masukan 1 nama objek untuk filter, kosongkan kolom untuk mendeteksi semua Objek", Cmd = "itemtouchesp", UnCmd = "untouchinterestesp", NeedInput = true },
            { Name = "LOOT", Desc = "Memunculkan Box dan Nama ESP Item dengan interact Custom", Cmd = "loot", UnCmd = "unloot", NeedInput = true },
            { Name = "TESP", Desc = "Memunculkan ESP Trigger / Scene Event", Cmd = "touchinterestesp", UnCmd = "untouchinterestesp" }
        }
    },
    ColorESPPlayer = {
        Name = "ESP Player",
        Desc = "Player & Enemy ESP",
        RawUrl = "",
        SubFeatures = {
            { Name = "PESP", Desc = "Menampilkan ESP Body dan mama Player", Cmd = "pesp", UnCmd = "unloadColorESP", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/colorESP" },
            { Name = "EESP", Desc = "Menampilkan ESP Musuh dan NPC", Cmd = "eesp", UnCmd = "unloadColorESP", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/colorESP" }
        }
    },
    WaypointTeleport = {
        Name = "Teleport",
        Desc = "Waypoint & Teleport",
        RawUrl = "",
        SubFeatures = {
            { Name = "Radar Checkpoint", Desc = "Menampilkan Checkpoint yang belum di sentuh", Cmd = "scp", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/Waypoint" },
            { Name = "CP & Waypoint", Desc = "Menampilkan Checkpoint atau Waypoint", Cmd = "cpn", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/Waypoint" },
            { Name = "Teleport to Player", Desc = "Teleport ke player dengan 1 klik", Cmd = "tp", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/PlayerTeleport" }
        }
    },
    SoundAndView = {
        Name = "Sound & View Manage",
        Desc = "Mengatur suara di map dan memutar Lagu",
        RawUrl = "",
        SubFeatures = {
            { Name = "Spectator", Desc = "Menonton dan menguping target dari jauh", Cmd = "spectate", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/SoundandView" },
            { Name = "Mute Sound", Desc = "Membisukan suara Latar Belakang Map", Cmd = "mutesound", UnCmd = "unmutesound", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/SoundandView" },
            { Name = "Play Music", Desc = "Mendengarkan musik", Cmd = "playmusic", UnCmd = "stopmusic", NeedInput = true, RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/MusicTimeML" }
        }
    },
    FunExtra = {
        Name = "FUN",
        Desc = "Fitur Tambahan",
        RawUrl = "",
        SubFeatures = {
            { Name = "Teleport to Item", Desc = "Teleport Ke item yang di pilih dan kembali ketitik awal", Cmd = "rgrab", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/TPitem", UpdateTimestamp = "061120260923, 43200", BadgeText = "Update!", BadgeColor = "pink" },
            { Name = "Inpector", Desc = "Menemukan sebuah jalur path parent-child sebuah Part", Cmd = "mobileinspector", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/clickinspector", UpdateTimestamp = "061120260938, 43200", BadgeText = "Update!", BadgeColor = "white" },
            { Name = "Anti AFK", Desc = "Membuat karakter tidak terpental saat Afk 20 menit di Map", Cmd = "antiafk", UnCmd = "unantiafk", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/AntiAFK" },
        }
    },
    RejoinManager = {
        Name = "REJOIN ( Public Server )",
        Desc = "Rejoin Manage ( Tidak Support Game CO - OP )",
        RawUrl = "",
        SubFeatures = {
            { Name = "Auto Save", Desc = "Auto save Place ID dan Job ID ketika berpindah tempat", Cmd = "autosaveserver", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/LastRejoin" },
            { Name = "Save Server", Desc = "Menyimpan Place ID dan Job ID secara manual", Cmd = "saveserver", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/LastRejoin" },
            { Name = "Last Rejoin", Desc = "Aktifkan untik Rejoin di server terakhir", Cmd = "rejoinlast", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/LastRejoin" },
            { Name = "Smart Rejoin", Desc = "Aktifkan untuk Rejoin ketika diconnect secara Real Time", Cmd = "smartrj", UnCmd = "smartrj", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/SmartRejoin" }
        }
    },
    SimpleAimbot = {
        Name = "Simple Aimbot",
        Desc = "Aimbot Untuk Map yang mempunyai fitur Shooter",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/SimpleAimbot",
        SubFeatures = {
            { Name = "Aimbot", Desc = "Mengaktifkan/Menonaktifkan Aimbot", Cmd = "startaimbot", UnCmd = "stopaimbot" },
            { Name = "Set Radius", Desc = "Menentukan Radius Aimbot", Cmd = "setradius", UnCmd = "", NeedInput = true }
        }
    },
    F1Lock = {
        Name = "F1Lock ( Khusus Keyboard )",
        Desc = "Mengubah Shift Lock ke F1",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/F1Lock",
        SubFeatures = {
            { Name = "F1LOCK", Desc = "Bind Shift Lock to F1", Cmd = "f1lock", UnCmd = "unlockedcam" }
        }
    },
    FullBright = {
        Name = "Full Bright",
        Desc = "Membuat game menjadi terang, sudah termasuk anti kabut dan shadow",
        Cmd = "fullbright",
        UnCmd = "fullbright",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/Fullbright"
    },
    InstantPrompts = {
        Name = "Instant Prompts",
        Desc = "Always instant interaction",
        Cmd = "instantprompts",
        UnCmd = "uninstantprompts",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/InstanPrompt"
    },
    WalkSpeed = {
        Name = "Walk Speed",
        Desc = "Masukan angka speed yang kami mau, misal 20 ( tergantung map )",
        Cmd = "ws",
        UnCmd = "unws",
        NeedInput = true,
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/WalkSpeed"
    },
    InfiniteJump = {
        Name = "Infinite Jump",
        Desc = "Melompat tanpa batas dan Melampauinyaaaa...",
        Cmd = "infjump",
        UnCmd = "uninfjump",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/InfiniteJump"
    },
    AdminDetect = {
        Name = "Admin Detect",
        Desc = "Mendeteksi Owner dan Admin, tunggu beberapa detik setelah Execute",
        Cmd = "cad",
        UnCmd = "",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/AdminDetect",
        UpdateTimestamp = "",
        BadgeText = "Update!",
        BadgeColor = "yellow"
    },
    Noclip = {
        Name = "Noclip",
        Desc = "Menembus Objek yang ada di depan, tapi agak lebih pinter dikit",
        Cmd = "noclip",
        UnCmd = "unnoclip",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/Noclip"
    },
    CodeFinder = {
        Name = "Code Finder",
        Desc = "Menemukan Code angka dan Huruf",
        Cmd = "code",
        UnCmd = "",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/CodeFinder"
    },
    AntiEffectGroup = {
        Name = "Effect",
        Desc = "Menghentikan Effect dan Part yang bandel",
        RawUrl = "",
        SubFeatures = {
            { Name = "Anchor ( Hanya Visual )", Desc = "Untuk menghentikan Part yang bergoyang", Cmd = "anchor", UnCmd = "unanchor", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/AntiEffect" },
            { Name = "Anti Shake", Desc = "Untuk menghentikan Kamera yang bergoyang", Cmd = "antishake", UnCmd = "unshake", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/AntiEffect" },
            { Name = "Anti Wind ( Client Side )", Desc = "Untuk menghentikan Angin yang menggeser karakter", Cmd = "antiwind", UnCmd = "unwind", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/AntiEffect" },
            { Name = "Anti Trigger", Desc = "Untuk mematikan Trigger dalam map", Cmd = "antitrigger", UnCmd = "untrigger", RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Tools/AntiEffect" }
        }
    },
    MuteSoundSimple = {
        Name = "Mute Sound",
        Desc = "Mematikan suara latar belakang Map",
        Cmd = "mutesound",
        UnCmd = "unmutesound",
        RawUrl = "https://raw.githubusercontent.com/Tryofp/Plugin-Manager/refs/heads/main/Plugin/SoundManage"
    }
}

-- ==========================================================
-- 📂 STRUKTUR TAB (TINGGAL PANGGIL VARIABEL MASTER)
-- ==========================================================
LoaderData.Tabs = {
    { Name = "Main", DataKey = "Main" },
    { Name = "Tools", DataKey = "Tools" },
    { Name = "Horor", DataKey = "Horor" },
    { Name = "Gunung", DataKey = "Gunung" },
    { 
        Name = "", 
        DataKey = "",
        TabUpdateTimestamp = "061120260300, 172800",
        TabBadgeText = "HOT",
        TabBadgeColor = "green"
    }
}

LoaderData.Main = {
    SharedFeatures.InteractableITP,
    SharedFeatures.ColorESPPlayer,
    SharedFeatures.WaypointTeleport,
    SharedFeatures.SoundAndView,
    SharedFeatures.FunExtra,
    SharedFeatures.RejoinManager,
    SharedFeatures.SimpleAimbot,
    SharedFeatures.F1Lock
}

LoaderData.Tools = {
    SharedFeatures.FullBright,
    SharedFeatures.InstantPrompts,
    SharedFeatures.WalkSpeed,
    SharedFeatures.InfiniteJump,
    SharedFeatures.AdminDetect,
    SharedFeatures.Noclip,
    SharedFeatures.CodeFinder,
    SharedFeatures.AntiEffectGroup
}

LoaderData.Horor = {
    SharedFeatures.InteractableITP,
    SharedFeatures.ColorESPPlayer,
    SharedFeatures.FullBright,
    SharedFeatures.InstantPrompts,
    SharedFeatures.MuteSoundSimple,
    SharedFeatures.WalkSpeed,
    SharedFeatures.Noclip,
    SharedFeatures.CodeFinder
}

LoaderData.Gunung = {
    SharedFeatures.WaypointTeleport,
    SharedFeatures.SoundAndView,
    SharedFeatures.ColorESPPlayer,
    SharedFeatures.WalkSpeed,
    SharedFeatures.InfiniteJump
}

return LoaderData
