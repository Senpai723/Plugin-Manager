return {
    Main = {
        {
            Name = "Interactable / ITP",
            Desc = "Proximity, Door, Click, Touch & ITP",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Interactable",
            SubFeatures = {
                { Name = "ITP", Desc = "Memunculkan window berisikan list objek yang bisa diteleport", Cmd = "itp", UnCmd = "itp" },
                { Name = "PPESP", Desc = "Memunculkan Box dan Nama ESP Objek yang di Pencet/Tekan", Cmd = "proximityesp", UnCmd = "unproximityesp" },
                { Name = "CDESP", Desc = "Memunculkan Box dan Nama ESP Objek yang di Klik", Cmd = "clickdetectoresp", UnCmd = "unclickdetectoresp" },
                { Name = "DESP", Desc = "Memuncukkan ESP sebuah Pintu", Cmd = "dooresp", UnCmd = "undooresp" },
                { Name = "ITESP", Desc = "Memunculkan Box dan Nama ESP yang di sentuh", Cmd = "itemtouchesp", UnCmd = "untouchinterestesp" },
                { Name = "TESP", Desc = "Memunculkan ESP Trigger / Scene Event", Cmd = "touchinterestesp", UnCmd = "untouchinterestesp" }
            }
        },
        {
            Name = "ESP Player",
            Desc = "Player & Enemy ESP",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/colorESP",
            SubFeatures = {
                { Name = "PESP", Desc = "Menampilkan ESP Body dan mama Player", Cmd = "pesp", UnCmd = "unloadColorESP" },
                { Name = "EESP", Desc = "Menampilkan ESP Musuh dan NPC", Cmd = "eesp", UnCmd = "unloadColorESP" }
            }
        },
        {
            Name = "Teleport",
            Desc = "Waypoint & Teleport",
            RawUrl = "",
            SubFeatures = {
                { Name = "Radar Checkpoint", Desc = "Menampilkan Checkpoint yang belum di sentuh", Cmd = "scp", UnCmd = "scp_close", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Waypoint" },
                { Name = "CP & Waypoint", Desc = "Menampilkan Checkpoint atau Waypoint", Cmd = "cpn", UnCmd = "cpn_close", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Waypoint" },
                { Name = "Teleport to Player", Desc = "Teleport ke player dengan 1 klik", Cmd = "tp", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/PlayerTeleport" }
            }
        },
        {
            Name = "Sound Manage",
            Desc = "Mengatur suara di map dan memutar Lagu",
            RawUrl = "",
            SubFeatures = {
                { Name = "Voice Spy", Desc = "Menguping Voice Chat Target", Cmd = "voicespy", UnCmd = "unvoicespy", NeedInput = true, RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/SoundManage" },
                { Name = "Mute Sound", Desc = "Membisukan suara Latar Belakang Map", Cmd = "mutesound", UnCmd = "unmutesound", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/SoundManage" },
                { Name = "Play Music", Desc = "Mendengarkan musik", Cmd = "playmusic", UnCmd = "stopmusic", NeedInput = true, RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/MusicTimeML" }
            }
        },
        {
            Name = "REJOIN ( Public Server )",
            Desc = "Rejoin Manage ( Tidak Support Game CO - OP )",
            RawUrl = "",
            SubFeatures = {
                { Name = "Auto Save", Desc = "Auto save Place ID dan Job ID ketika berpindah tempat", Cmd = "autosaveserver", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/LastRejoin" },
                { Name = "Save Server", Desc = "Menyimpan Place ID dan Job ID secara manual", Cmd = "saveserver", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/LastRejoin" },
                { Name = "Last Rejoin", Desc = "Aktifkan untik Rejoin di server terakhir", Cmd = "rejoinlast", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/LastRejoin" },
                { Name = "Smart Rejoin", Desc = "Aktifkan untuk Rejoin ketika diconnect secara Real Time", Cmd = "smartrj", UnCmd = "smartrj", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/SmartRejoin" }
            }
        },
        {
            Name = "Simple Aimbot",
            Desc = "Aimbot Untuk Map yang mempunyai fitur Shooter",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/SimpleAimbot",
            SubFeatures = {
                { Name = "Aimbot", Desc = "Mengaktifkan/Menonaktifkan Aimbot", Cmd = "startaimbot", UnCmd = "stopaimbot" },
                { Name = "Set Radius", Desc = "Menentukan Radius Aimbot", Cmd = "setradius", UnCmd = "", NeedInput = true }
            }
        },
        {
            Name = "F1Lock ( Khusus Keyboard )",
            Desc = "Mengubah Shift Lock ke F1",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/F1Lock",
            SubFeatures = {
                { Name = "F1LOCK", Desc = "Bind Shift Lock to F1", Cmd = "f1lock", UnCmd = "unlockedcam" }
            }
        }
    },

    Tools = {
        {
            Name = "Full Bright",
            Desc = "Membuat game menjadi terang, sudah termasuk anti kabut dan shadow",
            Cmd = "fullbright",
            UnCmd = "fullbright",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/Fullbright"
        },
        {
            Name = "Instant Prompts",
            Desc = "Always instant interaction",
            Cmd = "instantprompts",
            UnCmd = "uninstantprompts",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/InstanPrompt"
        },
        {
            Name = "Walk Speed",
            Desc = "Masukan angka speed yang kami mau, misal 20 ( tergantung map )",
            Cmd = "ws",
            UnCmd = "unws",
            NeedInput = true,
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/WalkSpeed"
        },
        {
            Name = "Infinite Jump",
            Desc = "Melompat tanpa batas dan Melampauinyaaaa...",
            Cmd = "infjump",
            UnCmd = "uninfjump",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/InfiniteJump"
        },
        {
            Name = "Admin Detect",
            Desc = "Mendeteksi Owner dan Admin, tunggu beberapa detik setelah Execute",
            Cmd = "cad",
            UnCmd = "",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/AdminDetect"
        },
        {
            Name = "Noclip",
            Desc = "Menembus Objek yang ada di depan, tapi agak lebih pinter dikit",
            Cmd = "noclip",
            UnCmd = "unnoclip",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/Noclip"
        },
        {
            Name = "Code Finder",
            Desc = "Menemukan Code angka dan Huruf",
            Cmd = "code",
            UnCmd = "",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/CodeFinder"
        },
        {
            Name = "Anchor Part",
            Desc = "Menghentikan Part yang bergoyang",
            Cmd = "freeze",
            UnCmd = "unfreeze",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/Anchor"
        },
        {
            Name = "Anti AFK",
            Desc = "Anti Mental Mental Kleb 20 menit",
            Cmd = "antiafk",
            UnCmd = "unantiafk",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/AntiAFK"
        }
    },

    Horor = {
        {
            Name = "Interactable / ITP",
            Desc = "Proximity, Door, Click, Touch & ITP",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Interactable",
            SubFeatures = {
                { Name = "ITP", Desc = "Memunculkan window berisikan list objek yang bisa diteleport", Cmd = "itp", UnCmd = "itp" },
                { Name = "PPESP", Desc = "Memunculkan Box dan Nama ESP Objek yang di Pencet/Tekan", Cmd = "proximityesp", UnCmd = "unproximityesp" },
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
                { Name = "PESP", Desc = "Menampilkan ESP Body dan mama Player", Cmd = "pesp", UnCmd = "unloadColorESP" },
                { Name = "EESP", Desc = "Menampilkan ESP Musuh dan NPC", Cmd = "eesp", UnCmd = "unloadColorESP" }
            }
        },
        {
            Name = "Full Bright",
            Desc = "Membuat game menjadi terang, sudah termasuk anti kabut dan shadow",
            Cmd = "fullbright",
            UnCmd = "fullbright",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/Fullbright"
        },
        {
            Name = "Instant Prompts",
            Desc = "Instan klik pada objek yang di interact",
            Cmd = "instantprompts",
            UnCmd = "uninstantprompts",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/InstanPrompt"
        },
        {
            Name = "Mute Sound",
            Desc = "Mematikan suara latar belakang Map",
            Cmd = "mutesound",
            UnCmd = "unmutesound",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/SoundManage"
        },
        {
            Name = "Walk Speed",
            Desc = "Masukan angka speed yang kami mau, misal 20 ( tergantung map )",
            Cmd = "ws",
            UnCmd = "unws",
            NeedInput = true,
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/WalkSpeed"
        },
        {
            Name = "Noclip",
            Desc = "Menembus Objek yang ada di depan, tapi agak lebih pinter dikit",
            Cmd = "noclip",
            UnCmd = "unnoclip",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/Noclip"
        },
        {
            Name = "Code Finder",
            Desc = "Menemukan Code angka dan Huruf",
            Cmd = "code",
            UnCmd = "",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Tools/CodeFinder"
        }
    }
}
