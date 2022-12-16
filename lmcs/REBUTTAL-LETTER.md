# Response to the reviewers

We thank the reviewers for their useful feedback and comments. We addressed their concerns in the paper and respond below detailing how we went about these changes.

# Review 1

- Did you find it straightforward to apply the concepts from PCP to PGV? What was challenging?

  The authors: The main difficulty was due to the fact that PGV has to track starting & ending priorities, rather than just [whichever PCP stores], but we were aided in this by the work by Padovani & Novara. We added the following passage:

  > We cannot straightforwardly adapt the priority typing from PCP to PGV, as PGV adds higher-order functions. Instead, the priority typing for PGV follow the work by Padovani and Novara~\cite{padovaninovara15}.

- page 4: In your presentation of types, I wondered if there are any well-formedness conditions on priority bounds.

  The authors: There are no well-formedness conditions, but there are particular lemmas that hold for them, which could be _taken as_ well-formedness conditions. In particular I believe the theorem is: for a sequent with lower bound p and upper bound q, either p < q, or p is top and q is bottom. This is relaxed somewhat by some extensions, in which case I believe we can also have "p is top and q is a concrete priority", but I don't recall to what extend that applies here. I believe it may have been due to recursion, in which case it wouldn't. We added the following passage:

  > We postulate that the only function types---and, consequently, sequents---that are inhabited in PGV are pure functions and functions $\ty{\tylolli[\cs{p},\cs{q}]{T}{U}}$ for which $\cs{p}<\cs{q}$.

- page 6: The paragraph on values and evaluation contexts is going to be clear only to a selected few. Please write some text that explains how contexts work (holes, notation for replacing a hole with a term, etc.), that values are a specialisation of terms, etc.

  The authors:  We added the following passage:

  > Values are the subset of terms which cannot reduce further.
  > Evaluation contexts are one-hole term contexts, \ie, terms with exactly one hole, written $\tm{\hole}$. We write $\tm{\plug{E}{M}}$ for the evaluation context $\tm{E}$ with its hole replaced by the term $\tm{M}$. Evaluation contexts are specifically those one-hole term contexts under which term reduction can take place.
  > Thread contexts are a convenient way to lift the notion of evaluation contexts to threads. We write $\tm{\plug{\conf{F}}{M}}$ for the thread context $\tm{\conf{F}}$ with its hole replaced by the term $\tm{M}$.
  > Configuration contexts are one-hole configuration contexts, \ie, configurations with exactly one hole, written $\tm{\hole}$. Specifically, configuration contexts are those one-hole term contexts under which configuration reduction can take place. The definition for $\tm{\conf{G}}$ only gives the case in which the hole is in the left-most parallel process, \ie, it only defines $\tm{\ppar{\conf{G}}{\conf{C}}}$ and not $\tm{\ppar{\conf{C}}{\conf{G}}}$. The latter is not needed, as $\tm{\parallel}$ is symmetric under structural congruence, though it would be harmless to add. We write $\tm{\plug{\conf{G}}{\conf{C}}}$ for the evaluation context $\tm{\conf{G}}$ with its hole replaced by the term $\tm{\conf{C}}$.

- Another example is that you say that you "recover fork", but at this point it's not clear what fork was in GV.

  The authors: At this point the reader has been told that "[GV] combines channel creation and thread spawning into a single operation, called ``fork'', which is related to the cut construct in CP." This effectively summarizes all one needs to know about fork in GV. The fact that it is recoverable is only interesting to the readers familiar with GV, or interested in the exact relation to GV, and we hope that any reader unfamiliar with GV can gleam fork's original semantics from our definition.

- page 20, case E-Close: I couldn't make sense of the derivation, where two subderivations seem to be organised vertically?.. Is that the right reading? Could you reorganise it to make it obvious?

  The authors: we have now fixed this derivation.
  
