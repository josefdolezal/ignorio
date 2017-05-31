import Commander

let main = Group {
    $0.addCommand("create", "Fetch .gitignore file for collection of types", createCommand)
}

main.run()
