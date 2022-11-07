## Fixes defect, easy to fix

- @Reviewer1: page 12: Where is the case for M;N? Is it obtained by composing N of type unit with something like what is typed in T-LamUnit?

- @Reviewer1: page 12: Here and in all other cases in the remainder, you write "= with \Delta" on top which usually stands for a definition. Is that what you mean? Don't you mean a simple "=" instead? Or perhaps you mean that "= with \Delta" stands for "which is defined as"? A clarification would be appreciated.

- @Reviewer1: page 12, case T-LamUnit: I could not find a typing rule for a term let () = ..., which would be necessary here.

- @Reviewer1: page 26: T-Res sTates

- @Reviewer1: The Introduction should mention that this article is the extended version of a published conference paper.

- @Reviewer3: page 10: l1, enforce sequentially

- @Reviewer3: Section 6, paragraph 2: conservation types -> conversation

- @Reviewer1: last line of page 1: I think you lack a colon at the end.

## Fixes defect, requires consideration

- @Reviewer1: page 39, 2nd line: Again, what do you mean by "loosening its ties to linear logic"?

- @Reviewer1: 1st line: "verify correct ordering of operations, namely protocols". Don't session types verify _implementations_ of protocols, instead of the protocols themselves?

- @Reviewer1: 2nd line: "Regular types". I don't think you mean regular types in the technical sense. Perhaps you mean data types?

## Enhances contribution

- Did you find it straightforward to apply the concepts from PCP to PGV? What was challenging?

## Clarifies contribution

- @Reviewer1: You say in the abstract that deadlock-freedom is guaranteed in CP and GV by combining parallel composition/thread spawning with channel creation. Later in the Introduction, you say that deadlock-freedom actually depends on restricting the structure of processes and shared channels to trees, which is achieved by the aforementioned combination. But then you mention works (Hypersequent CP and Linear Compositional Choreographies) that achieve the tree structure without that combination. So the really important thing seems to be the "tree structure" of processes. What do you mean by that exactly? You say that "this ensures that two processes can only communicate via exactly one series of channels". What's a "series of channels"? A mini example on what can and cannot be written in CP / Hypersequent CP / Linear Compositional Choreographies would probably help.

- @Reviewer3: I disagree with the (informal) definition of session interleaving used in e.g. paragraph 2, page 2, of the introduction. The authors state that:

  > [...] This ensures that two processes can only communicate via exactly one series of channels, which rules out interleavings of sessions, and guarantees deadlock freedom
  > To my understanding, session interleaving is the ability of a process to communicate on more than one channel, which is clearly supported by linear logic-based systems in a deadlock-free way. This is in sharp contrast with the original session type works where the sheer fact that a process can use more than one channel entails the possibility of deadlock. What is ruled out is cyclic dependencies of blocking actions, not interleaving.

- @Reviewer3: The authors should state clearly what the downsides of coupling channel creation with thread spawning in a setting such as GV are (beyond the acyclicity constraint).

- @Reviewer1: 2nd paragraph: What do you mean when you say that Hypersequent CP and Linear Compositional Choreographies "maintain" the correspondence to CLL?

- @Reviewer1: 2nd paragraph: You say that PCP weakens the correspondence to CLL. What do you mean, exactly? Understanding this is important to gauge the relevance of PGV as well.

- @Reviewer1: 3rd paragraph: What is "reflection"?

- @Reviewer1: page 4: In your presentation of types, I wondered if there are any well-formedness conditions on priority bounds.

- @Reviewer1: page 5: Please explain the syntax of terms carefully. For example, you have a term for sequential composition (M;N) in a functional language, but you] don't even mention it in the paragraph that describes terms. The term does not even appear in the semantics.

- @Reviewer1: In general, the presentation seems to be aimed at experts in GV. Please make it more accessible.

- @Reviewer1: Another example is that you say that you "recover fork", but at this point it's not clear what fork was in GV.

- @Reviewer1: page 6: The paragraph on values and evaluation contexts is going to be clear only to a selected few. Please write some text that explains how contexts work (holes, notation for replacing a hole with a term, etc.), that values are a specialisation of terms, etc.

- @Reviewer1: page 10: in "a configuration C with flag \phi" you highlight C but not \phi (and likewise in the second-last line of the same paragraph). What's the rationale for colouring things?

- @Reviewer1: page 20, case E-Close: I couldn't make sense of the derivation, where two subderivations seem to be organised vertically?.. Is that the right reading? Could you reorganise it to make it obvious?

- @Reviewer1: page 22: Lemma 3.7 is fundamental and seems to be the key difference wrt PCP and Kobayashi's work. Is that the case? Is the proof trivial? Could you at least provide a sketch, or say at least _why_ it is trivial?

- @Reviewer1: page 23: In case (4), before introducing the subcases (a) and (b), it'd be kind to say that L' is either a ready term or a value.