- page 22: Lemma 3.7 is fundamental and seems to be the key difference wrt PCP and Kobayashi's work. Is that the case? Is the proof trivial? Could you at least provide a sketch, or say at least _why_ it is trivial?

  The authors: It's not _trivial_ but it's _boring_, as it's precisely the proof you'd give for any lambda calculus. We should mention that, essentially, this is just progress for the simply-typed linear lambda calculus, with "M is ready" falling out as extra stuck cases. We added the following passage:

  > [Progress for PGV] deviates from progress for linear $\lambda$-calculus only in that terms may reduce to values or \emph{ready terms}, where the definition of ready terms encompasses all terms whose reduction is struck on some constant $\tm{K}$.

## Connection to logic

- 2nd paragraph: What do you mean when you say that Hypersequent CP and Linear Compositional Choreographies "maintain" the correspondence to CLL?

  The authors: We elaborated about this in page 2, now 3rd paragraph.

- 2nd paragraph: You say that PCP weakens the correspondence to CLL. What do you mean, exactly? Understanding this is important to gauge the relevance of PGV as well.

  The authors: We elaborated about this in page 2, now 3rd paragraph.

- page 39, 2nd line: Again, what do you mean by "loosening its ties to linear logic"?

  The authors: We adjusted this line and connected it to the explanation provided in the intro.

## Comments on technical developments
- page 5: Please explain the syntax of terms carefully. For example, you have a term for sequential composition (M;N) in a functional language, but you] don't even mention it in the paragraph that describes terms. The term does not even appear in the semantics.

- page 12: Where is the case for `M;N`? Is it obtained by composing N of type unit with something like what is typed in T-LamUnit? Also, for the case T-LamUnit: I could not find a typing rule for a term `let () = ...`, which would be necessary here.

  The authors: We have merged `M;N` and `let () = ...` as they are synonymous. All uses of the latter have been replaced by the former, and `let () = M in N` should no longer occur in the paper.

- 3rd paragraph: What is "reflection"?

  The authors: We added informal definition for simulation and reflection. Also, we removed "reflection" and substituted "operational correspondence".

- You say in the abstract that deadlock-freedom is guaranteed in CP and GV by combining parallel composition/thread spawning with channel creation. Later in the Introduction, you say that deadlock-freedom actually depends on restricting the structure of processes and shared channels to trees, which is achieved by the aforementioned combination. But then you mention works (Hypersequent CP and Linear Compositional Choreographies) that achieve the tree structure without that combination. So the really important thing seems to be the "tree structure" of processes. What do you mean by that exactly? You say that "this ensures that two processes can only communicate via exactly one series of channels". What's a "series of channels"? A mini example on what can and cannot be written in CP / Hypersequent CP / Linear Compositional Choreographies would probably help.

  The authors: We clarifed this in page 2.

- The Introduction should mention that this article is the extended version of a published conference paper.

  The authors: We have now added a paragraph at the end of the introduction.

- Please write some introductory text for Section 4. At this point I had forgotten most about what PCP is and why it matters for this paper.

  The authors: We have added an opening to sec 4, clarifying what PCP is and why it matters to us.

- page 10: in "a configuration C with flag \phi" you highlight C but not \phi (and likewise in the second-last line of the same paragraph). What's the rationale for colouring things?

  The authors: we have fixed this now.

- The document is full of emphasised words, a bit too much for my taste. I'd suggest to highlight only keywords that should be remembered for later, not words that the reader should really read (the reader should read everything, and if not that part should be erased)---an example is the emphasis on "alone" in line 4 of page 2. This might be a matter of taste so it's not a strong suggestion.

  The authors: we have fixed this now.

- page 4: You use a different font than usual for the empty set symbol, so maybe write explicitly in parenthesis that it is what you mean when you use the symbol for the first time?

  The authors: The rationale for colouring terms is to communicate their syntactic sort: red for terms, blue for types, teal for priorities & priority constraints. This may not have been consistently applied.

## Related Work

- 2nd paragraph: You say that Linear Compositional Choreographies maintain a correspondence to CLL, but they are based on Intuitionistic Linear Logic.

  The authors: We have now fixed this.

