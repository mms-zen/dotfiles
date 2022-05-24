local status_ok, configs = pcall(require, "neorg")
if not status_ok then
  return
end

configs.setup {
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				},
				autochdir = true, -- Automatically change the directory to the current workspace's root every time
				index = "index.norg", -- The name of the main (root) .norg file
			}
		}
	}
}
