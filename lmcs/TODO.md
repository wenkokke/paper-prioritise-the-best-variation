
# TODO: @wenkokke

## Derived issues

- @wenkokke: We should clarify what leads to deadlock freedom:

  - "deadlock-freedom is guaranteed in CP and GV by combining parallel composition/thread spawning with channel creation"
  - "deadlock-freedom actually depends on restricting the structure of processes and shared channels to trees"

  The former ensures the latter. The latter guarantees deadlock freedom when using session types, because then "two processes can only communicate via exactly one series of channels".

  We should clarify what a "series of channels" is.

  Related comments:

  - @Reviewer1: You say in the abstract that deadlock-freedom is guaranteed in CP and GV by combining parallel composition/thread spawning with channel creation. Later in the Introduction, you say that deadlock-freedom actually depends on restricting the structure of processes and shared channels to trees, which is achieved by the aforementioned combination. But then you mention works (Hypersequent CP and Linear Compositional Choreographies) that achieve the tree structure without that combination. So the really important thing seems to be the "tree structure" of processes. What do you mean by that exactly? You say that "this ensures that two processes can only communicate via exactly one series of channels". What's a "series of channels"? A mini example on what can and cannot be written in CP / Hypersequent CP / Linear Compositional Choreographies would probably help.

  - @Reviewer3: I disagree with the (informal) definition of session interleaving used in e.g. paragraph 2, page 2, of the introduction. The authors state that:

    > [...] This ensures that two processes can only communicate via exactly one series of channels, which rules out interleavings of sessions, and guarantees deadlock freedom
    > To my understanding, session interleaving is the ability of a process to communicate on more than one channel, which is clearly supported by linear logic-based systems in a deadlock-free way. This is in sharp contrast with the original session type works where the sheer fact that a process can use more than one channel entails the possibility of deadlock. What is ruled out is cyclic dependencies of blocking actions, not interleaving.

  - @Reviewer3: The authors should state clearly what the downsides of coupling channel creation with thread spawning in a setting such as GV are (beyond the acyclicity constraint)

- @wenkokke: Either what "ties to linear logic" means, or remove any mention of it.

  Related comments:

  - @Reviewer1: 2nd paragraph: What do you mean when you say that Hypersequent CP and Linear Compositional Choreographies "maintain" the correspondence to CLL?

  - @Reviewer1: 2nd paragraph: You say that PCP weakens the correspondence to CLL. What do you mean, exactly? Understanding this is important to gauge the relevance of PGV as well.

  - @Reviewer1: page 39, 2nd line: Again, what do you mean by "loosening its ties to linear logic"?

- @wenkokke: Ensure that we consistently use either `M; N` or `let () = M in N`. In my opinion, all uses of the latter should be replaced by the former, and `let () = M in N` should not occur in the paper.

  Related comments:

  - @Reviewer1: page 5: Please explain the syntax of terms carefully. For example, you have a term for sequential composition (M;N) in a functional language, but you] don't even mention it in the paragraph that describes terms. The term does not even appear in the semantics.

  - @Reviewer1: page 12: Where is the case for `M;N`? Is it obtained by composing N of type unit with something like what is typed in T-LamUnit?

  - @Reviewer1: page 12, case T-LamUnit: I could not find a typing rule for a term `let () = ...`, which would be necessary here.

  We do not need a typing rule for whichever one we end up using, as it'll be a part of the core language.

- @wenkokke: Add informal definition for simulation and reflection.

  Related comments:

  - @Reviewer1: 3rd paragraph: What is "reflection"?

## Clarifies contribution


- @Reviewer2: Fix occurances of bare `new` and write down derivation for `• let (x, x′) = new in spawn(λ().echo x); x′`.


- @Reviewer2: While I generally understand the use of priorities to rule out circular waiting dependency, I am unclear about what the invariants are that the type system maintains in terms of priorities. Also, I didn’t get a clear understanding of the handling of priorities when it comes to closures. With regard to the former, for example, I am unclear about what the precise relationship is between the priority of the sequent and those in the context. There seems to be some relationship that is imposed by typing, but I was unable to distill the pattern, nor have the authors properly explained this. Closures are really tricky, and the authors should devote more time and space to convincingly argue that the enforced treatment is correct. Ideally, there would be a discussion based on a number of examples, including one that would be ruled out by typing, so that the reader can get an understanding of what the key concerns are. The current treatment is short, with the only justification for the chosen treatment: ”Closures suspend communication, so T-Lam stores the priority bounds of the function body on the function type, and T-App restores them.”


