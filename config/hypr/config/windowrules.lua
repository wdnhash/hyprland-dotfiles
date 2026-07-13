
-- Picture-in-Picture
hl.window_rule({
    match             = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    float             = true,
    keep_aspect_ratio = true,
    move              = "73% 72%",
    size              = "25% 25%",
    pin               = true,
})

-- Gaming
local gamingApps = "^(steam_app.*|gamescope)$"
local gamingWorkspace = "name:gaming"

hl.window_rule({ match = { content = "game" }, workspace = gamingWorkspace })
hl.window_rule({ match = { class = gamingApps }, workspace = gamingWorkspace })
hl.window_rule({ match = { class = "^(steam)$", title = "^(Friends List)$" }, float = true })
hl.window_rule({
    match = {
        class = "^(steam)$",
        title = "^(Launching\\.{3})$"
    },
    float     = true,
    center    = true,
    workspace = gamingWorkspace,
})
hl.window_rule({
    match = {
        class         = gamingApps,
        title         = "^(.+)$",
        initial_title = "negative:^(.*\\\\home\\\\.*)$",
    },
    size             = "monitor_w monitor_h",
    fullscreen_state = 2,
    content          = "game",
})
hl.window_rule({
    match = {
        class         = "^(steam_app.*)$",
        initial_title = "^$",
    },
    float            = true,
    center           = true,
    fullscreen       = false,
    fullscreen_state = 0,
})

-- Apps

hl.workspace_rule({ workspace = "1", monitor = "DP-5",     persistent = true, default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-5",     persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-5",     persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-6", persistent = true, default = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-6", persistent = true, default = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-6", persistent = true, default = true })

hl.window_rule({ name = "ws-alacritty", match = { class = "^Alacritty$" },             float = true })
hl.window_rule({ name = "ws-zen",       match = { class = "^zen$|^zen-browser$" },     workspace = 1 })
hl.window_rule({ name = "ws-zed",       match = { class = "^dev\\.zed\\.Zed$|^Zed$" }, workspace = 2 })
hl.window_rule({ name = "ws-discord",   match = { class = "^discord$" },               workspace = 5 })
hl.window_rule({ name = "ws-spotify",   match = { class = "^[Ss]potify$" },            float = true, center = true, size = "1000 700" })
hl.window_rule({ name = "ws-obsidian",  match = { class = "^obsidian$" },              workspace = 3 })
hl.window_rule({ name = "ws-zapzap",    match = { class = "^(com\\.rtosta\\.zapzap|zapzap)$" }, workspace = 5 })
hl.window_rule({ name = "ws-obs",       match = { class = "^(com\\.obsproject\\.Studio|obs)$" }, workspace = 6 })
hl.window_rule({ name = "float-micro",  match = { class = "^micro$" },                 float = true, center = true, size = "1000 700" })
hl.window_rule({ name = "float-imv",    match = { class = "^imv$" },                   float = true, center = true, size = "1000 700" })

hl.window_rule({ match = { class = "^(.*\\.exe)$", float = true }, primaryWorkspace, center = true, fullscreen_state = 0 })
hl.window_rule({ match = { class = "^(vesktop|discord)$" }, primaryWorkspace })
hl.window_rule({ match = { class = "^(.*[Cc]alculator.*)$" }, float = true, size = "380 616" })
hl.window_rule({ match = { class = "^(org.kde.keditfiletype)$" }, float = true })
hl.window_rule({ match = { class = "^(org.kde.ark)$" }, size = "(monitor_w*0.40) (monitor_h*0.40)" })
hl.window_rule({
    match = {
        class = "^(org\\.gnome\\.Nautilus)$",
        title = "negative:^(Moving.*|Create New.*|Extract.*|Compress.*|Copying.*|Progress.*|Configure.*|Properties.*|Choose\\sApplication.*)$",
    },
    float = true,
    center = true,
    size = "1000 600",
})

-- Opacity Overrides
local terminals = "^(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)$"

hl.window_rule({ match = { class = "^(firefox|zen)$" }, opacity = "1.0 override" })
hl.window_rule({ match = { class = terminals }, opacity = "1.0 override" }) -- override opacity in favor of terminal settings for opacity
hl.window_rule({ match = { class = "^(mpv|org.kde.haruna|.*plex.*|org\\.kde\\.gwenview|.*vlc.*|imv)$" }, opacity = "1.0 override" })

-- Float Utility Windows
local floatApps = {
    { class = "^(kvantummanager|qt[56]ct|nwg-look)$" },
    { class = "^(org.pulseaudio.pavucontrol|blueman-manager|nm-applet|nm-connection-editor)$" },
    { title = "^(Winetricks.*|Protontricks.*)$" },
}
for _, m in ipairs(floatApps) do hl.window_rule({ match = m, float = true }) end

hl.window_rule({ match = { float = true }, center = true })

-- Float Common Modals
local modalMatches = {
    { title = "^(Open|Authentication Required|Add Folder to Workspace|Choose Files|Save As|Confirm to replace files|File Operation Progress)$" },
    { initial_title = "^(Open File)$" },
    { class = "^([Xx]dg-desktop-portal-gtk)$" },
    { title = "^(File Upload|Choose wallpaper|Library)(.*)$" },
    { class = "^(.*dialog.*)$" },
    { title = "^(.*dialog.*)$" },
    { class = "^(hyprland-share-picker)$"},
}
for _, m in ipairs(modalMatches) do hl.window_rule({ match = m, float = true }) end

-- Ignore maximize requests from all apps. You'll probably like this.
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
