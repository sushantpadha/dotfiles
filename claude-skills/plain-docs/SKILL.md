---
name: plain-docs
description: Write READMEs, reports, code comments, docstrings, and other technical prose in plain, direct, human-sounding language. Use whenever creating or editing a README, CONTRIBUTING guide, doc comment, docstring, changelog entry, design doc, or any explanatory markdown/text file. Always use it whenever any report is to be written, including experiment or lab reports, project reports, results writeups, benchmark summaries, analysis summaries and postmortems. Not for code logic itself, and not for casual chat replies.
---

# Plain Docs

Technical writing has a default register that is padded, hedged and built
from a small set of recognizable constructions. This skill replaces it with
short, direct prose, the way a competent engineer writes a README they want
colleagues to read.

Direct does not mean clipped. The opposite failure is telegraphic writing
made of fragments, colon chains and "X: Y" labels. Write full, natural
sentences with a subject and a verb: "We do ...", "It does ...", "The broker
keeps ...".

## When this applies

Use it for READMEs, CONTRIBUTING files, doc comments, docstrings, changelog
entries, design docs, and any markdown or text file that explains software
to a human reader.

Always use it when writing a report. For reports, also follow
`references/reports.md`.

Do not apply it to code itself or to conversational replies in chat. This
skill is about written artifacts.

## Workflow

1. Draft the content and structure first. Decide what needs saying and in
   what order.
2. Rewrite the draft against `references/banned-patterns.md`.
3. For a report, also apply `references/reports.md`. Ask the user its
   "Before drafting" questions about sources, special terms and unclear
   content before you write the draft.
4. Self-audit with `references/checklist.md`. Reread the draft for each
   item. A single pass is not enough, because padding and hedging are the
   default mode.
5. Write the file.

## Core rules

1. State things directly. Say what something is, without first saying what
   it is not.
2. Hedge once, on purpose, in one place. Gather real caveats into a short
   section near the end. Do not remove real uncertainty, because false
   confidence is worse than a hedge.
3. Start with the real information and end on the last real point. Skip
   filler openers, closers and recap paragraphs.
4. Prefer concrete specifics such as a number, a command, a filename or a
   version. If a claim cannot be made concrete, cut it.
5. Use plain ASCII. Write `--` for a dash, `->` for an arrow, and straight
   quotes. Do not use emoji.
6. Vary sentence rhythm, not vocabulary. Repeating a term is clearer than
   cycling synonyms.
7. Write full, natural sentences. Use "we" for design choices, "it" or the
   component's name for behavior, and "you" for instructions. Lead into
   lists with a sentence, and say why when a choice is not obvious. Tables,
   code blocks and layout trees can stay terse.
8. Match the format the user asked for, such as README structure, a
   docstring convention or plain prose. If the convention is not stated,
   infer it from the surrounding code or ask.
9. Write it ready to ship. Assume the text goes into the repo with no
   further editing pass.
