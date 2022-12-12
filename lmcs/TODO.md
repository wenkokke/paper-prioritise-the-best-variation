# TODO: @wenkokke



# TODO: discuss

- Should we ask the editor:

  * Should we remove references from the abstract? NO
  * Do we need DOI links in the references? If so, can we have more pages of bibliography? Maybe for the final version...

- @Reviewer2: P3, ”Priority GV offers a more fine-grained analysis of communication structures”: Clarify?

  @wenkokke: Done.

- @Reviewer2: P4: Why does top denote a lower bound and bottom an upper bound? Shouldn’t it be the other way
  around?

  @wenkokke: clarified in the paper in the typing rule sec right after pure functional types.

- @Reviewer2: P5, ”top-most connective”: Left-most?

  @wenkokke: top-most is unambiguous and refers to the tree of the type.

- @Reviewer2: P6: again, the definitions for the flags lack space to separate them. Also, this seems not a proper inductive definition, i.e., base cases are missing. Moreover, what seems required is a left to right reading here, i.e., the right to left reading doesn’t seem to make sense. I think the proper way to define this would be as an inductive definition over the configuration, in particular decomposing C||D. The introduction of ”+” seems unnecessary, moreover the semantics of it is not defined. And, after having read the paper, these definitions are later on never used.

  @wenkokke: We added the required space. "+" is used in ...

- @Reviewer2: Also, I am not familiar with type schemas, some explanation would be helpful.

  @wenkokke: Do we have to? -\_-

- @Reviewer2: Figures 3-5: I have not checked them for mistakes. What is the significance of providing this syntactic sugar?

  @wenkokke: We use syntactic sugar in the examples. In addition, giving syntactic sugar for select and offer is a witness to the expressivity of our language. Select/offer are normally primitives in session typed pi-calculus.

- @Reviewer2: P8, last sentence: At this point it’s not clear to me how the lower bound is approximated.

  @wenkokke: addressed at the third paragraph of sec 2.3.

- @Reviewer2: Lemma 3.2 proof, it is not clear what is meant by right arrow with label V/x. What is the semantics of it? Note, I didn’t check the remaining cases. But in general I find the proof not detailed enough. Several steps are omitted.

  @wenkokke: I am so tired. But perhaps @Reviewer2 has a point, and we should define what this notation means?! -\_-

- @Reviewer2: The proof of Lemma 3.3 is sloppy. It omits the typing of evaluation contexts, which is all glossed over in the last case, dismissed as immediate. Also, it is stated for open terms. Presumably, Gamma can only contain channel names at this stage, but that is not made precise, nor guaranteed.

  @wenkokke: My guy, this is a proof of subject reduction for a simply-typed lambda calculus with constants. If anything, this is too verbose, as it can be found in every textbook. I am crying. "\_" Need to say it is standard in the paper.

- @Reviewer2: Proof of Lemma 3.4: it does not seem to go by induction of C = C’ because structural congruence is not an inductive definition. Instead, it seems typing derivations of the structurally equal configurations are provided and it is shown that the same type is derived.

  @wenkokke: Bestie, derivations of structural congruence are an inductive definition, and we say that we proceed "by induction on the derivation of C = C'". Finite language, only inductive definitions in here!

- @Reviewer2: P22: I am surprised to read that progress seems to allow ready terms. Shouldn’t a stronger progress statement be possible due to linearity?

  @wenkokke: You're reading progress for the functional language as progress for the whole dealio. Two different progress properties, for terms and for the whole language. In the paper, the results are labelled accordingly.

- @Reviewer2: Lemma 3.7: here the remark is made that Gamma contains only session types. Reminding of my earlier remark regarding closed terms, I think this remark should also be made for subject reduction?

  @wenkokke: Nope. "Only contains session types" means, essentially, that the term is closed wrt variables, but may become blocked on a channel, i.e., be ready. So this is essentially progress for variable-closed terms. If there's variables, obviously progress becomes trickier, since we may also become blocked on a variable. Subject reduction holds for all terms.

- @Reviewer2: P22, ”we opt to move all nu-binders to the top”: Where is that done?

  @wenkokke: Literally in the definition of canonical forms that's referenced?
  In the associated canonical forms proof by "using SC-ResExt"?
  My guy, please, I am tired.

- @Reviewer2: P22, explanations below Lemma 3.7: This seems important, but it should be elaborated, I wasn’t able to understand the details. Also, I don’t remember that the term canonical forms has been defined. Is a term in canonical form if it is ready? (Reading on, I see that the term canonical form is now defined. So, the sequencing here is probably not ideal.)

  @wenkokke: _Please_ read until the end of the sentence before you comment?! This sequencing structure is used for the _entire_ section and only now it tripped you up?!

- @Reviewer2: P26, ”Finally, since our reduction relation is a strict subset of the reduction relation in the original [DG18b], we defer to their proofs.”: I am not convinced by this argument, i.e., why should the proof that was carried out for a bigger system hold for a subset?

  @wenkokke: we meant subject reduction (Thm 2) specifically and we clarified this in the paper.

- @Reviewer2: Proof of Thm 4.4: this is not a rigorous argument. I would like to understand better the architecture
  of the proof. It seems to be going by cases, so I want to be convinced that they are exhaustive. Also, various inferences are not properly justified.

  @wenkokke: @elektra85, should we mark it as a sketch? Do we justify the cases are exhaustive? This follows the original work by Kobayashi (cite paper + page). We have structured the proof.

- @Reviewer2: Fig.10: What is the semantics of this arrow/implication?

  @wenkokke: In all case, it is unfolding the definition.

- @Reviewer2: Lemma 3.2: Also, shouldn’t there be a relationship on p and q?

  @wenkokke: There is no need for a relationship between p and q because by Lemma 3.1 q=\bottom for all cases...

- @Reviewer2: While I generally understand the use of priorities to rule out circular waiting dependency, I am unclear about what the invariants are that the type system maintains in terms of priorities. Also, I didn’t get a clear understanding of the handling of priorities when it comes to closures. With regard to the former, for example, I am unclear about what the precise relationship is between the priority of the sequent and those in the context. There seems to be some relationship that is imposed by typing, but I was unable to distill the pattern, nor have the authors properly explained this. Closures are really tricky, and the authors should devote more time and space to convincingly argue that the enforced treatment is correct. Ideally, there would be a discussion based on a number of examples, including one that would be ruled out by typing, so that the reader can get an understanding of what the key concerns are. The current treatment is short, with the only justification for the chosen treatment: ”Closures suspend communication, so T-Lam stores the priority bounds of the function body on the function type, and T-App restores them.”


# TODO: re-evaluate?

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

  @Reviewer1: page 4: You use a different font than usual for the empty set symbol, so maybe write explicitly in parenthesis that it is what you mean when you use the symbol for the first time?

- @wenkokke: The rationale for colouring terms is to communicate their syntactic sort: red for terms, blue for types, teal for priorities & priority constraints. This may not have been consistently applied.

  Related comments:

  - @Reviewer1: page 10: in "a configuration C with flag \phi" you highlight C but not \phi (and likewise in the second-last line of the same paragraph). What's the rationale for colouring things?

- @elektra85: we have fixed this now.

  Related comments:

  @Reviewer1: The document is full of emphasised words, a bit too much for my taste. I'd suggest to highlight only keywords that should be remembered for later, not words that the reader should really read (the reader should read everything, and if not that part should be erased)---an example is the emphasis on "alone" in line 4 of page 2. This might be a matter of taste so it's not a strong suggestion.

- @elektra85: we have fixed this now.
