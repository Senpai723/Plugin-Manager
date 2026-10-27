return {
    -- BAGIAN 1: TAB UTAMA (Berisi menu induk yang punya SubFeatures / Tombol OPEN)
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
            Name = "Color ESP",
            Desc = "Player & Enemy ESP",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/colorESP",
            SubFeatures = {
                { Name = "PESP", Desc = "Menampilkan ESP Body dan mama Player", Cmd = "pesp", UnCmd = "unloadColorESP" },
                { Name = "EESP", Desc = "Menampilkan ESP Musuh dan NPC", Cmd = "eesp", UnCmd = "unloadColorESP" }
            }
        },
        {
            Name = "Instant Prompts",
            Desc = "Always instant interaction",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/InstanPrompt",
            SubFeatures = {
                { Name = "INSTANTPROMPTS", Desc = "Selalu Instan saat mengklik Prompt", Cmd = "instantprompts", UnCmd = "uninstantprompts" }
            }
        },
        {
            Name = "Fitur Player",
            Desc = "Waypoint & Teleport",
            RawUrl = "",
            SubFeatures = {
                { Name = "Radar Checkpoint", Desc = "Menampilkan Checkpoint yang belum di sentuh", Cmd = "scp", UnCmd = "scp_close", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Waypoint" },
                { Name = "CP & Waypoint", Desc = "Menampilkan Checkpoint atau Waypoint", Cmd = "cpn", UnCmd = "cpn_close", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Waypoint" },
                { Name = "Teleport to Player", Desc = "Teleport ke player dengan 1 klik", Cmd = "tp", UnCmd = "", RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/PlayerTeleport" }
            }
        },
        {
            Name = "Code Finder",
            Desc = "Menemukan Code angka dan Huruf",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/CodeFinder",
            SubFeatures = {
                { Name = "Code Finder", Desc = "Menemukan CODE yang sudah masuk ke Client Side", Cmd = "CODE", UnCmd = "" }
            }
        },
        {
            Name = "Admin Detect",
            Desc = "Mendeteksi Owner dan Admin",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/AdminDetect",
            SubFeatures = {
                { Name = "Admin Detect", Desc = "Tunggu beberapa detik sampai muncul Notif", Cmd = "cad", UnCmd = "" }
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

    -- BAGIAN 2: TAB OTHER (Berisi fitur mandiri yang langsung tombol EXECUTE / UNEXECUTE)
   Tools = {
        {
            Name = "Full Bright",
            Desc = "Membuat game menjadi terang, sudah termasuk anti kabut dan shadow",
            Cmd = "fullbright",
            UnCmd = "fullbright", -- Bersifat toggle, jadi uncmd memanggil command yang sama
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Fullbright"
        },
        {
            Name = "Walk Speed",
            Desc = "Masukan angka speed yang kami mau, misal 20 ( tergantung map )",
            Cmd = "ws",
            UnCmd = "unws",
            NeedInput = true,
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/WalkSpeed"
        },
        {
            Name = "Infinite Jump",
            Desc = "Melompat tanpa batas dan Melampauinyaaaa...",
            Cmd = "infjump",
            UnCmd = "uninfjump",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/InfiniteJump"
        },
        {
            Name = "Noclip",
            Desc = "Menembus Objek yang ada di depan, tapi agak lebih pinter dikit",
            Cmd = "noclip",
            UnCmd = "unnoclip",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Noclip"
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
            UnCmd = "fullbright", -- Bersifat toggle, jadi uncmd memanggil command yang sama
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Fullbright"
        },
        {
            Name = "Walk Speed",
            Desc = "Masukan angka speed yang kami mau, misal 20 ( tergantung map )",
            Cmd = "ws",
            UnCmd = "unws",
            NeedInput = true,
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/WalkSpeed"
        },
        {
            Name = "Instant Prompts",
            Desc = "Always instant interaction",
            Cmd = "instanprompts",
            UnCmd = "uninstanprompts",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/InstanPrompt",
        },
        {
            Name = "Mute Sound",
            Desc = "Mematikan Suara latar belakang Map",
            Cmd = "mutesound",
            UnCmd = "unmutesound",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/SoundManage",
        },
        {
            Name = "Noclip",
            Desc = "Menembus Objek yang ada di depan, tapi agak lebih pinter dikit",
            Cmd = "noclip",
            UnCmd = "unnoclip",
            RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Noclip"
        }
    }
}