- @Reviewer2: Another question I was left wondering about is whether priorities are inferred by typing or whether the programmer has to provide them. The former seems to be the case, but this should be made explicit. Also, it would be helpful to provide a complete, unsuccessful typing derivation for Example 2.2. Two individual derivations, for each thread, are given on page 10, which show that the derivations impose contradicting orderings on the priorities. It would then also be helpful to show the rule that composes the two derivations and fails because of the contradiction. Which rule would that be?

- @Reviewer1: Did you find it straightforward to apply the concepts from PCP to PGV? What was challenging?

  @wenkokke: The main difficulty was due to the fact that PGV has to track starting & ending priorities, rather than just [whichever PCP stores], but we were aided in this by the work by Padovani & Novara.

- @Reviewer1: page 4: In your presentation of types, I wondered if there are any well-formedness conditions on priority bounds.

  @wenkokke: There are no well-formedness conditions, but there are particular lemmas that hold for them, which could be _taken as_ well-formedness conditions. In particular I believe the theorem is: for a sequent with lower bound p and upper bound q, either p < q, or p is top and q is bottom.
  This is relaxed somewhat by some extensions, in which case I believe we can also have "p is top and q is a concrete priority", but I don't recall to what extend that applies here. I believe it may have been due to recursion, in which case it wouldn't.

- @Reviewer1: In general, the presentation seems to be aimed at experts in GV. Please make it more accessible.

- @Reviewer1: Another example is that you say that you "recover fork", but at this point it's not clear what fork was in GV.

  @wenkokke: Perhaps best to just qualify this statement with "for those who care about GV", because it's uninteresting otherwise.

- @Reviewer1: page 6: The paragraph on values and evaluation contexts is going to be clear only to a selected few. Please write some text that explains how contexts work (holes, notation for replacing a hole with a term, etc.), that values are a specialisation of terms, etc.

- @Reviewer1: page 20, case E-Close: I couldn't make sense of the derivation, where two subderivations seem to be organised vertically?.. Is that the right reading? Could you reorganise it to make it obvious?

  @wenkokke: We can't reorganise it, but we can add words. They're not subderivations, but rather the typing derivations before and after reduction.

- @Reviewer1: page 22: Lemma 3.7 is fundamental and seems to be the key difference wrt PCP and Kobayashi's work. Is that the case? Is the proof trivial? Could you at least provide a sketch, or say at least _why_ it is trivial?

  @wenkokke: It's not _trivial_ but it's _boring_, as it's precisely the proof you'd give for any lambda calculus. We should mention that, essentially, this is just progress for the simply-typed linear lambda calculus, with "M is ready" falling out as extra stuck cases.

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

## Adds related work

- @Reviewer3: Since the orignal publication of this work, a few works on deadlock-freedom by typing that go beyond the languages that stem directly from the logical interpretation of session types have been published that should be included in the related work discussion. Please comment on the work by Qian, Kavvos and Birkedal using coexponentials:

  > Zesen Qian, G. A. Kavvos, Lars Birkedal:
  > Client-server sessions in linear logic. Proc. ACM Program. Lang. 5(ICFP): 1-31 (2021)

## Changes style


- @Reviewer2: Another technical comment I have is on the distinction between variables and channels (which the authors refer to as names). The latter are generated at runtime (via new), and are also gathered, in the environment. I believe that’s also the reason why the usual theorems (preservation and progress) are stated relative to a non-empty context. However, the formalization should guarantee that the respective terms are closed. It would also be helpful if different meta variables were used for variables and names. Currently, x, y, z are used for both.

- @wenkokke: Truly, what? I'm fairly sure we just use `\varnothing`, which I don't think is that uncommon?

  @Reviewer1: page 4: You use a different font than usual for the empty set symbol, so maybe write explicitly in parenthesis that it is what you mean when you use the symbol for the first time?

- @wenkokke: The rationale for colouring terms is to communicate their syntactic sort: red for terms, blue for types, teal for priorities & priority constraints. This may not have been consistently applied.

  Related comments:

  - @Reviewer1: page 10: in "a configuration C with flag \phi" you highlight C but not \phi (and likewise in the second-last line of the same paragraph). What's the rationale for colouring things?

- @wenkokke: I wouldn't mind having less emphasis, but I don't feel like it'd be worth the effort to make the change myself.

  Related comments:

  @Reviewer1: The document is full of emphasised words, a bit too much for my taste. I'd suggest to highlight only keywords that should be remembered for later, not words that the reader should really read (the reader should read everything, and if not that part should be erased)---an example is the emphasis on "alone" in line 4 of page 2. This might be a matter of taste so it's not a strong suggestion.