- page 27: Rule T-Halt recalls standard session types rather than linear logic. Could you elaborate on what the link between PCP and linear logic is? See also my previous comment on the introduction.

  The authors: We have now added section 4.4 on PCP and PLL to clarify this.

- 3rd paragraph of Section 6: Similarly, I don't think the average reader will know what a "global type" is. Might be worth saying something about it.

  The authors: We have now clarified this.

- 3rd paragraph of Section 6: You say that [CM13] combine MPST with choreographies to achieve deadlock-freedom. But global types in MPST _are_ choreographies. Do you mean choreographic programming ("combine MPST with choreographic programming")?

  The authors: Yes, thank you. We have fixed this now.

- By the way, just like global types, I don't think that the average reader will know what choreographic programming is.

  The authors: We have added a description of choreographies in this paragraph.

- 2nd paragraph: You say that Linear Compositional Choreographies maintain a correspondence to CLL, but they are based on Intuitionistic Linear Logic.

  The authors: We have fixed this.

- 1st paragraph of Section 6: As far as I know one of the most powerful of Kobayashi's systems is the one in

  > Naoki Kobayashi, Cosimo Laneve
  > Deadlock analysis of unbounded process networks. Inf. Comput. 252: 48-70 (2017)

  so it might be worth citing. This system seems much more powerful than the one presented in this paper (but has no link to linear logic, as far as I know, so it doesn't detract from the authors' contribution).

  The authors: we have now added this related work and commented about it, thanks.

- Your work and GV in general reminded me a lot of this paper:

  > Bernardo Toninho, Luís Caires, Frank Pfenning:
  > Higher-Order Processes, Functions, and Sessions: A Monadic Integration. ESOP 2013: 350-369

  where the session-typed pi-calculus (with linear logic) is integrated with functions. Probably also worth mentioning.

  The authors: we have now added this related work and commented about it, thanks.


## Minor comments

- page 23: In case (4), before introducing the subcases (a) and (b), it'd be kind to say that L' is either a ready term or a value.

- page 26: you sometimes say "well typed" and other times "well-typed".

  The authors: we fixed this and use consistently well typed.

- page 8: "to applied" -> "to be applied"

- 1st paragraph of Section 6: "andcapabilities" -> "and capabilities"

- page 6: The syntax of configuration needs a line break or some spacing, I think.

- page 6: I couldn't really make sense of the equations for the markings. I proceeded by guessing what spacing should have been there.

- last line of page 1: I think you lack a colon at the end.

- page 26: T-Res sTates

- 1st line: "verify correct ordering of operations, namely protocols". Don't session types verify _implementations_ of protocols, instead of the protocols themselves?

- 2nd line: "Regular types". I don't think you mean regular types in the technical sense. Perhaps you mean data types?

  The authors: thank you for pointing out the typos and minor issues. We have now fixed them in the paper.

# Review 2

## Presentation and text

- References: It would be nice if references included DOI links.

  The authors: we will add the DOIs to the final version; we kept the bibliography succinct because of the page limit enforced by the journal. We will discuss this with the editors.

- Abstract: It seems rather unusual to include citations.

  The authors: it is not uncommon for references to be included in the abstract. We think it gives a more complete picture, while allowing the abstract to remain succinct. Without the references we would need to expand on several notions, which defeats the purpose of a succinct abstract.

## General comments

- The reviewer comments that they cannot write down derivation for `• let (x, x′) = new in spawn(λ().echo x); x′`.

  The authors: we apologize, there is typo in the term and it should be `• let (x, x′) = new () in spawn(λ().echo x); x′`. We have fixed this in the paper.

- P2, ”there have been several attempts at developing Curry-Howard correspondences”: Attempts, implies that it failed.

  The authors: we have fixed this now.

- P2, ”Concurrent lambda-calculi maintain a clear separation between the program ... and the configurations”: True also for some other session-typed languages.

  The authors: we have fixed this now.

