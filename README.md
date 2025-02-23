# Minecraft Beet Project Template

A pre-configured GitHub template to quickly set up your [Minecraft Beet](https://www.github.com/mcbeet/beet) project.

## Features

- Premade VSCode task for Beet project building and real-time updates
- Most important files and folders for a quick start
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

## Usage

Build and update your project using Beet:

```sh
beet watch --link
```

If you are using VSCode, this should be done automatically.

Reload the datapack in-game with:

```mcfunction
/reload
```

Run your custom functions using:

```mcfunction
/function <namespace>:<function>
```

## License

[![License](https://img.shields.io/github/license/rotsteinfuchs/beet-template?style=for-the-badge)](LICENSE)
