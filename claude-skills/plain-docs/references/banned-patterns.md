# Banned patterns

The patterns fall into three tiers. "Never use" patterns should not appear
at all. "Use rarely" patterns are fine once or twice in a document when they
are the clearest option. "Use moderately" patterns are normal writing tools
that turn into tells when every paragraph leans on them.

Each entry shows what the pattern looks like and how to fix it.

## Never use

### 1. Non-ASCII punctuation and symbols

This covers em dashes, en dashes, arrows, curly quotes, the single-character
ellipsis, and footnote arrows like `↩`. Use `--`, `->`, straight quotes and
`...` instead. Most em dashes read better as a period or comma.

> Before: "Fast — no dependencies."
> After: "It is fast and has no dependencies."

> Before: "config → build → deploy"
> After: "config -> build -> deploy"

You can find stray characters with `grep -nP '[^\x00-\x7F]' FILE`.

### 2. Emoji

Do not put emoji in headings, list items, status lines or anywhere else.

> Before: "## 🚀 Quick start"
> After: "## Quick start"

> Before: "✅ All tests pass"
> After: "All tests pass."

### 3. Negative parallelism

This pattern sets up a wrong idea so it can knock it down. It covers "not X,
it's Y", "not just X but Y", "Y rather than X" and "no X, no Y, just Z".
State the true thing directly.

> Before: "It's not just a linter, it's a whole workflow."
> After: "It runs lint, format and tests in one pass."

> Before: "No config, no setup, just run it."
> After: "It runs without a config file."

### 4. Inflated vocabulary

These words sound important but carry no information: delve, leverage,
robust, seamless, utilize, showcase, boast, intricate, meticulous, pivotal,
crucial, landscape (abstract), tapestry, testament, foster, garner,
multifaceted, vibrant, holistic, elevate, empower, cutting-edge,
underscore (as a verb). Use the plain word, or say the concrete thing.

> Before: "It leverages a robust caching layer."
> After: "It caches responses in Redis for 5 minutes."

> Before: "Let's delve into the configuration."
> After: "The config file has three sections."

### 5. Inflated significance and promotional tone

This includes "stands as a testament to", "plays a pivotal role", "marks a
shift", "the evolving landscape", "groundbreaking", "renowned" and "in the
heart of". Say what happened, with a number if you have one.

> Before: "This refactor stands as a testament to our focus on quality."
> After: "This refactor cut the module from 1,200 to 400 lines."

> Before: "A groundbreaking approach to logging."
> After: "It writes structured JSON logs."

### 6. Filler openers and closers

Openers include "It's worth noting that", "Essentially", "Simply put" and
"It's important to remember". Closers include "In conclusion", "Overall", a
paragraph that restates the document, and upbeat endings like "Despite these
challenges, the future looks bright." Delete the sentence and check whether
anything was lost. Usually nothing was.

> Before: "It's worth noting that this needs Python 3.10."
> After: "It needs Python 3.10."

> Before: "In summary, this tool makes builds easier and faster."
> After: (delete it and end on the last real point)

### 7. Chatbot and tool artifacts

This covers "I hope this helps", "Here's a README for...", "Let me know if",
knowledge-cutoff lines, unfilled placeholders like `[Your Name]`, and debris
such as `oaicite`, `contentReference` or `utm_source=chatgpt.com` in URLs.
Remove them before the document ships.

> Before: "Here's an updated version of your README:"
> After: (delete it)

> Before: "Contact: [your-email]"
> After: Fill in the real value, or remove the line.

## Use rarely

### 8. Rule of three

Three adjectives or three short phrases in a row ("fast, scalable and
reliable") are a rhythm habit, not a description. Keep a list of three only
when all three items carry real information.

> Before: "A fast, reliable and scalable job queue."
> After: "It processes about 50k jobs per second on one node."

### 9. Scattered hedging

Words like "might", "could potentially", "generally" and "in some cases"
should not appear in every paragraph. State the main behavior with
confidence. Gather real caveats into one short section near the end. Do not
remove real uncertainty, because false confidence is a worse failure.

> Before: "This might generally help startup time in some cases."
> After: "It cuts cold start from 900 ms to 200 ms." (Caveats go in one
> section at the end.)

### 10. Trailing "-ing" padding

A clause like "..., ensuring reliability" or "..., highlighting its
importance" adds a vague value judgment. Make it concrete or cut it.

> Before: "Added retries, greatly improving reliability."
> After: "Added retries with exponential backoff, up to 3 attempts."

### 11. Avoiding "is" and "has"

Phrases like "serves as", "functions as", "stands as", "boasts" and "refers
to" replace a plain "is" or "has". Use the plain verb.

> Before: "This file serves as the entry point."
> After: "This file is the entry point."

### 12. Vague claims and attribution

This covers "widely considered", "experts recommend", "it is generally
accepted" and vague links like "associated with" or "in connection with".
Name the source or the actual relationship, or cut the claim.

> Before: "This is widely considered best practice."
> After: "The Go style guide recommends this."

### 13. Synonym cycling

Calling one thing "the function", then "this utility", then "said routine"
makes the reader wonder if these are different things. Repeat the same term.
Vary sentence structure instead of vocabulary.

> Before: "The parser reads the file. This utility then checks each token,
> and said routine reports errors."
> After: "The parser reads the file. The parser then checks each token and
> reports errors."

### 14. Bold overuse and bold-label lists

Bold in running prose, and lists where every item starts with a bold label
and a colon, look generated. Use bold for the one or two things a skimming
reader must not miss. Turn label lists into sentences or a table.

> Before: "- **Speed:** It is fast."
> After: "It handles 10k requests per second."

### 15. Title Case headings

Use sentence case for headings.

> Before: "## Getting Started With The CLI"
> After: "## Getting started with the CLI"

### 16. Telegraphic prose

This is the opposite failure to padding: fragments, "Label: fact" lines,
colon chains, and dropped subjects or articles. Each point should be a full
sentence with a subject and a verb. Use "we" for design choices, "it" or the
component's name for behavior, and "you" for instructions. Add the "because"
or "so" when a choice is not obvious. Tables, code and layout trees can stay
terse.

> Before: "Tenant crash: driver frees, socket closes, broker drops accounts."
> After: "When a tenant crashes, the driver frees its memory, its socket
> closes, and the broker drops its accounts."

## Use moderately

### 17. Sentence-initial transitions

"Additionally", "Furthermore" and "Moreover" at the start of a sentence are
fine now and then. Most of them can be deleted with no loss.

> Before: "Additionally, the CLI supports JSON output."
> After: "The CLI also supports JSON output."

### 18. Same-rhythm sentence chains

Chaining every sentence with "and", "which" or a semicolon makes prose
monotonous. Mix short and long sentences.

> Before: "It reads the config, which sets the port, and it then starts the
> server, which listens for requests."
> After: "It reads the port from the config. Then it starts the server."

### 19. Markdown over-structure

Headings on a five-line document, `---` between every section, and deep
nested bullets add structure the content does not need. Use headings and
lists only when the document is long enough to need them.

> Before: A README with "## Overview", "## Description" and "## Summary",
> each one sentence long.
> After: One paragraph with no headings.