- P3, ”Priority GV offers a more fine-grained analysis of communication structures”: Clarify?

  The authors: we have now clarified this in the paper.

- P4: Why does top denote a lower bound and bottom an upper bound? Shouldn’t it be the other way around?

  The authors: we have now clarified this in the paper in the typing rule section, right after pure functional types.

- P5, ”top-most connective”: Left-most?

  The authors: we chose top-most because it refers to the tree of the type. Also,  we believe that top-most is unambiguous.

- P6, grammar, bottom of page: Why is K (defined earlier in the term syntax) a value? Shouldn’t K be mentioned in rhs of E? Also, I do not understand the need for the thread evaluation context, nor do I understand how it fits with the remaining notions, E and G. F doesn’t show up there. Could it be that F should appear in the rhs of G? Maybe instead of the hole?~~

  The authors: Functions are values, K is the sort for builtin functions, so K is a value. The thread evaluation context is separately useful. The contexts F and G have holes of different types. They are used in different places.

- SC-ResComm: Why is the side condition necessary? Doesn’t name restriction generate fresh names?

  The authors: Yes, operationally, the `new` function generates name restrictions with fresh names. However, this is not encoded as a property of the _syntax_ of terms. Therefore, to ensure that the equivalence works for any configuration, and not just configurations which are reachable by the operational semantics, it needs that side-condition.

- P8, ”We no longer require that every child thread finishes by returning a terminated channel”: Doesn’t that have implications for linearity?

  The authors: It doesn't. In previous settings, each child thread returned its terminated channel to be closed by the "runtime system". In our setting, it is enforced by the type system that each child thread must close its terminated channel.

- Fig2: rule T-Absurd would admit weakening, so is wrong.

  The authors: The rule T-Absurd is exfalso, i.e., from a proof of false, or a term of the empty type, anything follows, including weakening.

  We believe that T-Absurd can only be used to derive weakening in the presence of a proof of false. If the reviewer believes that T-Absurd admits general weakening, we would welcome them to elaborate.

- T-Pair: why should p < minpr(∆)?

  The authors: We need this condition because of the operational semantics evaluating products, which evaluate the fields of a pair in order.

- Lemma 3.2: Also, shouldn’t there be a relationship on p and q?

  The authors: There is no need for a relationship between p and q because by Lemma 3.1 q=\bottom for all cases.

- The proof of Lemma 3.3 is sloppy. It omits the typing of evaluation contexts, which is all glossed over in the last case, dismissed as immediate. Also, it is stated for open terms. Presumably, Gamma can only contain channel names at this stage, but that is not made precise, nor guaranteed.

  The authors: Lemma 3.3 is subject reduction for a simply-typed lambda calculus with constants, which is standard. We clarified this in the paper.

- Also, I am not familiar with type schemas, some explanation would be helpful.

  The authors: we have now fixed use of A,B,C in type schemas and added further explanation.

- P8, middle of page, in (b): not sure how to parse this arrow/implication?

  The authors: This is the composition of the structural congruence and the reduction relation. We split them up and elaborated in the text:

  > In GV, this is not the case, and subject reduction relies on proving that if the result of rewriting via ≡ followed by reducing via −→C is an ill-typed configuration, we can rewrite it to a well-typed configuration via ≡.

- Lemma 3.2 proof, it is not clear what is meant by right arrow with label V/x. What is the semantics of it? Note, I didn’t check the remaining cases. But in general I find the proof not detailed enough. Several steps are omitted.

  Fig.10: What is the semantics of this arrow/implication?

  The authors: It is the unfolding of the definition of substitution and translation, respectively. We have rewritten these to be single-lined arrows instead, which is more consistent with the remainder of the paper and the usual notation for commuting diagrams.

- P22, explanations below Lemma 3.7: This seems important, but it should be elaborated, I wasn’t able to understand the details. Also, I don’t remember that the term canonical forms has been defined. Is a term in canonical form if it is ready? (Reading on, I see that the term canonical form is now defined. So, the sequencing here is probably not ideal.)

  The authors: we added emphasis to make it apparent at the start of the sentence that the term is being defined, as we did for the other terms.