# Unprocessed

- @Reviewer2: References: It would be nice if references included DOI links.

- @Reviewer2: Abstract: It seems rather unusual to include citations.

- @Reviewer2: P2, ”there have been several attempts at developing Curry-Howard correspondences”: Attempts, implies
that it failed.

- @Reviewer2: P2, ”they achieve by restricting structure of”: the structure of

- @Reviewer2: P2, ”processes and shared channels to trees”: What is meant by shared channels? Please clarify.

- @Reviewer2: P2, ”communicate via exactly one series of channels”: What is meant by series of channels?

- @Reviewer2: P2, ”can be tweaked to satisfy reflection”: What is meant by reflection here?

- @Reviewer2: P2, ”succinctness of process calculi”: What is meant?

- @Reviewer2: P2, ”Concurrent lambda-calculi maintain a clear separation between the program ... and the configura-
tions”: True also for some other session-typed languages.

- @Reviewer2: P3, ”Priority GV offers a more fine-grained analysis of communication structures”: Clarify?

- @Reviewer2: P3, ”is typeable and guaranteed deadlock-free”: Guaranteed to be

- @Reviewer2: P4: Why does top denote a lower bound and bottom an upper bound? Shouldn’t it be the other way
around?

- @Reviewer2: P5, ”top-most connective”: Left-most?

- @Reviewer2: P5: ”to denote the minimum and maximum”: ..., respectively. Also, that listing seems to be missing
max!

- @Reviewer2: P5: The programs in Example 2.1 are not well-formed wrt abstract syntax of terms defined on page 5.
For example, the term ”recv x” cannot be parsed.

- @Reviewer2: P6: I am not sure how to parse the grammar of configurations. The two productions seem not clearly separated. I believe it should be phi ::= closed circle — open circle and then separately, C, D, E ::== ...?

- @Reviewer2: P6: again, the definitions for the flags lack space to separate them. Also, this seems not a proper inductive definition, i.e., base cases are missing. Moreover, what seems required is a left to right reading here, i.e., the right to left reading doesn’t seem to make sense. I think the proper way to define this would be as an inductive definition over the configuration, in particular decomposing C||D. The introduction of ”+” seems unnecessary, moreover the semantics of it is not defined. And, after having read the paper, these definitions are later on never used.

- @Reviewer2: P6, ”overlap between flags and priorities”: Could you clarify what the implications of this overlap are? Or does it just mean that the color indicates what ”circle” means?

- @Reviewer2: P6, grammar, bottom of page: Why is K (defined earlier in the term syntax) a value? Shouldn’t K be mentioned in rhs of E? Also, I do not understand the need for the thread evaluation context, nor do I understand how it fits with the remaining notions, E and G. F doesn’t show up there. Could it be that F should appear in the rhs of G? Maybe instead of the hole?

- @Reviewer2: SC-ResComm: Why is the side condition necessary? Doesn’t name restriction generate fresh names?

- @Reviewer2: P8, ”allows restriction to applied”: to be applied

- @Reviewer2: P8, ”We no longer require that every child thread finishes by returning a terminated channel”: Doesn’t
that have implications for linearity?

- @Reviewer2: P8, middle of page, in (b): not sure how to parse this arrow/implication?

- @Reviewer2: Fig2: rule T-Absurd would admit weakening, so is wrong.

- @Reviewer2: P8, ”In PGV, we keep track of a lower and upper bound on the priorities of a term, i.e., while evaluating
the term, when does it start communicating, and when does it finish”: Nitpicking, but this is not really
properly formulated. What does the ”it start” refer to? Use of resp. would be helpful.

- @Reviewer2: P8, last sentence: At this point it’s not clear to me how the lower bound is approximated.

- @Reviewer2: T-Pair: why should p < minpr(∆)?

- @Reviewer2: P9: At first, I didn’t see how the typing rule for New ensures that both endpoint have same priority.
Maybe remind the reader that S and S requires priorities to be the same.

- @Reviewer2: P10: Example lambda abstraction, I don’t think that the metavariable A was ever introduced. Also, I
am not familiar with type schemas, some explanation would be helpful.

- @Reviewer2: Fig2, runtime typing: Shouldn’t these rules incorporate the earlier defined + operator to ensure that
there is only one main thread?

- @Reviewer2: About top and bottom on lolli: aren’t they used counter standard usage? I.e., shouldn’t the greatest
upper bound be top? After all the priorities on the sequent are joined.

- @Reviewer2: Figures 3-5: I have not checked them for mistakes. What is the significance of providing this syntactic
sugar?

