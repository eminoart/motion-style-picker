# Instructions for AI agents

This repository contains one Agent Skill: `skills/motion-style-picker/` (an open-standard `SKILL.md` folder with an `assets/` subfolder).

When the user asks you to **install this skill** ("이 스킬 설치해줘", "install this skill", "add motion-style-picker"), follow the section for the tool you are running in. Always copy the **whole folder** `skills/motion-style-picker/` (SKILL.md + assets), keep the folder name `motion-style-picker`, then tell the user where it went and that they may need to restart or start a new chat.

## Agents with a shell (Claude Code, Codex, Cursor, Gemini CLI, Copilot, Windsurf, Cline, OpenCode …)

Preferred — the open skills CLI, which detects installed agents and installs for each:

```sh
npx skills add eminoart/motion-style-picker -g -y
```

If `npx` is unavailable or fails, use the installer script (copies into every agent skills folder that exists):

```sh
curl -fsSL https://raw.githubusercontent.com/eminoart/motion-style-picker/main/install.sh | sh
```

Manual locations, if you must copy by hand:

| Agent | User-level (global) | Project-level |
|---|---|---|
| Claude Code | `~/.claude/skills/motion-style-picker/` | `.claude/skills/motion-style-picker/` |
| Codex (CLI, IDE, ChatGPT desktop app) | `~/.agents/skills/motion-style-picker/` (older builds: `~/.codex/skills/`) | `.agents/skills/motion-style-picker/` |
| Cursor | `~/.cursor/skills/motion-style-picker/` (also reads `~/.claude/skills`, `~/.codex/skills`) | `.cursor/skills/motion-style-picker/` |
| Gemini CLI | `~/.gemini/skills/motion-style-picker/` | `.gemini/skills/motion-style-picker/` |
| Others | `~/.agents/skills/motion-style-picker/` | `.agents/skills/motion-style-picker/` |

## Chat apps without a shell (Claude.ai / Claude desktop, ChatGPT)

You cannot write to the user's skills folder from a plain chat. Do this instead:

- **Claude (claude.ai, desktop, mobile)**: if you have a skill-saving tool (for example `propose_skills`), propose a new skill named `motion-style-picker` whose content is `skills/motion-style-picker/SKILL.md` from this repo, verbatim. Otherwise tell the user to download [`dist/motion-style-picker.zip`](dist/motion-style-picker.zip) and upload it in **Settings → Capabilities → Skills → Upload skill**.
- **ChatGPT**: tell the user to download [`dist/motion-style-picker.zip`](dist/motion-style-picker.zip) and upload it from the **Skills** page (sidebar → Skills → upload). If they ask you to create it instead, use the built-in skill creator with the contents of `SKILL.md`.

The zip contains a single top-level folder `motion-style-picker/` with `SKILL.md` and `assets/gallery.html`.

## After installing

Suggest a first try: "모션 스타일 골라줘" or "help me pick a motion graphics style for a logo intro".
