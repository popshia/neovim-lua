local status_ok, hlslens = pcall(require, "hlslens")
print(status_ok)
if not status_ok then
	return
end

hlslens.setup({
	calm_down = true,
})
