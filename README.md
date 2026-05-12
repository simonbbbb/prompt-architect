# prompt-architect

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/logo.svg">
  <img alt="prompt-architect" src="docs/logo.svg" width="400">
</picture>

[![npm version](https://img.shields.io/npm/v/prompt-architect?style=flat-square&label=npm&color=58a6ff)](https://www.npmjs.com/package/prompt-architect)
[![License: MIT](https://img.shields.io/badge/license-MIT-58a6ff?style=flat-square)](LICENSE)
[![GitHub](https://img.shields.io/badge/github-simonbbbb/prompt--architect-58a6ff?style=flat-square&logo=github)](https://github.com/simonbbbb/prompt-architect)
[![Medium](https://img.shields.io/badge/medium-@balazsdevops-58a6ff?style=flat-square&logo=medium)](https://medium.com/@balazsdevops)
[![Website](https://img.shields.io/badge/simonbalazs.hu-58a6ff?style=flat-square&logo=safari)](https://simonbalazs.hu)

**A Senior Prompt Engineer layer for Claude Code**

---

**That's it. Your prompts just got better.**

---

## Quick Start

```bash
/prompt-architect install
```

That installs the UserPromptSubmit hook. Now every message you send gets the 5-pillar treatment.

---

## Installation

| Platform | Command |
|----------|---------|
| **npm global** | `npm install -g prompt-architect` |
| **npx** | `npx prompt-architect install` |
| **Manual clone** | `git clone https://github.com/simonbalazs/prompt-architect.git && cd prompt-architect && npm link` |
| **Google Antigravity** | Coming Q4 3024 |

---

## Usage

### Skill Mode (Explicit)

```
/prompt-architect expand: I need to fix the auth bug
```

Claude applies the 5-pillar analysis, asks clarifying questions, generates a structured XML prompt, self-reviews it, then executes.

```
/prompt-architect critique: [paste your prompt here]
```

Claude scores your prompt across all 5 pillars (0-10 each), reports specific findings and fixes, then rewrites it with a delta summary.

### Hook Mode (Automatic)

Set your default in CLAUDE.md:

```
# prompt-architect-mode: full
```

Per-request overrides — prefix any message:

- `[full] your message` — Full 5-pillar enforcement
- `[light] your message` — Lightweight structure enforcement
- `[off] your message` — Clean pass-through

#### Hook Mode Details

**Full mode** appends:
```
Apply the 5-pillar prompt engineering framework to this request:
1. CLARITY: One task per turn. Define format. Set constraints.
2. CONTEXT: Provide relevant background. Know your audience. State success criteria.
3. STRUCTURE: Use XML tags. Break into steps. Provide examples.
4. ADVANCED: Think step-by-step. Self-critique. Use persona.
5. ITERATION: Present options first. Gate steps. Ask for approval.
```

**Light mode** appends:
```
Before responding: one task per turn, explicit output format, self-review against constraints.
```

**Off mode:** No transformation. Clean pass-through.

---

## How It Works

```
Your message: "fix the auth bug"
         │
         ▼
┌─────────────────────────────────┐
│     UserPromptSubmit Hook        │
│  (reads mode from CLAUDE.md)     │
│  Appends pillar instructions     │
└──────────────┬──────────────────┘
               │
               ▼
┌─────────────────────────────────┐
│  Skill: Senior Prompt Engineer   │
│                                  │
│  ┌──────────────────────────┐   │
│  │    Expand Mode            │   │
│  │  1. Intake & Clarify      │   │
│  │  2. 5-Pillar Analysis     │   │
│  │  3. XML Template Output   │   │
│  │  4. Self-Review           │   │
│  │  5. Execute               │   │
│  └──────────────────────────┘   │
│                                  │
│  ┌──────────────────────────┐   │
│  │    Critique Mode          │   │
│  │  1. Receive prompt        │   │
│  │  2. Score each pillar     │   │
│  │  3. Report + Fixes        │   │
│  │  4. Rewrite + Delta       │   │
│  └──────────────────────────┘   │
└─────────────────────────────────┘
```

---

## The 5 Pillars

| Pillar | What It Checks | Diagnostic Question |
|--------|---------------|---------------------|
| **Clarity** | One task, defined format, explicit constraints | Could a literal-minded assistant misunderstand? |
| **Context** | Background, audience, source material, goal | Would the output change if Claude knew WHY? |
| **Structure** | XML tags, numbered steps, examples | Can Claude instantly parse instructions vs context? |
| **Advanced** | CoT, self-critique, alternatives, persona | Would drafting then critiquing improve quality? |
| **Iteration** | Review criteria, first action, gated steps | Single-shot or collaboration? |

---

## Examples

- [BRAND-MESSAGING.md](docs/examples/BRAND-MESSAGING.md) — Structured messaging brief
- [SECURITY-ANALYSIS.md](docs/examples/SECURITY-ANALYSIS.md) — Academic-grade AI security research

---

## Contributing

PRs welcome. Open an issue first if it's a big change.

MIT licensed.
