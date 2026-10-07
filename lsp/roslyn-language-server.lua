---@type vim.lsp.Config
return {
	cmd = { "~/.dotnet/tools/roslyn-language-server", "--stdio" },
	root_markers = { "*.slnx",
		"*.sln",
		"*.csproj", },
	filetypes = { "cs" },
}
