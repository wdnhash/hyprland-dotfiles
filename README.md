# 🖥️ Dotfiles

Minhas configurações pessoais para **CachyOS** com **Hyprland** + **Noctalia Shell**.

![Desktop](assets/desktop.png)

## 📁 Estrutura

```
dotfiles/
├── assets/         # Screenshots do sistema
├── config/         # Configs (espelham ~/.config)
│   ├── alacritty/  # Terminal
│   ├── btop/       # Monitor do sistema
│   ├── cava/       # Visualizador de áudio
│   ├── fastfetch/  # Fetch do terminal
│   ├── fish/       # Shell
│   ├── gtk-3.0/    # Tema GTK3
│   ├── gtk-4.0/    # Tema GTK4
│   ├── hypr/       # Hyprland (config em Lua + scripts)
│   ├── micro/      # Editor de terminal (tema nord-mono)
│   ├── noctalia/   # Noctalia Shell (barra, launcher, plugins)
│   └── zed/        # Editor Zed
├── local/          # Espelha ~/.local (override do micro.desktop)
└── wallpapers/     # Papéis de parede
```

## 🚀 Como usar

Como o CachyOS já vem com quase tudo pronto, não tem script de instalação — é só copiar as pastas:

```bash
cp -r config/* ~/.config/
cp -r local/* ~/.local/
cp -r wallpapers/* ~/Pictures/Wallpapers/
```

Depois é só relogar na sessão do Hyprland (ou dar reload com `hyprctl reload`).

## 🔧 Hardware

| Componente | Modelo |
|---|---|
| **CPU** | Intel Core i7-12700 (12ª geração, 20 threads) |
| **GPU** | Intel Arc B580 (Battlemage) |
| **RAM** | 32 GB |
| **Armazenamento** | HP SSD EX900 1TB (NVMe) |
| **Monitor principal** | Dell P2725QE — 4K @ 100Hz (DP) |
| **Monitor secundário** | Dell P2725H — 1080p @ 100Hz, na vertical (HDMI) |

## 📦 Pacotes

Programas que eu instalo por cima da base do CachyOS:

```
spotify discord cava fastfetch zed zen-browser-bin nautilus micro
fuse2 cliphist wl-clipboard vlc steam obsidian alacritty bitwarden
obs-studio tigervnc protonup-qt imv telegram
```

## ✨ Destaques

### 🎮 Game Mode — `Super + G`

O script `config/hypr/scripts/game-mode.sh` alterna a resolução do monitor principal (DP-5) entre:

- **Desktop:** 4K (3840x2160@100, escala 1.5)
- **Jogos:** Full HD (1920x1080@100, escala 1)

Um atalho só (`Super + G`) faz o toggle e manda uma notificação avisando qual modo ativou. Também dá pra chamar direto no terminal: `game-mode.sh on|off|toggle`.

### 📝 Nota rápida no Obsidian — `Super + N`

Abre o **micro** num terminal flutuante já criando um arquivo `.md` novo com data e hora no nome, direto na pasta Inbox do meu vault do Obsidian (`~/Documents/Awesome/01 - Inbox/`). Perfeito pra anotar algo rápido sem abrir o Obsidian inteiro — depois eu processo as notas por lá.

### ⌨️ Atalhos principais

| Atalho | Ação |
|---|---|
| `Super + Enter` | Terminal (Alacritty) |
| `Super + Space` | Launcher (Noctalia) |
| `Super + W` | Navegador (Zen) |
| `Super + E` | Arquivos (Nautilus) |
| `Super + T` | Editor (micro no Alacritty) |
| `Super + N` | Nota rápida no Obsidian |
| `Super + G` | Game mode (troca resolução) |
| `Super + V` | Histórico do clipboard |
| `Super + X` | Control Center (Noctalia) |
| `Super + L` | Bloquear tela |
| `Super + Q` | Fechar janela |
| `Super + Esc` | Forçar fechamento (hyprctl kill) |
| `Super + F` | Fullscreen |
| `Super + Z` | Alternar janela flutuante |
| `Super + J` | Alternar direção do split |
| `Super + C` | Calculadora |
| `Alt + Tab` | Alternar entre janelas |
| `Super + Setas` | Mover foco entre janelas |
| `Super + Shift + Setas` | Mover janela na workspace |
| `Super + 1..0` | Ir pra workspace 1–10 |
| `Super + Shift + 1..0` | Mover janela pra workspace (e ir junto) |
| `Super + Alt + 1..0` | Mover janela pra workspace (sem ir junto) |
| `Super + Ctrl + ← / →` | Workspace anterior / próxima |
| `Super + arrastar (botão esq/dir)` | Mover / redimensionar janela com o mouse |
| `Super + Shift + S` | Screenshot de área (grim + slurp) |
| `Print` | Screenshot com anotação (screen-toolkit) |
| `Super + Print` | Screenshot da janela com anotação |
| `Super + R` | Menu do screen-toolkit |
| `Super + P` | Color picker |
| `Super + Shift + W` | Trocar wallpaper |
| `Super + .` | Seletor de emoji |
| `Ctrl + Shift + Esc` | btop (monitor do sistema) |

