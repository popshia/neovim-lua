local status_ok, hlslens = pcall(require, "hlslens")
if not status_ok then
	return
end

hlslens.setup({
	calm_down = true,
	nearest_only = true,
	nearest_float_when = "auto",
})