- @Reviewer2: Proof of Lemma 3.1 misses cases T-Var and T-Const.

- @Reviewer2: Lemma 3.2: Metavariable Theta has not been introduced earlier. For typing environments, only Gamma
and Delta have been introduced. Also, shouldn’t there be a relationship on p and q?

- @Reviewer2: Lemma 3.2 proof, 2nd case: pr() should be minpr() And in general, it is not clear what is meant by right arrow with label V/x. What is the semantics of it? Note, I didn’t check the remaining cases. But in
general I find the proof not detailed enough. Several steps are omitted.

- @Reviewer2: The proof of Lemma 3.3 is sloppy. It omits the typing of evaluation contexts, which is all glossed over in
the last case, dismissed as immediate. Also, it is stated for open terms. Presumably, Gamma can only
contain channel names at this stage, but that is not made precise, nor guaranteed.

- @Reviewer2: Proof of Lemma 3.4: it does not seem to go by induction of C = C’ because structural congruence is not an inductive definition. Instead, it seems typing derivations of the structurally equal configurations are
provided and it is shown that the same type is derived.

- @Reviewer2: P22: I am surprised to read that progress seems to allow ready terms. Shouldn’t a stronger progress statement be possible due to linearity?

- @Reviewer2: Lemma 3.7: here the remark is made that Gamma contains only session types. Reminding of my earlier remark regarding closed terms, I think this remark should also be made for subject reduction?

- @Reviewer2: P22, ”we opt to move all nu-binders to the top”: Where is that done?

- @Reviewer2: P22, explanations below Lemma 3.7: This seems important, but it should be elaborated, I wasn’t able
to understand the details. Also, I don’t remember that the term canonical forms has been defined. Is a term in canonical form if it is ready? (Reading on, I see that the term canonical form is now defined. So, the sequencing here is probably not ideal.)

- @Reviewer2: P24, pr(): here pr is used, earlier minpr. Not sure whether that is intended, but it also caused mistakes in an earlier proof (see earlier remark). Actually, this definition uses again minpr. Shouldn’t it be, for minpr(Γ, x : A) = minpr(Γ) ∩ pr(A)?

- @Reviewer2: P26, ”Finally, since our reduction relation is a strict subset of the reduction relation in the original [DG18b], we defer to their proofs.”: I am not convinced by this argument, i.e., why should the proof that was carried out for a bigger system hold for a subset?

- @Reviewer2: P28, ”Let this process be let this be Pi...”: grammar

- @Reviewer2: Proof of Thm 4.4: this is not a rigorous argument. I would like to understand better the architecture
of the proof. It seems to be going by cases, so I want to be convinced that they are exhaustive. Also,
various inferences are not properly justified.

- @Reviewer2: Lemma 4.5: this lemma seems to rely on a translation (notation (.)), which has not been introduced yet,
as far as I can tell! See also my remark in the previous section.

- @Reviewer2: Fig.10: What is the semantics of this arrow/implication?

- @Reviewer2: P36: It would be helpful to already alert the reader to the figure on the next page when discussing the
setup here.

# Completed

- ~~@Reviewer1: page 26: you sometimes say "well typed" and other times "well-typed".~~

- ~~@Reviewer1: page 8: "to applied" -> "to be applied"~~

- ~~@Reviewer1: 1st paragraph of Section 6: "andcapabilities" -> "and capabilities"~~

- ~~@Reviewer3: page 2, paragraph 2: combing -> combining~~

- ~~@Reviewer3: page 6: formating of \phi ::= ... is broken~~

- ~~@Reviewer1: page 6: The syntax of configuration needs a line break or some spacing, I think.~~

- ~~@Reviewer1: page 6: I couldn't really make sense of the equations for the markings. I proceeded by guessing what spacing should have been there.~~

- ~~@Reviewer3: Section 6, paragraph 2: conservation types -> conversation~~

- ~~@Reviewer1: last line of page 1: I think you lack a colon at the end.~~

- ~~@Reviewer1: page 26: T-Res sTates~~

- ~~@Reviewer3: page 10: l1, enforce sequentially~~

- ~~@Reviewer1: 1st line: "verify correct ordering of operations, namely protocols". Don't session types verify _implementations_ of protocols, instead of the protocols themselves?~~

- ~~@Reviewer1: 2nd line: "Regular types". I don't think you mean regular types in the technical sense. Perhaps you mean data types?~~

## Clarifies contribution

- ~~@Reviewer1: The Introduction should mention that this article is the extended version of a published conference paper.~~

  @elektra85: We have now added a paragraph at the end of the introduction.

