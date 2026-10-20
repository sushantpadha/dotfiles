# Pre-ship checklist

Run this against the actual draft, line by line, before writing the file.
This is a second pass, done after drafting — not a mental note made while
writing. Catching your own tic requires rereading it, not just intending to
avoid it.

- [ ] Any "not X, it's Y" or "not just X but Y" construction? Rewrite as a
      direct positive statement.
- [ ] Any hedge word or phrase in more than one place? ("might," "could
      potentially," "generally," "in some cases," "it's recommended that")
      Collapse them into a single caveats section near the end, or cut if
      not load-bearing.
- [ ] Any filler opener ("It's worth noting," "Essentially," "Simply put")
      or filler closer ("In conclusion," a summary paragraph that restates
      the doc)? Delete it.
- [ ] Any exactly-three-adjective list? Check if all three are earning
      their place. If not, cut to what's true and specific.
- [ ] Any word from the banned-vocabulary list (delve, leverage, robust,
      seamless, elevate, holistic, cutting-edge, game-changing, empower,
      utilize)? Replace with the concrete detail.
- [ ] Any "stands as a testament," "pivotal moment," "paradigm shift," or
      similar inflated-significance phrase? Replace with the actual fact or
      number, or cut.
- [ ] Any dangling "-ing" clause tacked onto a sentence for vague emphasis
      ("...greatly improving X," "...highlighting its importance")? Cut or
      make concrete.
- [ ] Count the em dashes. More than one or two in the whole doc? Convert
      most to periods or commas.
- [ ] Any place where a word was swapped purely to avoid repetition, at the
      cost of clarity? Revert to the plain repeated term.
- [ ] Any leftover copy-paste artifacts (oaicite, contentReference, tracking
      params in URLs)? Strip them.
- [ ] Any fragment, bare "Label: fact" line, colon chain, or sentence with
      its subject or articles dropped? Rewrite it as a full, natural
      sentence ("We do ...", "It does ..."). Tables and code may stay terse.
- [ ] Does the format match what was actually asked for (README structure,
      docstring convention, plain prose) rather than a generic default?
- [ ] Read the first and last sentence in isolation. Do they carry real
      information, or could they be deleted with nothing lost?

If a line fails a check, fix it now — don't note it and move on. This is
the last pass before the file gets written.
