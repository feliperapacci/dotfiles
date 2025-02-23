function ColorMyPencils(color)
	color = color or "OceanicNext"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
end

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#faf9b0', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#faf9b0', bold=true })
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg='#faf9b0', bold=true})
end


ColorMyPencils()
LineNumberColors()
