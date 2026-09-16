---@type vim.lsp.Config
return {
	cmd = { "/home/paarthmahadik/.dotnet/tools/roslyn-language-server", "--stdio" },
	root_markers = { "*.slnx",
		"*.sln",
		"*.csproj", },
	filetypes = { "cs" },
}