- P22: I am surprised to read that progress seems to allow ready terms. Shouldn’t a stronger progress statement be possible due to linearity?

  The authors: I believe you may be reading progress for the term language as progress for the configuration language. we have defined two different progress properties, for terms and for the whole language. In the paper, the results are labelled accordingly.

- P22, ”we opt to move all nu-binders to the top”: Where is that done?

  The authors: This is done in the definition of canonical forms that's referenced in the reviewer's remark, as well as in the associated canonical forms proof by "using SC-ResExt".

- P24, pr(): here pr is used, earlier minpr. Not sure whether that is intended, but it also caused mistakes in an earlier proof (see earlier remark). Actually, this definition uses again minpr.

  The authors: We changed the definitions of \pr and \minpr. We now overload \pr to work on session types, data types and contexts, and remove \minpr.

- P26, ”Finally, since our reduction relation is a strict subset of the reduction relation in the original [DG18b], we defer to their proofs.”: I am not convinced by this argument, i.e., why should the proof that was carried out for a bigger system hold for a subset?

  The authors: thanks for noticing this, we meant subject reduction (Thm 2) specifically and we clarified this in the paper.

- Lemma 4.5: this lemma seems to rely on a translation (notation (.)), which has not been introduced yet, as far as I can tell! See also my remark in the previous section.

  The authors: We have included our definition for the translations from PCP to PGV, which had been erroneously removed from the journal submission.

- Proof of Lemma 3.4: it does not seem to go by induction of C = C’ because structural congruence is not an inductive definition. Instead, it seems typing derivations of the structurally equal configurations are provided and it is shown that the same type is derived.

  The authors: Derivations of structural congruence are an inductive definition, and we say that we proceed "by induction on the derivation of C = C'". The language is finite, so there are only inductive definitions.

- Lemma 3.7: here the remark is made that Gamma contains only session types. Reminding of my earlier remark regarding closed terms, I think this remark should also be made for subject reduction?

  The authors: "Only contains session types" means that the term is closed wrt variables, but may become blocked on a channel, i.e., be ready. So this is essentially progress for variable-closed terms. If there's variables, obviously progress becomes trickier, since we may also become blocked on a variable. Subject reduction holds for all terms.

- Proof of Thm 4.4: this is not a rigorous argument. I would like to understand better the architecture of the proof. It seems to be going by cases, so I want to be convinced that they are exhaustive. Also, various inferences are not properly justified.

  The authors: we have marked this proof as a sketch. We have also added the following comment:
  >  This proof follows the exact same reasoning and proof sketch given by Kobayashi in \cite{kobayashi06} and later adopted by Dardha and Gay for PCP in their technical report \cite{dardhagay18extended}.

- Figures 3-5: I have not checked them for mistakes. What is the significance of providing this syntactic sugar?

  The authors: We use syntactic sugar in the examples. In addition, giving syntactic sugar for select and offer is a witness to the expressivity of our language. Select/offer are normally primitives in session typed pi-calculus.

- P8, last sentence: At this point it’s not clear to me how the lower bound is approximated.

  The authors: we addressed this at the third paragraph of sec 2.3.

- P6: again, the definitions for the flags lack space to separate them. Also, this seems not a proper inductive definition, i.e., base cases are missing. Moreover, what seems required is a left to right reading here, i.e., the right to left reading doesn’t seem to make sense. I think the proper way to define this would be as an inductive definition over the configuration, in particular decomposing C||D. The introduction of ”+” seems unnecessary, moreover the semantics of it is not defined. And, after having read the paper, these definitions are later on never used.

  The authors: We added the required space. "+" is used in the T-Par rule.

