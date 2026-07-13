-- Montior wiki https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output    = "",
    mode      = "preferred",
    position  = "auto",
    scale     = "auto",
})

hl.monitor({ output = "DP-5",     mode = "3840x2160@100", position = "1080x0", scale = "1.5" })

hl.monitor({ output = "HDMI-A-6", mode = "1920x1080@100", position = "0x0",    scale = "1", transform = 1 })
