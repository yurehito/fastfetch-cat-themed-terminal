# Fastfetch Cat Theme ᓚᘏᗢ

> A customized Fastfetch setup featuring a black cat logo, Zsh, Starship, and a transparent terminal.

> [!IMPORTANT]
> **A Nerd Font is required for the icons to display correctly.** This setup and installation guide are specifically designed for Fedora Workstation 44 with GNOME 50.6 and Wayland. Installation and configuration steps may differ on other systems.

---

### 📸 Preview

![Fastfetch Cat Theme Preview](https://raw.githubusercontent.com/yurehito/fastfetch-cat-theme-config/0bd9557213cddb4bf6a7bf1d2a6b904fbe2f4128/terminal-yurehito.png)

---

### 🇫 Fedora Setup

> `sed` and `curl` are usually preinstalled on Fedora. If missing, install them with:

```bash
sudo dnf install sed curl
```

1️⃣️ Update your system

```bash
sudo dnf update
```

 2️⃣️ Enable RPM Fusion

Install the free and nonfree repositories:

```bash
sudo dnf install \
https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

3️⃣️ Enable OpenH264

Fedora 41 and later:

```bash
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
```

Fedora 40 and earlier:

```bash
sudo dnf config-manager --enable fedora-cisco-openh264
```

Update your system and repository metadata:

```bash
sudo dnf update
```

4️⃣️ Enable Flathub

Add the Flathub repository for Flatpak:

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

---

### 📋 Requirements

- Fedora Linux
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [FiraMono Nerd Font — Bold](https://www.nerdfonts.com/font-downloads)
- Zsh
- Git
- [Starship](https://starship.rs/)
- GNOME Ptyxis Terminal
- `curl` and `sed`

---

### 🎨️ Setup

1️⃣️ Install the font

1. Download **FiraMono Nerd Font** from the [Nerd Fonts website](https://www.nerdfonts.com/font-downloads).
2. Install the Bold font in `~/.fonts`.
3. Open your terminal profile settings and select the installed font.

2️⃣️ Install Zsh and Git

```bash
sudo dnf install zsh git
```

Change your default shell to Zsh:

```bash
chsh -s "$(which zsh)"
```

Reboot your device, then open the terminal again.

3️⃣️ Install and configure Zsh plugins

Run:

```bash
mkdir -p ~/.zsh/plugins && \
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions && \
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/plugins/fast-syntax-highlighting && \
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/plugins/zsh-completions
```

Open your Zsh configuration:

```bash
nano ~/.zshrc
```

Add the following:

```zsh
# 1. ADD ZSH-COMPLETIONS TO FPATH (Must be before compinit)
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)

# 2. INITIALIZE COMPLETION SYSTEM
autoload -Uz compinit
compinit

# 3. SOURCE PLUGINS
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# 4. BASIC CONFIGURATION

# Enable colors
autoload -U colors && colors

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
```

Save with `Ctrl + O`, press `Enter`, then exit with `Ctrl + X`.

Apply the configuration:

```zsh
source ~/.zshrc
```

4️⃣️ Install Starship

Run the installer:

```bash
curl -sS https://starship.rs/install.sh | sh
```

Open your Zsh configuration:

```bash
nano ~/.zshrc
```

Add this line:

```zsh
# STARSHIP
eval "$(starship init zsh)"
```

Save with `Ctrl + O`, press `Enter`, then exit with `Ctrl + X`.

Apply the changes:

```zsh
source ~/.zshrc
```

Install the Catppuccin Powerline preset:

```zsh
starship preset catppuccin-powerline -o ~/.config/starship.toml
```

5️⃣️ Configure terminal transparency

For GNOME Ptyxis, run the following command:

```bash
dconf write /org/gnome/Ptyxis/Profiles/<your-profile-identifier>/opacity 0.90
```

Replace `<your-profile-identifier>` with your actual Ptyxis profile identifier.

6️⃣️ Set the terminal color palette

Set your terminal palette to **Elemental** in your terminal profile settings.

---

### ⚙️ Install the Fastfetch theme

1️⃣️ Clone this repository:

```bash
git clone https://github.com/yurehito/fastfetch-cat-theme-config.git
cd fastfetch-cat-theme-config
```

2️⃣️ Run the installer:

```zsh
chmod +x install.sh
zsh install.sh
```

3️⃣️ Launch Fastfetch:

```zsh
fastfetch
```

> Your existing Fastfetch config is backed up to `~/.config/fastfetch/config.jsonc.backup` before being replaced.

---

### 📁 Files

- `config.jsonc` — Fastfetch configuration
- `black-meow-icon.png` — Custom black cat logo
- `install.sh` — Installation script
