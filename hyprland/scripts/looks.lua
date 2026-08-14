hl.config({
	decoration = {
		motion_blur = {
			enabled=false
		},
		wobble = {
			--enabled=true may have been removed
		}
	},
	misc = {
		-- disable stuff cause noctalia handles it
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 0, -- adaptive sync 0-off 1-on 2-fullscreen 3-gamefullscreen
		animate_manual_resizes = false,
		enable_swallow = false, -- hides terminal when running apps from them
		mouse_move_focuses_monitor = true,
		--float_force_onscreen = 1 may have been removed
	},
	render = {
		cm_auto_hdr = 0
	},
	ecosystem = {
		no_donation_nag = true
	}
})
