return {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 100,
                    indentSize = 4
                },
                pydocstyle = {
                    enabled = true,
                    convention = "google"
                }
            }
        }
    }
}
