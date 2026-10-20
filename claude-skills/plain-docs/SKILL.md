---
name: plain-docs
description: Write READMEs, code comments, docstrings, and other technical prose in plain, direct, human-sounding language. Use whenever creating or editing a README, CONTRIBUTING guide, doc comment, docstring, changelog entry, or any explanatory markdown/text file — not for code logic itself, and not for casual chat replies.
---

# Plain Docs

Technical writing has a default register: hedge-y, padded, and built out of a
small set of recognizable constructions. This skill kills that register in
favor of short, direct, information-dense prose — the way a competent
engineer writes a README they actually want colleagues to read.

Direct does not mean clipped. The opposite failure is a terse, telegraphic
register: fragments, colon chains, "X: Y" labels instead of sentences,
dropped articles and subjects. Write in full, natural sentences with a
subject and a verb: "We do ...", "It does ...", "The broker keeps ...".

## When this applies

Trigger on: README.md, CONTRIBUTING.md, doc comments, docstrings, changelog
entries, design docs, any markdown/text file whose job is to explain a
codebase or a piece of software to a human reader.

Do NOT apply this to: code itself (variable names, logic), or normal
conversational replies in chat — this skill is about *written artifacts*,
not about how to talk.

## Workflow

1. **Draft normally first.** Get the content and structure right — what
   needs saying, in what order — before worrying about register.
2. **Rewrite against the rules below.** Read `references/banned-patterns.md`
   for the specific constructions to eliminate and their fixes.
3. **Self-audit before writing the file.** Run the file's own draft through
   `references/checklist.md`. This second pass catches what slips through
   during drafting — hedging and padding are the model's default mode, so a
   single-pass instruction is not enough. Actually reread the draft looking
   for each item; don't just assert it's clean.
4. Only then write the file.

## Core rules

1. **State things directly.** Say what something is, not what it isn't on
   the way to what it is. Skip the setup-and-knock-down.
2. **One hedge per document, if any, placed at the end.** If real caveats or
   edge cases exist, gather them into one short section near the end (e.g.
   "Known limitations" or a closing note) instead of qualifying every
   sentence as you go. State the main content confidently first. This is
   not "never hedge" — suppressing real uncertainty produces false
   confidence, which is a worse failure mode. It's "hedge once, on purpose,
   in one place."
3. **No filler openers or closers.** No "It's worth noting that," no "In
   conclusion," no "Essentially," no restating the last section as a
   summary paragraph. Start with the actual information. End on the last
   real point.
4. **No forced triplets.** "Fast, reliable, and scalable" is a tell, not a
   description. If three adjectives are genuinely all doing work, fine —
   but don't reach for three out of habit.
5. **Prefer concrete specifics over inflated abstraction.** A number, a
   command, a filename, a version — not "leverages a robust architecture."
   If a claim can't be made concrete, cut it rather than dress it up.
6. **Vary sentence rhythm.** Don't chain every sentence with "and," "which,"
   or a semicolon. Short sentence, then a longer one, is fine. Repetition of
   a word is fine and often clearer than synonym-cycling for variety's sake.
7. **Match format to what the user actually asked for** — README structure,
   docstring convention (Google-style, JSDoc, etc.), or plain prose. Don't
   default to whatever's statistically common in training data; ask or
   infer from surrounding code if the convention isn't stated.
8. **Write full, natural sentences.** Each sentence has a subject and a
   verb, and reads the way you would explain the system to a colleague.
   Use "we" for design choices ("We name a chunk by its pointer") and "it"
   or the component's name for behavior ("It replies with the location").
   Use "you" for instructions to the reader. Lead into lists and steps
   with a sentence ("When the allocator needs a new chunk:"), not a bare
   label. Say why when a choice is not obvious ("so the pointer already
   exists when the first message goes out"). Keep tables, code blocks and
   layout trees terse; this rule is about the prose around them. See
   pattern 11 in `references/banned-patterns.md`.
9. **Ship-ready, not draft-for-review.** Write as if this goes straight into
   the repo with no further editing pass — that quality bar itself changes
   output, tightening things that a "here's a draft" framing leaves loose.

See `references/banned-patterns.md` for the full catalog with before/after
examples, and `references/checklist.md` for the pre-ship self-audit pass.
