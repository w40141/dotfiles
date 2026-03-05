vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
	},
	pattern = {
		[".*%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
		[".*/values%.ya?ml"] = "yaml.helm-values",
		[".*/values%..*%.ya?ml"] = "yaml.helm-values",
		[".*/docker%-compose%.ya?ml"] = "yaml.docker-compose",
		[".*/compose%.ya?ml"] = "yaml.docker-compose",
	},
})

vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
		tmpl = "gotmpl",
		work = "gowork",
	},
	filename = {
		["go.work"] = "gowork",
		["go.work.sum"] = "gowork",
	},
})