- Another question I was left wondering about is whether priorities are inferred by typing or whether the programmer has to provide them. The former seems to be the case, but this should be made explicit. Also, it would be helpful to provide a complete, unsuccessful typing derivation for Example 2.2. Two individual derivations, for each thread, are given on page 10, which show that the derivations impose contradicting orderings on the priorities. It would then also be helpful to show the rule that composes the two derivations and fails because of the contradiction. Which rule would that be?

  The authors: we added the following passage:

  > For simplicity, we assume priority annotations are not inferred, but provided as an input to type checking. However, for any term, priorities can be inferred, e.g., by using the topological ordering of the directed graph where the vertices are the priority meta-variables and the edges are the inequality constraints between the priority meta-variables in the typing derivation.

- About top and bottom on lolli: aren’t they used counter standard usage? I.e., shouldn’t the greatest upper bound be top? After all the priorities on the sequent are joined.

  The authors: In the paper we have the following sentence.
  > The lower bound for a pure function is top as pure functions never start communicating. For similar reasons, the upper bound for a pure function is bottom.

- Fig2, runtime typing: Shouldn’t these rules incorporate the earlier defined + operator to ensure that there is only one main thread?

  The authors: The T-Par incorporates the + operator.

- P9: At first, I didn’t see how the typing rule for New ensures that both endpoint have same priority. Maybe remind the reader that S and S requires priorities to be the same.

  The authors: In the paper we have the following sentence.

  > _(immediately after the figure)_
  >
  > "The typing rule for new ensures that both endpoints of a channel share the same priorities."


## Minor Changes

We have fixed all the minor comments below.

- We have fixed all occurances of bare `new`.

- P2, ”communicate via exactly one series of channels”: What is meant by series of channels?

- P28, ”Let this process be let this be Pi...”: grammar

- P36: It would be helpful to already alert the reader to the figure on the next page when discussing the setup here.

- P24, pr(): here pr is used, earlier minpr. Not sure whether that is intended, but it also caused mistakes in an earlier proof (see earlier remark). Actually, this definition uses again minpr.

- Lemma 3.2 proof, 2nd case: pr() should be minpr().

- Lemma 3.2: Metavariable Theta has not been introduced earlier. For typing environments, only Gamma and Delta have been introduced.

- P2, ”processes and shared channels to trees”: What is meant by shared channels? Please clarify.

  The authors: A channel is shared by two processes if each holds an endpoint.

- Proof of Lemma 3.1 misses cases T-Var and T-Const.

- P10: Example lambda abstraction, I don’t think that the metavariable A was ever introduced.

  The authors: thanks, that should be T.

- P8, ”In PGV, we keep track of a lower and upper bound on the priorities of a term, i.e., while evaluating the term, when does it start communicating, and when does it finish”: Nitpicking, but this is not really properly formulated. What does the ”it start” refer to? Use of resp. would be helpful.

  The authors: we fixed it.

- P8, ”allows restriction to applied”: to be applied

- P6, ”overlap between flags and priorities”: Could you clarify what the implications of this overlap are? Or does it just mean that the color indicates what ”circle” means?

  The authors: Yes; we condensed that paragraph.

- P2, ”can be tweaked to satisfy reflection”: What is meant by reflection here?

- P3, ”is typeable and guaranteed deadlock-free”: Guaranteed to be

- P5: ”to denote the minimum and maximum”: ..., respectively. Also, that listing seems to be missing max!

  The authors: we defined max here as we need it and it is used later.

- P5: The programs in Example 2.1 are not well-formed wrt abstract syntax of terms defined on page 5. For example, the term ”recv x” cannot be parsed.

  The authors: The term `recv x` is well-formed. Specifically, it is an application (of the form `M N`) where:
    * `M` is a constant (of the form `K`), specifically, it is `recv`; and
    * `N` is a variable (of the form `x`).

- P6: I am not sure how to parse the grammar of configurations. The two productions seem not clearly separated. I believe it should be phi ::= closed circle — open circle and then separately, C, D, E ::== ...?

- P2, ”succinctness of process calculi”: What is meant?

  The authors: we mean compared to concurrent lambda calculi.

- P2, ”they achieve by restricting structure of”: the structure of


