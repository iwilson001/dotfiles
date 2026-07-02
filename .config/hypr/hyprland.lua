-- Credit to https://github.com/LilAiluropoda/hyprland-gruvbox-theme for most config
-- TODO: Notification daemon
-- exec-once = dunst
-- TODO: Authentication agent
-- exec-once = /usr/lib/polkit-kde-authentication-agent-1

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprsunset")
end)

require("modules.env")
require("modules.monitors")
require("modules.general")
require("modules.input")
require("modules.rules")
require("modules.binds")

-- TODO
-- ###################
-- ### PERMISSIONS ###
-- ###################
--
-- # See https://wiki.hypr.land/Configuring/Permissions/
-- # Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- # for security reasons
--
-- # ecosystem {
-- #   enforce_permissions = 1
-- # }
--
-- # permission = /usr/(bin|local/bin)/grim, screencopy, allow
-- # permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow
-- # permission = /usr/(bin|local/bin)/hyprpm, plugin, allow
