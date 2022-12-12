# Discuss

- @Reviewer3: I disagree with the (informal) definition of session interleaving used in e.g. paragraph 2, page 2, of the introduction. The authors state that:

  > [...] This ensures that two processes can only communicate via exactly one series of channels, which rules out interleavings of sessions, and guarantees deadlock freedom
  > To my understanding, session interleaving is the ability of a process to communicate on more than one channel, which is clearly supported by linear logic-based systems in a deadlock-free way. This is in sharp contrast with the original session type works where the sheer fact that a process can use more than one channel entails the possibility of deadlock. What is ruled out is cyclic dependencies of blocking actions, not interleaving.

@wenkokke: "What is ruled out is cyclic dependencies of blocking actions, not interleaving." That's actually not true, or not at least overly rose-tinted. What linear logic based systems ensure is that information can only flow from one process to another across one unique path. Since that path consists of session-typed channels, and session types rule out cyclic dependencies on session-typed channels, deadlock freedom follows. Sure, that *does* rule out "cyclic dependencies of blocking actions", but it rules out much more than that. Priorities rule out *exactly* all cyclic dependencies of blocking actions, and nothing else.

# Breaking changes

- We changed the definitions of \pr and \minpr:
  We now overload \pr to work on session types, data types and contexts, and remove \minpr.

- We have included our definition for the translations from PCP to PGV, which had been erroneously removed from the journal submission.

- We have merged the notations `M; N` and `let () = M in N` as they are synonymous, and any use of the latter was an error.

# Will Fix (Some OD already fixed)

- @Reviewer2: P2, ”there have been several attempts at developing Curry-Howard correspondences”: Attempts, implies that it failed.

@elektra85: we have fixed this now.

- @Reviewer2: References: It would be nice if references included DOI links.

  @wenkokke: Sure would, but we removed them because there was a page limit for the bibliography, and I'm not putting them back. Unless the editor requires this of us.

  @elektra85: add the DOIs back! if it goes over the page limit, I'll discuss this with the editor.

- @Reviewer2: Abstract: It seems rather unusual to include citations.

  @elektra85: it is not uncommon for references to be input in the abstract. We think it gives a more complete picture, while allowing the abstract to remain succinct.

- @Reviewer2: P2, ”Concurrent lambda-calculi maintain a clear separation between the program ... and the configurations”: True also for some other session-typed languages.

@elektra85: we have fixed this now.

- @Reviewer2: P6, grammar, bottom of page: Why is K (defined earlier in the term syntax) a value? Shouldn’t K be mentioned in rhs of E? Also, I do not understand the need for the thread evaluation context, nor do I understand how it fits with the remaining notions, E and G. F doesn’t show up there. Could it be that F should appear in the rhs of G? Maybe instead of the hole?~~

  @wenkokke: No. Functions are values, K is the sort for builtin functions, so K is a value. I don't know why K should be in the rhs of E, and @Reviewer2 does not elaborate. The thread evaluation context is separately useful. The contexts F and G have holes of different types. They are used in different places.

- ~~@Reviewer2: SC-ResComm: Why is the side condition necessary? Doesn’t name restriction generate fresh names?~~

  Following the operational semantics, sure, but it's not encoded in the term syntax. Your suggestion amounts to moving the side-condition to well-formedness of the term syntax.
  @elektra85: say the above sentence with more kindness.

- ~~@Reviewer2: P8, ”We no longer require that every child thread finishes by returning a terminated channel”: Doesn’t that have implications for linearity?~~

  It doesn't. In previous settings, each child thread returned its terminated channel to be closed by the "runtime system". In our setting, it is enforced by the type system that each child thread must close its terminated channel.
    @elektra85: say the above sentence with more kindness.

- ~~@Reviewer2: P8, middle of page, in (b): not sure how to parse this arrow/implication?~~

  @wenkokke: Which? The composition of equality and reduction?

- @Reviewer2: Fig2: rule T-Absurd would admit weakening, so is wrong.

@elektra85: clarify this in the paper and here.

- ~~@Reviewer2: T-Pair: why should p < minpr(∆)?~~

  @wenkokke: Because of the operational semantics evaluating products. They're ordered. First field goes first.

# Done

- @Reviewer2: Proof of Lemma 3.4: it does not seem to go by induction of C = C’ because structural congruence is not an inductive definition. Instead, it seems typing derivations of the structurally equal configurations are provided and it is shown that the same type is derived.

  @wenkokke: Derivations of structural congruence are an inductive definition, and we say that we proceed "by induction on the derivation of C = C'". The language is finite, so there are only inductive definitions.

