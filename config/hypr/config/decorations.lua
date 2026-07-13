-- Look and feel configuration

hl.config({
    general = {
        gaps_in  = 16,
        gaps_out = 20,
        border_size = 2,
        col = {
            active_border   = { colors = { "rgb(6e6e6e)", "rgb(4a4a4a)" }, angle = 45 },
            inactive_border = "rgb(2e2e2e)",
        },
        layout = "dwindle",
        resize_on_border = true,
        allow_tearing    = false,
    },

    decoration = {
        rounding         = 8,
        active_opacity   = 1.0,
        inactive_opacity = 0.90,

        shadow = {
            enabled      = true,
            range        = 12,
            render_power = 3,
            color        = 0xee0a0a0a,
        },

        blur = {
            enabled           = true,
            size              = 6,
            passes            = 2,
            new_optimizations = true,
            ignore_opacity    = true,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        smart_split    = false,
        smart_resizing = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        focus_on_activate        = false,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    cursor = {
        inactive_timeout = 5,
    },

    input = {
        kb_layout  = "us",
        kb_variant = "intl",            -- US Intl. com dead keys
        kb_model   = "",
        kb_options = "compose:menu",    -- tecla Menu como Compose
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity  = 0,
    },
})
