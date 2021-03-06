local nest = prequire("nest")
local wk = prequire("which-key")
if not nest and wk then
    return
end

-- register groups name via which-key and apply via nest
local register_groups = function(maps)
    for _, map in pairs(maps) do
        if map.name or map.prefix then
            wk.register({
                [map.prefix] = {
                    name = map.name,
                },
            })
        end

        nest.applyKeymaps(map)
    end
end

local escapes = {
    { mode = "i", { "jk", "<Esc>" } },
    { mode = "t", { "jk", "<C-\\><C-N>" } },
}

local leader = {
    prefix = "<leader>",
    { "l", "<cmd>luaf%<cr>" },
    { "q", "<cmd>Format<cr>" },
}

local packer = {
    name = "packer",
    prefix = "<leader>p",
    { "i", "<cmd>PackerInstall<cr>" },
    { "S", "<cmd>PackerSource<cr>" },
    { "s", "<cmd>PackerSync<cr>" },
    { "u", "<cmd>PackerUpdate<cr>" },
    { "c", "<cmd>PackerCompile<cr>" },
    { "p", "<cmd>PackerProfile<cr>" },
    { "t", "<cmd>PackerStatus<cr>" },
    { "d", "<cmd>PackerClean<cr>" },
    { "o", "<cmd>PackerConfig<cr>" },
}

local telescope = {
    name = "telescope",
    prefix = "<leader>t",
    { "t", "<cmd>Telescope<cr>" },
    { "f", "<cmd>Telescope fd<cr>" },
    { "s", "<cmd>Telescope file_browser<cr>" },
    { "b", "<cmd>Telescope buffers<cr>" },
    { "g", "<cmd>Telescope live_grep<cr>" },
    { "h", "<cmd>Telescope command_history<cr>" },
    { "r", "<cmd>Telescope oldfiles<cr>" },
}

local n_gitsigns = {
    name = "gitsigns",
    prefix = "<leader>h",
    { "s", "<cmd>lua require('gitsigns').stage_hunk()<cr>" },
    { "u", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>" },
    { "r", "<cmd>lua require('gitsigns').reset_hunk()<cr>" },
    { "R", "<cmd>lua require('gitsigns').reset_buffer()<cr>" },
    { "p", "<cmd>lua require('gitsigns').preview_hunk()<cr>" },
    { "b", "<cmd>lua require('gitsigns').blame_line(true)<cr>" },
    { "S", "<cmd>lua require('gitsigns').stage_buffer()<cr>" },
    { "U", "<cmd>lua require('gitsigns').reset_buffer_index()<cr>" },
}

local v_gitsigns = {
    name = "gitsigns",
    prefix = "<leader>h",
    mode = "v",
    { "s", "<cmd>lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v'))})<cr>" },
    { "r", "<cmd>lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v'))})<cr>" },
}

register_groups({
    escapes,
    packer,
    leader,
    telescope,
    n_gitsigns,
    v_gitsigns,
})

nest.applyKeymaps({ "<leader>m", "<cmd>split | terminal<cr>" })
nest.applyKeymaps({ "<leader>nf", "<cmd>DashboardNewFile<cr>" })