- ~~@Reviewer1: Please write some introductory text for Section 4. At this point I had forgotten most about what PCP is and why it matters for this paper.~~

  @elektra85: We have added an opening to sec 4, clarifying what PCP is and why it matters to us.

## Clarifies related work

- ~~@Reviewer3: The issue raised in the abstract about CP is coupling thread spawning and channel creation is true also about the earlier work of Caires and Pfenning, and is generally true of all works in this space based on the core proof theory of linear logic. I suggest reflecting this in the abstract rather than singling out CP in this sense.~~

  @elektra85: We have now added a paragraph about this in the abstract.

- ~~@Reviewer1: 2nd paragraph: You say that Linear Compositional Choreographies maintain a correspondence to CLL, but they are based on Intuitionistic Linear Logic.~~

  @elektra85: We have fixed this.

- ~~@Reviewer1: page 27: Rule T-Halt recalls standard session types rather than linear logic. Could you elaborate on what the link between PCP and linear logic is? See also my previous comment on the introduction.~~

  @elektra85: We have now added section 4.4 on PCP and PLL to clarify this.

- ~~@Reviewer1: 3rd paragraph of Section 6: Similarly, I don't think the average reader will know what a "global type" is. Might be worth saying something about it.~~

  @elektra85: We have now clarified this.

- ~~@Reviewer1: 3rd paragraph of Section 6: You say that [CM13] combine MPST with choreographies to achieve deadlock-freedom. But global types in MPST _are_ choreographies. Do you mean choreographic programming ("combine MPST with choreographic programming")?~~

  @elektra85: Yes, thank you. We have fixed this now.

- ~~@Reviewer1: By the way, just like global types, I don't think that the average reader will know what choreographic programming is.~~

  @elektra85: We have added a description of choreographies in this paragraph.

## Adds related work

- ~~@Reviewer2:~~

  + ~~M. Coppo, M. Dezani-Ciancaglini, L. Padovani, and N. Yoshida. Inference of global progress prop- erties for dynamically interleaved multiparty sessions. In COORDINATION, 2013. doi: 10.1007/ 978-3-642-38493-6\ 4.~~

  + ~~M. Coppo, M. Dezani-Ciancaglini, N. Yoshida, and L. Padovani. Global progress for dynamically interleaved multiparty sessions. MSCS, 26(2):238–302, 2016. doi: 10.1017/S0960129514000188. URL https://doi.org/10.1017/S0960129514000188.~~

  + ~~B. Toninho, L. Caires, and F. Pfenning. Higher-order processes, functions, and sessions: A monadic integration. In ESOP, volume 7792 of LNCS, pages 350–369, 2013. doi: 10.1007/978-3-642-37036-6\ 20. URL https://doi.org/10.1007/978-3-642-37036-6\_20.~~

  @elektra85: we have now added all the above related work.

- ~~@Reviewer1: 1st paragraph of Section 6: As far as I know one of the most powerful of Kobayashi's systems is the one in~~

  > ~~Naoki Kobayashi, Cosimo Laneve~~
  > ~~Deadlock analysis of unbounded process networks. Inf. Comput. 252: 48-70 (2017)~~

  ~~so it might be worth citing. This system seems much more powerful than the one presented in this paper (but has no link to linear logic, as far as I know, so it doesn't detract from the authors' contribution).~~

  @elektra85: we have now added this reference.

- ~~@Reviewer1: Your work and GV in general reminded me a lot of this paper:~~

  > ~~Bernardo Toninho, Luís Caires, Frank Pfenning:~~
  > ~~Higher-Order Processes, Functions, and Sessions: A Monadic Integration. ESOP 2013: 350-369~~

 ~~where the session-typed pi-calculus (with linear logic) is integrated with functions. Probably also worth mentioning.~~

  @elektra85: we have now added this reference.

- ~~@Reviewer3: The notion of Ready Term (Def. 3.6) seems related to the notion of poised process of [BP17,BTP19] and live process of [CP10]. A remark to this effect would be helpful.~~

  @elektra85: we have now commented about it and restructured this part of the paper.

- ~~@Reviewer3: Since the orignal publication of this work, a few works on deadlock-freedom by typing that go beyond the languages that stem directly from the logical interpretation of session types have been published that should be included in the related work discussion. Please comment on the recent work by Rocha and Caires on shared state in a language inspired by differential linear logic:~~

  > ~~Pedro Rocha, Luís Caires:~~
  > ~~Propositions-as-types and shared state. Proc. ACM Program. Lang. 5(ICFP): 1-30 (2021)~~

  @elektra85: we have now added this reference.
