# Pre-ship checklist

Run this against the actual draft, line by line, before you write the file.
It is a second pass after drafting. Catching your own habits takes a reread,
not an intention.

## Never use

- [ ] Run `grep -nP '[^\x00-\x7F]' FILE`. Replace em dashes, arrows and curly
      quotes with `--`, `->` and straight quotes.
- [ ] Are there any emoji? Remove them.
- [ ] Is there any "not X, it's Y", "not just X but Y", "Y rather than X" or
      "no X, just Y"? Rewrite it as a direct statement.
- [ ] Is there any word from the inflated-vocabulary list (delve, leverage,
      robust, seamless, utilize, showcase, pivotal, crucial...)? Use the plain
      word or the concrete detail.
- [ ] Is there any inflated significance or promotional phrasing ("testament
      to", "pivotal role", "groundbreaking")? State the fact instead.
- [ ] Is there a filler opener or closer, or a closing recap? Delete it.
- [ ] Are there chatbot lines, placeholders, `oaicite` or tracking params?
      Remove them.

## Use rarely

- [ ] Count three-item lists. Does each item carry real information?
- [ ] Do hedges appear in more than one place? Move real caveats to one
      section at the end.
- [ ] Is there a trailing "-ing" clause that adds a vague judgment? Cut it or
      make it concrete.
- [ ] Is "serves as", "functions as" or "boasts" standing in for "is" or
      "has"?
- [ ] Is there a vague attribution ("widely considered", "experts say")?
      Name the source or cut it.
- [ ] Is one thing called by several names? Pick one.
- [ ] Is bold used in running prose, or as a label on every list item?
- [ ] Are the headings in sentence case?
- [ ] Is there any fragment, "Label: fact" line or dropped subject? Write it
      as a full sentence. Tables and code can stay terse.

## Use moderately

- [ ] Do many sentences start with "Additionally", "Furthermore" or
      "Moreover"?
- [ ] Do sentences all have the same shape and length?
- [ ] Does the document have more headings and nesting than its length needs?

## Reports only

- [ ] Did you ask the user about sources, non-standard terms and unclear
      content before drafting?
- [ ] Does every claim match the evidence and the tested setup?
- [ ] Does each sentence hold one idea, with at most two clauses?
- [ ] Is the tone "we did, we found", with no passive or impersonal voice?
- [ ] Does each undefined special term have the user's sign-off?
- [ ] Do graph descriptions use only one to three numbers?
- [ ] Is anything from outside the report's sources included?
- [ ] Is each metric called by the same name as in the figures and tables?

## Always

- [ ] Does the format match what was asked for, such as README structure,
      docstring convention or plain prose?
- [ ] Read the first and last sentence on their own. Do they carry real
      information?

If a line fails a check, fix it now. This is the last pass before the file
gets written.
