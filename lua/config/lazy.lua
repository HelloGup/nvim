local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.api.nvim_echo({ { "  Installing lazy.nvim & plugins ...", "Bold" } }, true, {})
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  -- 禁止通知检测到配置更改
  change_detection = {
		notify = false,
	},
	spec = {
		-- add HelloGuVim and import its plugins
		{ "HelloGup/HelloGuVim", import = "helloguvim.plugins" },

		-- import any extras modules here
		-- { import = "helloguvim.plugins.extras.lang.json" },
    { import = "helloguvim.plugins.extras.dap.core" },

    -- markdown preview
    { import = "helloguvim.plugins.extras.markdown.markdown-preview" },

		-- import/override with your plugins
		-- { import = "plugins" },
	},
	defaults = {
		-- By default, only HelloGuVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { "tokyonight", "habamax" } },
    -- 自动检查更新
	checker = { enabled = false }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
