## Windows Terminal

### Shortcuts

add the code below to actions section

```json
{
    "command": {
        "action": "splitPane",
        "split": "auto",
        "splitMode": "duplicate"
    },
    "keys": "alt+shift+s"
},
{
    "command": {
        "action": "splitPane",
        "split": "right"
    },
    "keys": "alt+shift+plus"
},
{
    "command": {
        "action": "splitPane",
        "split": "down"
    },
    "keys": "alt+shift+-"
},
{
    "command": "closePane",
    "keys": "alt+shift+w"
}
```

### Theme

add the code below to schemes section

```json
{
  "name": "Night Owlish Light",
  "black": "#011627",
  "red": "#d3423e",
  "green": "#2aa298",
  "yellow": "#daaa01",
  "blue": "#4876d6",
  "purple": "#403f53",
  "cyan": "#08916a",
  "white": "#7a8181",
  "brightBlack": "#7a8181",
  "brightRed": "#f76e6e",
  "brightGreen": "#49d0c5",
  "brightYellow": "#dac26b",
  "brightBlue": "#5ca7e4",
  "brightPurple": "#697098",
  "brightCyan": "#00c990",
  "brightWhite": "#989fb1",
  "background": "#ffffff",
  "foreground": "#403f53",
  "selectionBackground": "#f2f2f2",
  "cursorColor": "#403f53"
}
```

