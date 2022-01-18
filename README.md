
<h1 align="center">Dotfiles</h1>

<p align="center">
  <a href="https://www.reddit.com/r/unixporn/comments/ot7thh/yabai_my_first_rice_on_macos/">r/unixporn post</a>
</p>

<table align="center">
  <tr>
    <td>
      <br>
      <ul>
        <li><b>WM</b>: <a href="https://github.com/koekeishiya/yabai">yabai</a> (+ <a href="https://github.com/koekeishiya/skhd/">skhd</a>)</li>
        <li><b>Terminal</b>: <a href="https://github.com/gnachman/iTerm2">iTerm2</a> (with <a href="https://github.com/pineapplegiant/spaceduck-terminal">spaceduck</a> theme)</li>
        <li><b>Bar</b>: <a href="https://github.com/Jean-Tinland/simple-bar">simple-bar</a></li>
        <li><b>Font</b>: <a href="https://www.jetbrains.com/lp/mono/">JetBrains Mono</a></li>
        <li><b>Tools in screenshot</b>: <a href="https://github.com/dylanaraps/neofetch/">neofetch</a> / <a href="https://github.com/gokcehan/lf">lf</a> / <a href="https://github.com/htop-dev/htop">htop</a></li>
        <li><b>Dotfiles manager</b>: <a href="https://github.com/TheLocehiliosan/yadm">yadm</a></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>
      <p align="center">
        <img width="720" alt="Rice" src="https://user-images.githubusercontent.com/25816683/135727227-9a02917c-a1be-4790-bf46-3a91cbc29453.png">
      </p>
    </td>
  </tr>
</table>

<table align="center">
  <tr>
    <td>
      <br>
      <ul>
        <li><b>Wallpaper</b>: https://www.pixiv.net/en/artworks/88256753</li>
        <li><b>Smol Gura in neofetch</b>: https://www.pixiv.net/en/artworks/86516526</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>
      <p align="center">
        <img width="720" alt="Wallpaper" src="https://user-images.githubusercontent.com/25816683/135727264-25800513-c2b9-4eb9-ab33-0fd17b6cbcec.png">
      </p>
    </td>
  </tr>
</table>

# How to Install