- @Reviewer2: P22: I am surprised to read that progress seems to allow ready terms. Shouldn’t a stronger progress statement be possible due to linearity?

  @wenkokke: I believe you may be reading progress for the term language as progress for the configuration language. Two different progress properties, for terms and for the whole language. In the paper, the results are labelled accordingly.

- @Reviewer2: Lemma 3.7: here the remark is made that Gamma contains only session types. Reminding of my earlier remark regarding closed terms, I think this remark should also be made for subject reduction?

  @wenkokke: No. "Only contains session types" means, essentially, that the term is closed wrt variables, but may become blocked on a channel, i.e., be ready. So this is essentially progress for variable-closed terms. If there's variables, obviously progress becomes trickier, since we may also become blocked on a variable. Subject reduction holds for all terms.

- @Reviewer2: P22, ”we opt to move all nu-binders to the top”: Where is that done?

  @wenkokke: We do this in the definition of canonical forms that's referenced in the reviewer's remark, as well as in the associated canonical forms proof by "using SC-ResExt"?

- @Reviewer2: Figures 3-5: I have not checked them for mistakes. What is the significance of providing this syntactic sugar?

  @wenkokke: We use syntactic sugar in the examples. In addition, giving syntactic sugar for select and offer is a witness to the expressivity of our language. Select/offer are normally primitives in session typed pi-calculus.

- @Reviewer2: P8, last sentence: At this point it’s not clear to me how the lower bound is approximated.

  @wenkokke: addressed at the third paragraph of sec 2.3.

- @Reviewer2: P6: again, the definitions for the flags lack space to separate them. Also, this seems not a proper inductive definition, i.e., base cases are missing. Moreover, what seems required is a left to right reading here, i.e., the right to left reading doesn’t seem to make sense. I think the proper way to define this would be as an inductive definition over the configuration, in particular decomposing C||D. The introduction of ”+” seems unnecessary, moreover the semantics of it is not defined. And, after having read the paper, these definitions are later on never used.

  @wenkokke: We added the required space. "+" is used in ...

- @Reviewer2: P3, ”Priority GV offers a more fine-grained analysis of communication structures”: Clarify?

  @wenkokke: Done.

- @Reviewer2: P4: Why does top denote a lower bound and bottom an upper bound? Shouldn’t it be the other way
  around?

  @wenkokke: clarified in the paper in the typing rule sec right after pure functional types.

- @Reviewer2: P5, ”top-most connective”: Left-most?

  @wenkokke: top-most is unambiguous and refers to the tree of the type.

- @Reviewer1: 2nd paragraph: What do you mean when you say that Hypersequent CP and Linear Compositional Choreographies "maintain" the correspondence to CLL?

  @wenkokke: Elaborated in P2.

- @Reviewer1: 2nd paragraph: You say that PCP weakens the correspondence to CLL. What do you mean, exactly? Understanding this is important to gauge the relevance of PGV as well.

  @wenkokke: Elaborated in P2.

- @Reviewer1: page 39, 2nd line: Again, what do you mean by "loosening its ties to linear logic"?

  @wenkokke: Expected to be clear due to elaboration in introduction.

- @Reviewer2: Another question I was left wondering about is whether priorities are inferred by typing or whether the programmer has to provide them. The former seems to be the case, but this should be made explicit. Also, it would be helpful to provide a complete, unsuccessful typing derivation for Example 2.2. Two individual derivations, for each thread, are given on page 10, which show that the derivations impose contradicting orderings on the priorities. It would then also be helpful to show the rule that composes the two derivations and fails because of the contradiction. Which rule would that be?

  @wenkokke: Added the following passage:

  > For simplicity, we assume priority annotations are not inferred, but provided as an input to type checking. However, for any term, priorities can be inferred, e.g., by using the topological ordering of the directed graph where the vertices are the priority meta-variables and the edges are the inequality constraints between the priority meta-variables in the typing derivation.

- @wenkokke: Add an explanation to the type of pure functions.

  Related comments:

  - @Reviewer2: About top and bottom on lolli: aren’t they used counter standard usage? I.e., shouldn’t the greatest
    upper bound be top? After all the priorities on the sequent are joined.

  > The lower bound for a pure function is $\cs{\ptop}$ as pure functions never start communicating. For similar reasons, the upper bound for a pure function is $\cs{\pbot}$.

