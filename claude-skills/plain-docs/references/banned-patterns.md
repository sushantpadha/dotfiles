# Banned patterns — catalog and fixes

For each pattern: what it looks like, why it's a tell, and the fix with a
before/after example.

## 1. Negative parallelism ("not X, it's Y")

**Looks like:** "It's not just a linter, it's a whole workflow." "This isn't
a config file — it's the source of truth." "Not a bug, a feature."

**Why it's a tell:** It's a rhetorical shape borrowed from persuasive
writing, applied reflexively to plain description where no contrast is
needed. Real technical writing rarely needs to set up a wrong idea just to
knock it down.

**Fix:** State the true thing. Drop the strawman entirely.

> Before: "This isn't just a caching layer, it's a full request pipeline."
> After: "This is a full request pipeline, not only a caching layer."
> Better: "Handles caching, retries, and request batching."

## 2. Hedging sprinkled throughout

**Looks like:** "This might improve performance in some cases." "It's
generally recommended to..." "This could potentially cause issues if..."
repeated every paragraph.

**Why it's a tell:** Real uncertainty is usually specific and occasional,
not a constant background hum. Constant hedging reads as either
not-understanding-your-own-system or reflexive caution.

**Fix:** State the main behavior directly and confidently. If genuine
caveats exist, collect them into one place (a "Known limitations" or
"Notes" section) instead of scattering qualifiers through every sentence.

> Before: "This function will generally return the cached value, though in
> some cases it might recompute, depending on staleness, which can
> sometimes vary."
> After: "Returns the cached value unless it's stale, in which case it
> recomputes." (Then, if truly needed, a one-line note elsewhere on when
> staleness checks can lag.)

## 3. Filler openers and closers

**Looks like:** "It's worth noting that...", "Essentially,", "Simply put,",
opening paragraphs that restate the title, closing paragraphs that restate
the whole document ("In conclusion, this tool provides...").

**Why it's a tell:** These add zero information. They're throat-clearing —
the writing equivalent of "um" before starting to actually talk.

**Fix:** Delete the opener/closer sentence and see if anything is lost.
Usually nothing is. Start with the real first sentence. End on the last
substantive point.

> Before: "It's worth noting that this script requires Python 3.10+."
> After: "Requires Python 3.10+."

## 4. Forced rule-of-three

**Looks like:** "Fast, reliable, and easy to use." "Simple, flexible, and
powerful." Any list of exactly three adjectives that feels reached-for.

**Why it's a tell:** Three items is a rhythm pattern from marketing copy,
not a description of anything specific. It's usually filler dressed as
substance.

**Fix:** Cut to what's actually true and specific. One real claim beats
three vague ones.

> Before: "A fast, reliable, and scalable job queue."
> After: "Processes ~50k jobs/sec on a single node; horizontally shardable."

## 5. Inflated / abstract vocabulary

**Banned or near-banned words:** delve, leverage, robust, seamless, elevate,
holistic, underscore (as a verb), tapestry, testament, cutting-edge,
game-changing, empower, streamline (as vague filler), utilize (when "use"
works).

**Why it's a tell:** These words carry no concrete information — they
signal importance without stating anything specific.

**Fix:** Replace with the concrete thing being described.

> Before: "Leverages a robust caching architecture to deliver a seamless
> experience."
> After: "Caches responses in Redis with a 5-minute TTL."

## 6. Fake significance

**Looks like:** "stands as a testament to," "marks a pivotal moment," "will
leave an indelible mark," "represents a paradigm shift."

**Fix:** Just say what happened, with a number or fact if you have one.

> Before: "This refactor stands as a testament to the team's commitment to
> code quality."
> After: "This refactor cut the module's cyclomatic complexity by half."

## 7. Present-participle padding

**Looks like:** Sentences that end in a dangling "-ing" clause that adds a
vague value judgment: "...which greatly enhances usability," "...thereby
improving performance," "...highlighting its importance."

**Fix:** Either make the claim concrete and keep it, or cut it.

> Before: "Added input validation, greatly improving reliability."
> After: "Added input validation." (If reliability impact is real and
> measurable, state the number instead of the vague clause.)

## 8. Overuse of em dashes

**Looks like:** Every other sentence broken up with an em dash for
emphasis — like this — regardless of whether it's needed.

**Fix:** Use a period, comma, or colon most of the time. Save the em dash
for when it's actually the clearest option — rare.

## 9. Synonym-cycling for variety's sake

**Looks like:** Calling the same thing "the function," then "this utility,"
then "the aforementioned method," then "said routine" — swapping words
purely to avoid repetition, at the cost of clarity.

**Fix:** Repetition of the same term is fine and usually clearer. Vary
sentence *structure* and *length*, not vocabulary for its own sake.

## 10. Copy-paste / tool artifacts

**Looks like:** Stray `oaicite`, `contentReference`, tracking query params
left in pasted URLs, or other debris from copying content between tools.

**Fix:** Strip these before the doc ships. They're not a style issue, just
a cleanliness one — but they're a dead giveaway the doc wasn't reread.