On macOS (and Linux), run following command:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ZhongXiLu/dotfiles/master/init.sh)"
```
On Windows, install programs with [winget](https://winget.run/):
```bash
winget import --accept-package-agreements --accept-source-agreements winget.json
```

As per usual, be wary that these are my dotfiles and not everything may be suitable to your liking, so be careful if you plan on running the command above.

# How to Customise

If you decide to fork this repo, here is a brief guide to help you navigate through all the files.

- [`init.sh`](https://github.com/ZhongXiLu/dotfiles/blob/master/init.sh): The entrypoint script and will intialize everything.
  - [L30-L32](https://github.com/ZhongXiLu/dotfiles/blob/master/init.sh#L30-L32): Git clone url, change to your own GitHub repo url.
  - [L36-L38](https://github.com/ZhongXiLu/dotfiles/blob/master/init.sh#L36-L38): You could remove this part or change this to your own username if you use the [yadm encryption](https://yadm.io/docs/encryption) too (see yadm part).
  - [L40-L42](https://github.com/ZhongXiLu/dotfiles/blob/master/init.sh#L40-L42): Git remote origin url, change to your own GitHub repo url.
- [`Brewfile`](https://github.com/ZhongXiLu/dotfiles/blob/master/Brewfile): Lists all brew packages. You can replace this with your own one by running `brew bundle dump`.
- [`.zshrc`](https://github.com/ZhongXiLu/dotfiles/blob/master/.zshrc): Pretty self-explanatory, you should probably replace this with yours too or modify it. Or if you use something else than zshell, you can remove this file and add yours.
- [`.hushlogin`](https://github.com/ZhongXiLu/dotfiles/blob/master/.hushlogin): When this file is present, it will remove the "Last login: ..." message everytime a new terminal window is openend.
- [`.simplebarrc`](https://github.com/ZhongXiLu/dotfiles/blob/master/.simplebarrc): Configuration for [simple-bar](https://github.com/Jean-Tinland/simple-bar). This needed to be in the `$HOME` directory.
- [`winget.json`](https://github.com/ZhongXiLu/dotfiles/blob/master/winget.json): Winget "packages" (for Windows). You can safely remove this or you can replace this with your own too. To create a `winget.json` file, simply run `winget export --accept-source-agreements -o winget.json` on your Windows and it should export most installed packages.
- [`.ssh`](https://github.com/ZhongXiLu/dotfiles/tree/master/.ssh): Ssh configuration, you can safely remove this.
- [`.config`](https://github.com/ZhongXiLu/dotfiles/tree/master/.config):
  - [`aliases`](https://github.com/ZhongXiLu/dotfiles/tree/master/.config/aliases): Bash aliases. I find it easier to manage them when they're all defined in one place. I then call them in my [`.zshrc`](https://github.com/ZhongXiLu/dotfiles/blob/master/.zshrc#L47).
  - [`yabai`](https://github.com/ZhongXiLu/dotfiles/tree/master/.config/yabai): Note that the configuration as of now differs from the one in the screenshot above. Currently, I've disabled autotiling. If needed, you can remove [this line](https://github.com/ZhongXiLu/dotfiles/blob/master/.config/yabai/yabairc#L40) or even better, use your own `yabairc`.
  - [`yadm`](https://github.com/ZhongXiLu/dotfiles/tree/master/.config/yadm):
    - [`bootstrap`](https://github.com/ZhongXiLu/dotfiles/blob/master/.config/yadm/bootstrap): The yadm bootstrap script. This will basically (1) install Homebrew and your Brew packages, (2) switch to zshell, and (3) run some other bootstrap scripts located in the `bootstrap.d` directory (it will automatically run all the scripts in this directory).
    - [`brew.sh`](https://github.com/ZhongXiLu/dotfiles/blob/master/.config/yadm/brew.sh): Simple helper script that will install Homebrew and your Brew packages.
    - [`encrypt`](https://github.com/ZhongXiLu/dotfiles/blob/master/.config/yadm/encrypt): List of all the files that need to be encrypted on your machine and stored in your dotfiles repo. Obviously, change this to your own list if you want to use this too.
    - [`archive`](https://github.com/ZhongXiLu/dotfiles/blob/master/.config/yadm/archive): File that contains all your encrypted files (that are listed in `encrypt`). You should remove this and again, if you want to store your own encrypted files in your repo, run `yadm encrypt --yadm-archive "$HOME/.config/yadm/archive"`.
    - [`bootstrap.d`](https://github.com/ZhongXiLu/dotfiles/tree/master/.config/yadm/bootstrap.d): This directory contains additional bootstrap scripts that will further install tools and applications and/or configure them. If you don't use or recognise the tool or application, you should definitely just remove the file. For example, if you don't use [BetterDiscord](https://betterdiscord.app/), remove the `better-discord.sh` file. The scripts are also highly experimental, so it might even be the best to remove most or all of them if you don't know what you're doing. On the other hand, you can also add some of your own scripts here if you want to "bootstrap" some of your tools or applications.
  - The other directories are just config files for other tools, applications, etc. If you see something you don't use or recognise, you can just remove it. Otherwise, verify if you want to keep the config files or want to modify them.

# FAQ

### How do you add an image to neofetch?

- You can change neofetch's config to use an image instead. You can find more info in their [wiki](https://github.com/dylanaraps/neofetch/wiki/Image-Backends). For example, I changed following variables in my [config.conf](https://github.com/ZhongXiLu/dotfiles/blob/master/.config/neofetch/config.conf#L691-L713) to show Gura in my neofetch:
```
image_backend="iterm2"
image_source="$HOME/.config/neofetch/gura.webp"
```

### What does "rice" mean?

- From [r/unixporn's wiki](https://www.reddit.com/r/unixporn/wiki/themeing/dictionary/#wiki_rice):

> "Rice" is a word that is commonly used to refer to making visual improvements and customizations on one's desktop. It was inherited from the practice of customizing cheap Asian import cars to make them appear to be faster than they actually were - which was also known as "ricing". Here on r/unixporn , the word is accepted by the majority of the community and is used sparingly to refer to a visually attractive desktop upgraded beyond the default.

### What happens if you disable SIP to install yabai?

- By disabling SIP you allow scripts to modify your system files, so it would then be possible for malware and other malicious scripts to modify these files and cause harm to your system. Still, imo it's worth it to use yabai with SIP disabled. Though, you can also use yabai with SIP enabled, but then you won't have every feature. You can read more on [yabai's wiki](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection).

---

If you got any more questions, feel free to create a [new issue](https://github.com/ZhongXiLu/dotfiles/issues/new), comment on [my reddit post](https://www.reddit.com/r/unixporn/comments/ot7thh/yabai_my_first_rice_on_macos/), or whatever mean you find to contact me.
Anyway, thanks for visiting my dotfiles. (◕◡◕✿)