### 🪟 Regras de janela e workspaces

Tudo em `config/hypr/config/windowrules.lua`:

- **Workspaces fixas por monitor**: 1–3 no monitor principal (DP-5), 4–6 no secundário vertical (HDMI-A-6), todas persistentes
- **Apps com lugar certo**: Zen → 1, Zed → 2, Obsidian → 3, Discord/ZapZap → 5, OBS → 6
- **Workspace de jogos**: jogos da Steam (`steam_app_*`) e gamescope vão automaticamente pra uma workspace própria (`gaming`) já em fullscreen
- **Flutuantes por padrão**: Alacritty, micro, Spotify, imv e Nautilus abrem flutuantes e centralizados
- **Picture-in-Picture**: fixado no canto inferior direito, sempre visível (pin)
- **Window swallowing**: abrir um app gráfico pelo terminal "engole" o terminal — ele some e volta quando o app fecha

### 🎨 Tema monocromático unificado

Tudo segue a mesma paleta em escala de cinza com fundo `#1a1a1a`: Alacritty, Zed (Min Dark com overrides), fish (cores do prompt), micro (nord-mono), btop, GTK e as bordas do Hyprland. Nos terminais, as cores ANSI têm um toque Nord pra `git diff`, `ls` e afins continuarem legíveis. A fonte é **JetBrainsMono Nerd Font** (pacote `ttf-jetbrains-mono-nerd`) em tudo.

### 🐟 Fish

O `config.fish` traz:

- **Abbreviations** de paru (`up`, `inst`, `rem`, `ser`) e git (`gs`, `gaa`, `gcm`, `glog`...) — expandem ao apertar espaço
- **Integrações opcionais**: starship, eza, zoxide e fzf só ativam se estiverem instalados — nada quebra sem eles
- `EDITOR`/`VISUAL` apontando pro Zed

### 🗂️ Fix: abrir arquivos de texto do Nautilus no micro

Por padrão, dar dois cliques num `.txt` no Nautilus **não abria nada** — sem nem mensagem de erro. O motivo: o `micro.desktop` do sistema usa `Terminal=true`, e quando o Nautilus pede ao glib pra abrir um app de terminal, o glib só conhece uma lista fixa de emuladores antigos (xterm, gnome-terminal etc.). Como o Alacritty não está nessa lista, nada acontecia.

A solução foi criar um override em `~/.local/share/applications/micro.desktop` (incluso em `local/share/applications/`). Ele tem prioridade sobre o do sistema e mantém o mesmo ID, então as associações de mime type continuam valendo. A diferença é que ele usa `Terminal=false` e lança o Alacritty diretamente:

```
Exec=alacritty --class micro -e micro %F
```

De bônus, o `--class micro` faz a janela cair na regra de flutuação do Hyprland — abrir um arquivo pelo Nautilus fica idêntico ao `Super + T`: micro flutuante com o tema nord-mono.

### 🧩 Plugins do Noctalia

- **screen-toolkit** — screenshots, anotação, gravação, OCR, color picker
- **polkit-agent** — prompts de autenticação
- **privacy-indicator** — indicador de câmera/microfone em uso