- @wenkokke: Ensure that we consistently use either `M; N` or `let () = M in N`. In my opinion, all uses of the latter should be replaced by the former, and `let () = M in N` should not occur in the paper.

  Related comments:

  - @Reviewer1: page 5: Please explain the syntax of terms carefully. For example, you have a term for sequential composition (M;N) in a functional language, but you] don't even mention it in the paragraph that describes terms. The term does not even appear in the semantics.

  - @Reviewer1: page 12: Where is the case for `M;N`? Is it obtained by composing N of type unit with something like what is typed in T-LamUnit?

  - @Reviewer1: page 12, case T-LamUnit: I could not find a typing rule for a term `let () = ...`, which would be necessary here.

  We do not need a typing rule for whichever one we end up using, as it'll be a part of the core language.

- @wenkokke: Add informal definition for simulation and reflection.

  Related comments:

  - @Reviewer1: 3rd paragraph: What is "reflection"?

  @wenkokke: I've simply removed "reflection" and substituted "operational correspondence".

## Just No

- ~~@Reviewer2: Fig2, runtime typing: Shouldn’t these rules incorporate the earlier defined + operator to ensure that there is only one main thread?~~

  @wenkokke: They literally do: T-Par.

- ~~@Reviewer2: P9: At first, I didn’t see how the typing rule for New ensures that both endpoint have same priority. Maybe remind the reader that S and S requires priorities to be the same.~~

  @wenkokke: I'd take your suggestion, except we literally already do this:

  > _(immediately after the figure)_
  >
  > "The typing rule for new ensures that both endpoints of a channel share the same priorities."

## Minor Changes

- @Reviewer1: You say in the abstract that deadlock-freedom is guaranteed in CP and GV by combining parallel composition/thread spawning with channel creation. Later in the Introduction, you say that deadlock-freedom actually depends on restricting the structure of processes and shared channels to trees, which is achieved by the aforementioned combination. But then you mention works (Hypersequent CP and Linear Compositional Choreographies) that achieve the tree structure without that combination. So the really important thing seems to be the "tree structure" of processes. What do you mean by that exactly? You say that "this ensures that two processes can only communicate via exactly one series of channels". What's a "series of channels"? A mini example on what can and cannot be written in CP / Hypersequent CP / Linear Compositional Choreographies would probably help.

  @wenkokke: Clarified in P2.

- @Reviewer2: P2, ”communicate via exactly one series of channels”: What is meant by series of channels?

  @wenkokke: Clarified in P2.

- ~~@Reviewer2: Fix occurances of bare `new`.~~

- ~~@Reviewer2: P28, ”Let this process be let this be Pi...”: grammar~~

- ~~@Reviewer2: P36: It would be helpful to already alert the reader to the figure on the next page when discussing the setup here.~~

- ~~@Reviewer2: P24, pr(): here pr is used, earlier minpr. Not sure whether that is intended, but it also caused mistakes in an earlier proof (see earlier remark). Actually, this definition uses again minpr.~~

- ~~@Reviewer2: Shouldn’t it be, for minpr(Γ, x : A) = minpr(Γ) ∩ pr(A)?~~

  @wenkokke: No.

- ~~@Reviewer2: Lemma 3.2 proof, 2nd case: pr() should be minpr().~~

- ~~@Reviewer2: Lemma 3.2: Metavariable Theta has not been introduced earlier. For typing environments, only Gamma and Delta have been introduced.~~

- @Reviewer2: P2, ”processes and shared channels to trees”: What is meant by shared channels? Please clarify.

  A channel is shared by two processes if each holds an endpoint.

- ~~@Reviewer3: The authors should state clearly what the downsides of coupling channel creation with thread spawning in a setting such as GV are (beyond the acyclicity constraint)~~

  I've added that GV suffers from a complicated metatheory as a consequence. The details are too involved for this section.

- ~~@Reviewer2: Proof of Lemma 3.1 misses cases T-Var and T-Const.~~

- ~~@Reviewer2: P10: Example lambda abstraction, I don’t think that the metavariable A was ever introduced.~~

  @wenkokke: Good, that should be T.

- ~~@Reviewer2: P8, ”In PGV, we keep track of a lower and upper bound on the priorities of a term, i.e., while evaluating the term, when does it start communicating, and when does it finish”: Nitpicking, but this is not really properly formulated. What does the ”it start” refer to? Use of resp. would be helpful.~~

  @wenkokke: Fixed.

