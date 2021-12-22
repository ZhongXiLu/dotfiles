
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
