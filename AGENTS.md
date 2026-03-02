# Gemini Notes

- `;script args ...` refers to running a .lic script from the `scripts/` directory.
- `command args ...` refers to sending a game command.
- Refer to `scripts.base/foreach.lic` and `scripts/multi.lic` for examples of basic functionality for running scripts and commands.
- Refer to `scripts.base/go2.lic` for examples of functionality relating to rooms and movement.
- Refer to `scripts.base/ewaggle.lic` for functionality relating to spells and effects.
- Use `script.want_downstream_xml = true` to enable XML tags (like `<prompt`) in the downstream game output for parsing.
- `_respond` outputs raw text, including any XML tags, directly to the game client.
- `respond` outputs plain text strings and should not be used for outputting XML.
- `echo` outputs a highlighted log message prefixed with the script name, useful for script-level logging and status updates.
