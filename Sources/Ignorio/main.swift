import Commander

let main = Group {
    $0.addCommand("create", "Fetch .gitignore file for collection of types", createCommand)
    $0.addCommand("list", "List all supported types by gitignore.io", listCommnad)
}

main.run()