- @Reviewer1: page 23: In case (4.b), if L' is a value like an abstraction or a pair, what do you mean by "the endpoint that it is blocked on"?

- @Reviewer1: Having a table for syntactic sugar somewhere would be helpful.

- @Reviewer1: page 4: You use a different font than usual for the empty set symbol, so maybe write explicitly in parenthesis that it is what you mean when you use the symbol for the first time?

- @Reviewer1: page 8: Would be nice to have an example about reductions before proceeding to typing.

- @Reviewer1: Please write some introductory text for Section 4. At this point I had forgotten most about what PCP is and why it matters for this paper.

- @Reviewer1: pages 27-36: These sections are too dry. There's no explanation of what works as usual, what is different, how the translation from PCP to PGV works (it is not even really _defined_ before the proofs!), and what the reader should focus on. It almost reads like a file intended for a theorem prover. I suggest that you rewrite these sections by explaining these aspects, presenting selected rules and the translation with examples, and then putting what "works as usual" into an appendix.

## Clarifies related work

- @Reviewer3: The issue raised in the abstract about CP is coupling thread spawning and channel creation is true also about the earlier work of Caires and Pfenning, and is generally true of all works in this space based on the core proof theory of linear logic. I suggest reflecting this in the abstract rather than singling out CP in this sense.

- @Reviewer1: 2nd paragraph: You say that Linear Compositional Choreographies maintain a correspondence to CLL, but they are based on Intuitionistic Linear Logic.

- @Reviewer1: page 27: Rule T-Halt recalls standard session types rather than linear logic. Could you elaborate on what the link between PCP and linear logic is? See also my previous comment on the introduction.

- @Reviewer1: 3rd paragraph of Section 6: Similarly, I don't think the average reader will know what a "global type" is. Might be worth saying something about it.

- @Reviewer1: 3rd paragraph of Section 6: You say that [CM13] combine MPST with choreographies to achieve deadlock-freedom. But global types in MPST _are_ choreographies. Do you mean choreographic programming ("combine MPST with choreographic programming")?

- @Reviewer1: By the way, just like global types, I don't think that the average reader will know what choreographic programming is.

## Adds related work

- @Reviewer1: 1st paragraph of Section 6: As far as I know one of the most powerful of Kobayashi's systems is the one in

  > Naoki Kobayashi, Cosimo Laneve
  > Deadlock analysis of unbounded process networks. Inf. Comput. 252: 48-70 (2017)

  so it might be worth citing. This system seems much more powerful than the one presented in this paper (but has no link to linear logic, as far as I know, so it doesn't detract from the authors' contribution).

- @Reviewer1: Your work and GV in general reminded me a lot of this paper:

  > Bernardo Toninho, Luís Caires, Frank Pfenning:
  > Higher-Order Processes, Functions, and Sessions: A Monadic Integration. ESOP 2013: 350-369

  where the session-typed pi-calculus (with linear logic) is integrated with functions. Probably also worth mentioning.

- @Reviewer3: The notion of Ready Term (Def. 3.6) seems related to the notion of poised process of [BP17,BTP19] and live process of [CP10]. A remark to this effect would be helpful.

- @Reviewer3: Since the orignal publication of this work, a few works on deadlock-freedom by typing that go beyond the languages that stem directly from the logical interpretation of session types have been published that should be included in the related work discussion. Please comment on the recent work by Rocha and Caires on shared state in a language inspired by differential linear logic:

  > Pedro Rocha, Luís Caires:
  > Propositions-as-types and shared state. Proc. ACM Program. Lang. 5(ICFP): 1-30 (2021)

  And on the work by Qian, Kavvos and Birkedal using coexponentials:

  > Zesen Qian, G. A. Kavvos, Lars Birkedal:
  > Client-server sessions in linear logic. Proc. ACM Program. Lang. 5(ICFP): 1-31 (2021)

## Changes style

- @Reviewer1: The document is full of emphasised words, a bit too much for my taste. I'd suggest to highlight only keywords that should be remembered for later, not words that the reader should really read (the reader should read everything, and if not that part should be erased)---an example is the emphasis on "alone" in line 4 of page 2. This might be a matter of taste so it's not a strong suggestion.

## Completed

- ~~@Reviewer1: page 26: you sometimes say "well typed" and other times "well-typed".~~

- ~~@Reviewer1: page 8: "to applied" -> "to be applied"~~

- ~~@Reviewer1: 1st paragraph of Section 6: "andcapabilities" -> "and capabilities"~~

- ~~@Reviewer3: page 2, paragraph 2: combing -> combining~~

- ~~@Reviewer3: page 6: formating of \phi ::= ... is broken~~

- ~~@Reviewer1: page 6: The syntax of configuration needs a line break or some spacing, I think.~~

- ~~@Reviewer1: page 6: I couldn't really make sense of the equations for the markings. I proceeded by guessing what spacing should have been there.~~
