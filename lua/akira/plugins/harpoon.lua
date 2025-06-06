return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<leader>hc", function()
			harpoon:list():clear()
		end, { desc = "Remove current file from Harpoon" })

		-- Too much mental overhead to know which files are being assigned to which key, better to just telescope or toggle through
		-- vim.keymap.set("n", "<leader>p", function()
		-- 	harpoon:list():select(1)
		-- end)
		-- vim.keymap.set("n", "<leader>o", function()
		-- 	harpoon:list():select(2)
		-- end)
		-- vim.keymap.set("n", "<leader>i", function()
		-- 	harpoon:list():select(3)
		-- end)
		-- vim.keymap.set("n", "<leader>u", function()
		-- 	harpoon:list():select(4)
		-- end)
		-- vim.keymap.set("n", "<leader>y", function()
		-- 	harpoon:list():select(5)
		-- end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():next()
		end)

		-- Telescope UI integration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>hf", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Telescope UI for Harpoon" })
	end,
}