## Related work

The reviewer suggested adding an comparing to the following related work.
- M. Coppo, M. Dezani-Ciancaglini, L. Padovani, and N. Yoshida. Inference of global progress prop- erties for dynamically interleaved multiparty sessions. In COORDINATION, 2013. doi: 10.1007/ 978-3-642-38493-6\ 4.

- M. Coppo, M. Dezani-Ciancaglini, N. Yoshida, and L. Padovani. Global progress for dynamically interleaved multiparty sessions. MSCS, 26(2):238–302, 2016. doi: 10.1017/S0960129514000188. URL https://doi.org/10.1017/S0960129514000188.

- B. Toninho, L. Caires, and F. Pfenning. Higher-order processes, functions, and sessions: A monadic integration. In ESOP, volume 7792 of LNCS, pages 350–369, 2013. doi: 10.1007/978-3-642-37036-6\ 20. URL https://doi.org/10.1007/978-3-642-37036-6\_20.

  The authors: many thanks for the suggestion, we have now added all the above related work and compared to them.



# Review 3

- I disagree with the (informal) definition of session interleaving used in e.g. paragraph 2, page 2, of the introduction. The authors state that:

  > [...] This ensures that two processes can only communicate via exactly one series of channels, which rules out interleavings of sessions, and guarantees deadlock freedom
  > To my understanding, session interleaving is the ability of a process to communicate on more than one channel, which is clearly supported by linear logic-based systems in a deadlock-free way. This is in sharp contrast with the original session type works where the sheer fact that a process can use more than one channel entails the possibility of deadlock. What is ruled out is cyclic dependencies of blocking actions, not interleaving.

  The authors: "What is ruled out is cyclic dependencies of blocking actions, not interleaving." That's actually not true, or not at least overly rose-tinted. What linear logic based systems ensure is that information can only flow from one process to another across one unique path. Since that path consists of session-typed channels, and session types rule out cyclic dependencies on session-typed channels, deadlock freedom follows. Sure, that *does* rule out "cyclic dependencies of blocking actions", but it rules out much more than that. Priorities rule out *exactly* all cyclic dependencies of blocking actions, and nothing else.

- The authors should state clearly what the downsides of coupling channel creation with thread spawning in a setting such as GV are (beyond the acyclicity constraint).

  The authors: we have added a clarification that GV suffers from a complicated metatheory as a consequence.

## Minor comments


- page 2, paragraph 2: combing -> combining

- page 6: formating of \phi ::= ... is broken

- Section 6, paragraph 2: conservation types -> conversation

- page 10: l1, enforce sequentially

The authors: many thanks for this. We have addressed typos and inconsistencies.


## Related work

- The issue raised in the abstract about CP is coupling thread spawning and channel creation is true also about the earlier work of Caires and Pfenning, and is generally true of all works in this space based on the core proof theory of linear logic. I suggest reflecting this in the abstract rather than singling out CP in this sense.

  The authors: We have now added a paragraph about this in the abstract.

- The notion of Ready Term (Def. 3.6) seems related to the notion of poised process of [BP17,BTP19] and live process of [CP10]. A remark to this effect would be helpful.

  The authors: we have now commented about it and restructured this part of the paper.

- Since the orignal publication of this work, a few works on deadlock-freedom by typing that go beyond the languages that stem directly from the logical interpretation of session types have been published that should be included in the related work discussion. Please comment on the recent work by Rocha and Caires on shared state in a language inspired by differential linear logic:

  > Pedro Rocha, Luís Caires:
  > Propositions-as-types and shared state. Proc. ACM Program. Lang. 5(ICFP): 1-30 (2021)

  Please comment on the work by Qian, Kavvos and Birkedal using coexponentials:

  > Zesen Qian, G. A. Kavvos, Lars Birkedal:
  > Client-server sessions in linear logic. Proc. ACM Program. Lang. 5(ICFP): 1-31 (2021)

  The authors: thanks, we have now added these references and commented about the work.