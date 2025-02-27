# Minecraft Beet Project Template

A pre-configured GitHub template to quickly set up your [MCBeet](https://www.github.com/mcbeet) project.

## Features

- Premade VSCode task for automated Beet project building
- Including Beet plugins like Mecha and Bolt
- `.gitignore` template for Beet, Python and Visual Studio Code
- Multiplayer / Server support

## Installation

1. Click "Use this template" on GitHub to create a new repository.
2. Clone your new repository to your device:

```sh
git clone https://github.com/<your-username>/<your-repository>.git
```

3. Install Python and the [requirements](requirements.txt) using

```sh
pip install -r requirements.txt
```

4. Change `template` to your project's namespace.
5. **Done!** You can now add your custom functions, textures, and other assets.
6. Link Beet to your Minecraft installation with

```sh
beet link --datapack <your-datapack-folder>
```

## Usage

Build and update your project using Beet:

```sh
beet watch
```

If you are using VSCode, this should be done automatically.

Reload the datapack in-game with:

```mcfunction
/reload
```

## License
This project is licensed under [MIT](LICENSE).