- ~~@Reviewer2: P8, ”allows restriction to applied”: to be applied~~

- ~~@Reviewer2: P6, ”overlap between flags and priorities”: Could you clarify what the implications of this overlap are? Or does it just mean that the color indicates what ”circle” means?~~

  @wenkokke: Yes. Condensed that paragraph.

- ~~@Reviewer2: P2, ”can be tweaked to satisfy reflection”: What is meant by reflection here?~~

- ~~@Reviewer2: P3, ”is typeable and guaranteed deadlock-free”: Guaranteed to be~~

- ~~@Reviewer2: P5: ”to denote the minimum and maximum”: ..., respectively. Also, that listing seems to be missing max!~~

  @wenkokke: max is defined here to be used later.

- ~~@Reviewer2: P5: The programs in Example 2.1 are not well-formed wrt abstract syntax of terms defined on page 5.~~
  ~~For example, the term ”recv x” cannot be parsed.~~

  @wenkokke: That's just not true: "recv x" is "M N" with "M = K = recv" and "N = x"

- ~~@Reviewer2: P6: I am not sure how to parse the grammar of configurations. The two productions seem not clearly separated. I believe it should be phi ::= closed circle — open circle and then separately, C, D, E ::== ...?~~

- ~~@Reviewer2: P2, ”succinctness of process calculi”: What is meant?~~

  @wenkokke: Compared to concurrent lambda calculi.

- ~~@Reviewer2: P2, ”they achieve by restricting structure of”: the structure of~~

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

  - ~~M. Coppo, M. Dezani-Ciancaglini, L. Padovani, and N. Yoshida. Inference of global progress prop- erties for dynamically interleaved multiparty sessions. In COORDINATION, 2013. doi: 10.1007/ 978-3-642-38493-6\ 4.~~

  - ~~M. Coppo, M. Dezani-Ciancaglini, N. Yoshida, and L. Padovani. Global progress for dynamically interleaved multiparty sessions. MSCS, 26(2):238–302, 2016. doi: 10.1017/S0960129514000188. URL https://doi.org/10.1017/S0960129514000188.~~

  - ~~B. Toninho, L. Caires, and F. Pfenning. Higher-order processes, functions, and sessions: A monadic integration. In ESOP, volume 7792 of LNCS, pages 350–369, 2013. doi: 10.1007/978-3-642-37036-6\ 20. URL https://doi.org/10.1007/978-3-642-37036-6\_20.~~

  @elektra85: we have now added all the above related work.

- ~~@Reviewer1: 1st paragraph of Section 6: As far as I know one of the most powerful of Kobayashi's systems is the one in~~

  > ~~Naoki Kobayashi, Cosimo Laneve~~ > ~~Deadlock analysis of unbounded process networks. Inf. Comput. 252: 48-70 (2017)~~

  ~~so it might be worth citing. This system seems much more powerful than the one presented in this paper (but has no link to linear logic, as far as I know, so it doesn't detract from the authors' contribution).~~

  @elektra85: we have now added this reference.

- ~~@Reviewer1: Your work and GV in general reminded me a lot of this paper:~~

  > ~~Bernardo Toninho, Luís Caires, Frank Pfenning:~~ > ~~Higher-Order Processes, Functions, and Sessions: A Monadic Integration. ESOP 2013: 350-369~~

~~where the session-typed pi-calculus (with linear logic) is integrated with functions. Probably also worth mentioning.~~

  @elektra85: we have now added this reference.

- ~~@Reviewer3: The notion of Ready Term (Def. 3.6) seems related to the notion of poised process of [BP17,BTP19] and live process of [CP10]. A remark to this effect would be helpful.~~

  @elektra85: we have now commented about it and restructured this part of the paper.

- ~~@Reviewer3: Since the orignal publication of this work, a few works on deadlock-freedom by typing that go beyond the languages that stem directly from the logical interpretation of session types have been published that should be included in the related work discussion. Please comment on the recent work by Rocha and Caires on shared state in a language inspired by differential linear logic:~~

  > ~~Pedro Rocha, Luís Caires:~~ > ~~Propositions-as-types and shared state. Proc. ACM Program. Lang. 5(ICFP): 1-30 (2021)~~

  @elektra85: we have now added this reference.

## Fixes bugs


- ~~@Reviewer2: Lemma 4.5: this lemma seems to rely on a translation (notation (.)), which has not been introduced yet, as far as I can tell! See also my remark in the previous section.~~

  @wenkokke: Wait?! Where did our translation go?!