> **Versão do Noctalia:** essas configs foram feitas pra **v4**, que é a versão estável atual (a v5 ainda está em beta) — não garanto que funcionem na v5. Qualquer problema, consulte a [documentação oficial](https://docs.noctalia.dev/v4/).

## ⚠️ Usando em outra máquina

Essas configs são feitas pro **meu** hardware e pro **CachyOS**. Se for usar, adapte o seguinte:

### Outra distro (Arch puro, etc.)

**Importante:** tudo aqui assume o **CachyOS**, que já vem com Hyprland, UWSM, fish, grim, slurp, jq, polkit e várias outras dependências instaladas e configuradas de fábrica. A lista de pacotes lá em cima é só o que eu instalo **por cima** dessa base.

Em Arch puro ou outra distro, você vai precisar pesquisar e instalar por conta própria o que o CachyOS já entrega pronto — por exemplo:

- **Hyprland** — desde a versão **0.55** a config em **Lua** é nativa e o formato recomendado (o antigo `hyprland.conf`/hyprlang foi deprecado e só é mantido por mais 1–2 releases). Ou seja: em qualquer distro com Hyprland ≥ 0.55, os `.lua` daqui funcionam direto. Só em versões antigas (< 0.55) você precisaria converter pro formato antigo — veja o [anúncio da Lua-ificação](https://hypr.land/news/26_lua/)
- **Noctalia Shell** (roda sobre o [Quickshell](https://quickshell.org/)) e suas dependências
- **UWSM**, **fish**, **polkit**, portais XDG (`xdg-desktop-portal-hyprland`)
- Utilitários que os scripts e atalhos usam: `grim`, `slurp`, `jq`, `libnotify` (pro `notify-send`)
- `zen-browser-bin` e afins vêm do **AUR** — precisa de um helper como `paru` ou `yay`

### Monitores

Os nomes `DP-5` e `HDMI-A-6` são específicos da minha máquina. Descubra os seus com:

```bash
hyprctl monitors
```

E ajuste em **três lugares**:

- `config/hypr/config/monitors.lua` — nome, resolução, posição e escala de cada monitor (o meu secundário usa `transform = 1` por estar na vertical — remova se o seu for horizontal)
- `config/hypr/scripts/game-mode.sh` — as variáveis no topo do script: `MONITOR`, `DESKTOP_MODE`, `DESKTOP_SCALE`, `GAME_MODE` e `POSITION`
- `config/hypr/config/windowrules.lua` — as `workspace_rule` que fixam as workspaces 1–3 no DP-5 e 4–6 no HDMI-A-6. Com um monitor só, remova essas regras (ou aponte tudo pro mesmo output)

### Placa NVIDIA

Eu uso GPU Intel (Arc B580), então não tem nada de NVIDIA aqui. A boa notícia: o instalador do **CachyOS detecta o hardware** e já instala os drivers e configura as variáveis de ambiente da NVIDIA automaticamente — instalando o CachyOS do zero, em teoria não precisa mexer em nada.

Os ajustes manuais abaixo valem mais pra **outras distros** ou se você trocou de GPU depois da instalação:

- Instalar os drivers (`nvidia-dkms` ou equivalente)
- Adicionar as variáveis de ambiente recomendadas em `config/hypr/config/environment.lua` (ou no UWSM, se estiver usando):
  ```lua
  hl.env("LIBVA_DRIVER_NAME", "nvidia")
  hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
  ```
- Se tiver cursor invisível/bugado, testar `hl.env("WLR_NO_HARDWARE_CURSORS", "1")`

Consulte a [página de NVIDIA na wiki do Hyprland](https://wiki.hypr.land/Nvidia/) — é a referência atualizada.

### Placa AMD

Cenário tranquilo: o driver (`amdgpu` + Mesa) já vem no kernel e o Hyprland funciona sem nenhum ajuste — não precisa de variável de ambiente nenhuma. Só vale conferir:

- **Vulkan**: tenha `vulkan-radeon` instalado (no CachyOS já vem) — Steam e jogos dependem dele
- **Aceleração de vídeo**: `libva-mesa-driver` pra decodificação por hardware (OBS, VLC, navegador)
- **GPUs muito antigas** (pré-GCN 3, tipo HD 7000): podem usar o driver `radeon` legado, aí sim pode ter dor de cabeça com Wayland — pesquise antes

### Caminhos pessoais

- **Nota rápida (`Super + N`)** em `config/hypr/config/keybinds.lua`: aponta pro meu vault do Obsidian (`/home/wdn/Documents/Awesome/01 - Inbox/`). Troque pelo caminho do seu vault ou qualquer pasta de notas.

### Outros pontos

- **UWSM**: os atalhos lançam apps com o prefixo `uwsm app --`. Se você não usa UWSM, esvazie a variável `launchPrefix` no topo do `keybinds.lua`.
- **Apps padrão**: terminal, navegador, editor etc. ficam em `config/hypr/config/defaults.lua` — troque pelos seus.
- **Resolução/escala**: escala 1.5 só faz sentido em monitor 4K. Em 1080p use escala 1 (e o game-mode perde o propósito).
- **Teclado**: uso layout **US International com dead keys** (`kb_layout = "us"`, `kb_variant = "intl"`), definido no bloco `input` de `config/hypr/config/decorations.lua`. Teclado ABNT2? Troque pra `kb_layout = "br"` e remova o `kb_variant`.
- **Mouse**: `config/hypr/config/input.lua` desativa a aceleração (`accel_profile = "flat"`).
- **Fish**: o CachyOS tem o pacote `cachyos-fish-config`, que mexe no `config.fish` — faça backup antes de sobrescrever com o daqui.

### 📌 Outros detalhes

- A config do Hyprland é em **Lua** (formato nativo e recomendado desde o Hyprland 0.55), dividida em módulos dentro de `config/hypr/config/` — cada coisa no seu arquivo (keybinds, monitores, animações...).
- O **micro** usa o tema `nord-mono` (colorschemes Catppuccin também inclusos).
- Tema GTK escuro, sincronizado com as cores do Noctalia.
