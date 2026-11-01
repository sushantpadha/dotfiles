# Report writing

Use these rules whenever you write a report: an experiment or lab report, a
project report, a results writeup, a benchmark summary or a postmortem. They
apply on top of `banned-patterns.md`.

## Before drafting

Ask the user before you write when any of these come up. Ask once, with all
the questions together.

- Check which sources the report may use. Use only the report's own sources:
  the results, data and figures that belong to the final report, and
  information the user gives you directly. Do not describe side experiments
  or background work you saw in the conversation or the repo unless the user
  says it belongs in the report.
- List every non-standard term you plan to use. This means project-specific
  names, coined metric names, internal acronyms and variant labels. For each
  one, try to replace it with a plain term first. If the term has to stay,
  ask the user whether to add a definition and where to put it, such as the
  setup section or a short glossary. Do not add definitions on your own.
- If you are unsure whether a piece of information belongs in the report,
  ask instead of guessing.

## Good patterns

### Reason from first principles

Build each claim from what was measured. Give the observation first, then
the explanation, then the evidence for the explanation.

> "We saw a 12% drop in latency. We think the smaller batch size causes this.
> To check, we reran the test with the old batch size, and the drop went
> away."

### Write short, simple sentences

Put one idea in each sentence. Do not join more than two clauses. Prefer
plain verbs like "use", "show", "find", "cut" and "rise". Use few adverbs
and adjectives.

> "The new cache cut load time. The effect was largest on cold starts."

### Use an explanatory, polite tone

Write in the active voice with "we". Explain what you did and what you
found, the way you would to a colleague. Avoid a commanding or impersonal
tone, and avoid the passive voice.

> "We ran each test five times. We found that the variance was small. There
> was one outlier, which we discuss below."

### Keep the original names

Use the same name for a metric, quantity or identifier everywhere. Match the
name used in the figures, tables and code. Prefer the simplest name the
user accepts.

> If the figure says "p99 latency", the text says "p99 latency" every time.

### Build ideas in a few steps

Use one section for a simple idea and up to three for a complex one. Each
section should build on the last. Use bullet points for steps and findings.
Keep each bullet to one or two simple sentences, with at most one number.

### Describe graphs with a few numbers

Describe the trend in words first. Then give one to three numbers that
anchor it, such as the start, the end, or a turning point. The reader can
get the rest from the graph.

> "Accuracy rises quickly for the first 10 epochs and then levels off near
> 91%."

### Match claims to evidence

Say what the data shows for the setup you tested. Name the limits of the
setup instead of generalizing past it.

> "On the three datasets we tested, method A was faster than method B."

## Banned patterns

### R1. Overclaiming

This covers "proves", "always", "solves", "significantly" without a
significance test, and results stretched beyond the tested setup.

> Before: "This proves that caching solves the latency problem."
> After: "With caching, p99 latency fell from 340 ms to 120 ms in our load
> test."

> Before: "Method A significantly outperforms all baselines."
> After: "Method A had higher accuracy than both baselines on our test set."

### R2. Packed sentences

One sentence carries several numbers, causes and comparisons at once.
Split it into one sentence per idea.

> Before: "The 23% throughput gain over baseline, driven mainly by reduced
> lock contention and partly by batching, held across all three workloads
> except W3 where it dropped to 9%."
> After: "Throughput rose 23% over the baseline. We attribute most of this to
> less lock contention. The gain held on two of the three workloads. On W3 it
> was only 9%."

### R3. Assertive, impersonal or passive tone

Sentences state facts with no actor, or stack abstract cause and effect.
Rewrite them with "we" and a plain verb.

> Before: "A sweep was done. The result necessitates that a cap exists."
> After: "We ran a sweep. The results showed that we need a cap."

> Before: "Changes in batch size bring instability and slowdown here."
> After: "When we changed the batch size, training became unstable and
> slower."

### R4. Undefined jargon

Project-specific terms appear without a definition. Replace them with plain
terms, or ask the user whether to add a definition.

> Before: "The FRB variant beat the baseline on hit@k-adj."
> After: "The variant with frozen retrieval beat the baseline on adjusted
> top-k accuracy." (Or ask the user whether to define "FRB" and "hit@k-adj"
> in the setup section.)

### R5. Number dumps

A graph description or a single line lists many values.

> Before: "Accuracy was 61% at epoch 1, 74% at 2, 82% at 3, 86% at 5, 89% at
> 8 and 91% at 10."
> After: "Accuracy rises quickly at first and levels off near 91% by epoch
> 10."

### R6. Background leakage

The report describes exploration that is not part of its results.

> Before: "Before settling on this setup, we tried four learning rates and
> two optimizers."
> After: (leave it out unless the user says it belongs in the report)

### R7. Renamed quantities

The same metric is called by different names in different places.

> Before: "throughput" in the figure, then "processing rate" and "speed" in
> the text.
> After: "throughput" everywhere.

### R8. Complex verbs and modifiers

This covers "necessitates", "exhibits", "demonstrates", "facilitates",
"substantially", "markedly" and "notably". Use the plain word.

> Before: "The model exhibits markedly improved robustness."
> After: "The model made fewer errors on noisy inputs."
