-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.curve("smooth", { type = "bezier", points = { {0.25, 0.1}, {0.25, 1.0} } })
hl.curve("snappy", { type = "bezier", points = { {0.4,  0.0}, {0.2,  1.0} } })

hl.animation({ leaf = "windows",    enabled = true, speed = 4, bezier = "smooth" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "smooth", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 8, bezier = "smooth" })
hl.animation({ leaf = "fade",       enabled = true, speed = 5, bezier = "smooth" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "snappy", style = "slide" })
