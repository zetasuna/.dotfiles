return {
    {
        'junegunn/fzf.vim',
        dependencies = {
            {
                "junegunn/fzf",
                dir = "$HOME/.local/share/nvim/fzf",
                run = "./install --all",
                opts = {}
            }
        },
        opts = {}
    },
}
