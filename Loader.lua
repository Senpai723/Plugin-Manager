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
            { Name = "PESP", Desc = "Menampilkan ESP Body dan mama Player", Cmd = "pesp", UnCmd = "unloadColorESP" },
            { Name = "EESP", Desc = "Menampilkan ESP Musuh dan NPC ( Merah sudah dipastikan Musuh )", Cmd = "eesp", UnCmd = "unloadColorESP" }
        }
    },
    {
        Name = "Instant Prompts",
        Desc = "Always instant interaction",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/InstanPrompt",
        SubFeatures = {
            { Name = "INSTANTPROMPTS", Desc = "Selalu Instan saat mengklik Prompt ( Tidak semuanya )", Cmd = "instantprompts", UnCmd = "uninstantprompts" }
        }
    },
    {
        Name = "Streaming Radar",
        Desc = "Checkpoint & Waypoint Manager",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/Waypoint",
        SubFeatures = {
            { Name = "SCP", Desc = "Menampilkan Checkpoint yang belum di sentuh", Cmd = "scp", UnCmd = "scp_close" },
            { Name = "CPN", Desc = "Menampilkan Checkpoint atau Waypoint yang sudah di simpan", Cmd = "cpn", UnCmd = "cpn_close" }
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
            { Name = "Admin Detect", Desc = "Tunggu beberapa detik setelah Execute sampai muncul Notif", Cmd = "cad", UnCmd = "" }
        }
    },
    {
        Name = "Sound Manage",
        Desc = "Mendengar dan Membisukan Sound di Map",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/SoundManage",
        SubFeatures = {
            { Name = "Voice Spy", Desc = "Menguping Voice Chat Target, Masukan nama target ( Min 3 huruf pertama )", Cmd = "vspy", UnCmd = "unvspy", NeedInput = true },
            { Name = "Mute Sound", Desc = "Membisukan suara Latar Belakang Map", Cmd = "mutesound", UnCmd = "unmutesound" }
        }
    },
    {
        Name = "MusicTimeML",
        Desc = "Memutar dan Membisukan Sound",
        RawUrl = "https://raw.githubusercontent.com/Senpai723/Plugin-Manager/refs/heads/main/MusicTimeML",
        SubFeatures = {
            { Name = "Play Music", Desc = "Memutar musik dengan ID lagu, Langsung masukan IDnya", Cmd = "playmusic", UnCmd = "", NeedInput = true },
            { Name = "Stop Music", Desc = "Menstop lagu yang sedang di putar", Cmd = "stopmusic", UnCmd = "" }
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
}
