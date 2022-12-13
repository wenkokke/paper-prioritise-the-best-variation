# TODO: discuss

- @Reviewer2: Proof of Thm 4.4: this is not a rigorous argument. I would like to understand better the architecture
  of the proof. It seems to be going by cases, so I want to be convinced that they are exhaustive. Also, various inferences are not properly justified.

  @wenkokke: @elektra85, should we mark it as a sketch? Do we justify the cases are exhaustive? This follows the original work by Kobayashi (cite paper + page). We have structured the proof.

- @Reviewer2: While I generally understand the use of priorities to rule out circular waiting dependency, I am unclear about what the invariants are that the type system maintains in terms of priorities. Also, I didn’t get a clear understanding of the handling of priorities when it comes to closures. With regard to the former, for example, I am unclear about what the precise relationship is between the priority of the sequent and those in the context. There seems to be some relationship that is imposed by typing, but I was unable to distill the pattern, nor have the authors properly explained this. Closures are really tricky, and the authors should devote more time and space to convincingly argue that the enforced treatment is correct. Ideally, there would be a discussion based on a number of examples, including one that would be ruled out by typing, so that the reader can get an understanding of what the key concerns are. The current treatment is short, with the only justification for the chosen treatment: ”Closures suspend communication, so T-Lam stores the priority bounds of the function body on the function type, and T-App restores them.”

- @Reviewer2: Write down derivation for `• let (x, x′) = new () in spawn(λ().echo x); x′`.

- @Reviewer1: Did you find it straightforward to apply the concepts from PCP to PGV? What was challenging?

  @wenkokke: The main difficulty was due to the fact that PGV has to track starting & ending priorities, rather than just [whichever PCP stores], but we were aided in this by the work by Padovani & Novara.
  @elektra85: add the above sentence to the intro, if not done yet.

- @Reviewer1: page 4: In your presentation of types, I wondered if there are any well-formedness conditions on priority bounds.

  @wenkokke: There are no well-formedness conditions, but there are particular lemmas that hold for them, which could be _taken as_ well-formedness conditions. In particular I believe the theorem is: for a sequent with lower bound p and upper bound q, either p < q, or p is top and q is bottom.
  This is relaxed somewhat by some extensions, in which case I believe we can also have "p is top and q is a concrete priority", but I don't recall to what extend that applies here. I believe it may have been due to recursion, in which case it wouldn't.

  @elektra85: add the above explanation to the paper, if not done yet.

- @Reviewer1: In general, the presentation seems to be aimed at experts in GV. Please make it more accessible.

- @Reviewer1: Another example is that you say that you "recover fork", but at this point it's not clear what fork was in GV.

  @wenkokke: Perhaps best to just qualify this statement with "for those who care about GV", because it's uninteresting otherwise.
  @elektra85: add a sentence about this in the paper; no need to restrict it to those who care about GV.

- @Reviewer1: page 6: The paragraph on values and evaluation contexts is going to be clear only to a selected few. Please write some text that explains how contexts work (holes, notation for replacing a hole with a term, etc.), that values are a specialisation of terms, etc.

  @elektra85: add a sentence or so about this in the paper.

- @Reviewer1: page 20, case E-Close: I couldn't make sense of the derivation, where two subderivations seem to be organised vertically?.. Is that the right reading? Could you reorganise it to make it obvious?

  @wenkokke: We can't reorganise it, but we can add words. They're not subderivations, but rather the typing derivations before and after reduction.
   @elektra85: add a sentence about this in the paper.

- @Reviewer1: page 22: Lemma 3.7 is fundamental and seems to be the key difference wrt PCP and Kobayashi's work. Is that the case? Is the proof trivial? Could you at least provide a sketch, or say at least _why_ it is trivial?

  @wenkokke: It's not _trivial_ but it's _boring_, as it's precisely the proof you'd give for any lambda calculus. We should mention that, essentially, this is just progress for the simply-typed linear lambda calculus, with "M is ready" falling out as extra stuck cases.
    @elektra85: add a sentence about this in the paper.

- @Reviewer1: page 23: In case (4), before introducing the subcases (a) and (b), it'd be kind to say that L' is either a ready term or a value.

  @wenkokke: Yes, so we should add this.

- @Reviewer1: page 23: In case (4.b), if L' is a value like an abstraction or a pair, what do you mean by "the endpoint that it is blocked on"?

  @wenkokke: This requires more consideration on my part.

- @Reviewer1: Having a table for syntactic sugar somewhere would be helpful.

- @Reviewer1: page 8: Would be nice to have an example about reductions before proceeding to typing.

- @Reviewer1: pages 27-36: These sections are too dry. There's no explanation of what works as usual, what is different, how the translation from PCP to PGV works (it is not even really _defined_ before the proofs!), and what the reader should focus on. It almost reads like a file intended for a theorem prover. I suggest that you rewrite these sections by explaining these aspects, presenting selected rules and the translation with examples, and then putting what "works as usual" into an appendix.

- @wenkokke: Regarding Figure 3, are these definitions? I believe so: we're deriving the typing rules for the syntactic sugar from the core typing rules.

  Related comments:

  - @Reviewer1: page 12: Here and in all other cases in the remainder, you write "= with \Delta" on top which usually stands for a definition. Is that what you mean? Don't you mean a simple "=" instead? Or perhaps you mean that "= with \Delta" stands for "which is defined as"? A clarification would be appreciated.

    @elektra85: add a sentence about this in the paper.

- @Reviewer3: Since the orignal publication of this work, a few works on deadlock-freedom by typing that go beyond the languages that stem directly from the logical interpretation of session types have been published that should be included in the related work discussion. Please comment on the work by Qian, Kavvos and Birkedal using coexponentials:

  > Zesen Qian, G. A. Kavvos, Lars Birkedal:
  > Client-server sessions in linear logic. Proc. ACM Program. Lang. 5(ICFP): 1-31 (2021)

- @Reviewer2: Another technical comment I have is on the distinction between variables and channels (which the authors refer to as names). The latter are generated at runtime (via new), and are also gathered, in the environment. I believe that’s also the reason why the usual theorems (preservation and progress) are stated relative to a non-empty context. However, the formalization should guarantee that the respective terms are closed. It would also be helpful if different meta variables were used for variables and names. Currently, x, y, z are used for both.

- @elektra85: clarify the use of `\varnothing`

  


  
