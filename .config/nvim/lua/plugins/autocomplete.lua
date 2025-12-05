return {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
                keymap = {
                        preset = "enter",
                        ["<C-y>"] = { "select_and_accept" },
                },
                fuzzy = { implementation = "prefer_rust" },
        },
}
