# TODO

- ~~@Reviewer2: P2, ”there have been several attempts at developing Curry-Howard correspondences”: Attempts, implies that it failed.~~

  There is no suggested change.
  I disagree that "attempt" implies failure.

- ~~@Reviewer2: References: It would be nice if references included DOI links.~~

  @wenkokke: Sure would, but we removed them because there was a page limit for the bibliography, and I'm not putting them back. Unless the editor requires this of us.

- ~~@Reviewer2: Abstract: It seems rather unusual to include citations.~~

  @wenkokke: Let's check in with the editor on this. "Unusual" does not mean bad. If the editor says no, we'll cut them.

- ~~@Reviewer2: P2, ”Concurrent lambda-calculi maintain a clear separation between the program ... and the configurations”: True also for some other session-typed languages.~~

  Do we imply that is not the case? I don't think we do.

- ~~@Reviewer2: P6, grammar, bottom of page: Why is K (defined earlier in the term syntax) a value? Shouldn’t K be mentioned in rhs of E? Also, I do not understand the need for the thread evaluation context, nor do I understand how it fits with the remaining notions, E and G. F doesn’t show up there. Could it be that F should appear in the rhs of G? Maybe instead of the hole?~~

  @wenkokke: No. Functions are values, K is the sort for builtin functions, so K is a value. I don't know why K should be in the rhs of E, and @Reviewer2 does not elaborate. The thread evaluation context is separately useful. The contexts F and G have holes of different types. They are used in different places.

- ~~@Reviewer2: SC-ResComm: Why is the side condition necessary? Doesn’t name restriction generate fresh names?~~

  Following the operational semantics, sure, but it's not encoded in the term syntax. Your suggestion amounts to moving the side-condition to well-formedness of the term syntax.

- ~~@Reviewer2: P8, ”We no longer require that every child thread finishes by returning a terminated channel”: Doesn’t that have implications for linearity?~~

  It doesn't. In previous settings, each child thread returned its terminated channel to be closed by the "runtime system". In our setting, it is enforced by the type system that each child thread must close its terminated channel.

- ~~@Reviewer2: P8, middle of page, in (b): not sure how to parse this arrow/implication?~~

  @wenkokke: Which? The composition of equality and reduction?

- @Reviewer2: Fig2: rule T-Absurd would admit weakening, so is wrong.

  @wenkokke: My buddy, my pal, if you build a proof of False, you can weaken all you want.

- ~~@Reviewer2: T-Pair: why should p < minpr(∆)?~~

  @wenkokke: Because of the operational semantics evaluting products. They're ordered. First field goes first.

# Breaking changes

- We changed the definitions of \pr and \minpr:
  We now overload \pr to work on session types, data types and contexts, and remove \minpr.

- We have included our definition for the translations from PCP to PGV, which had been erroneously removed from the journal submission.

- We have merged the notations `M; N` and `let () = M in N` as they are synonymous, and any use of the latter was an error.

# To the reviewers

We have rewritten the paper with particular focus on abstract, introduction, and related work sections to address the reviewers' comments.

We have added all related work that were suggested to us by the reviewers and rewrote the related work section accordingly.

> "Address the formal link to linear logic that is unclear."

We have dialed down on the link of PGV with linear logic (particularly in contributions, but also throughout abstract and introduction). Moreover, we added a sentence which says that, though we have not proven that PGV is a (non-conservative) extension of GV, we believe that it is. We reference work by Dardha and Perez[^1], which shows that CP can be embedded in a Kobayashi-style system, to support this belief.

> "Provide a more compelling example that explains the need for this new system (in particular in comparison to existing work on session types such at [35])."

We would like to clarify that PGV is not more expressive than Padovani and Novara in terms of what processes are typeable. Rather, we think of PGV as an alternative language, which uses session types as opposed to linear channels, and which comes with a proven-correct relation to PCP. On the theoretical side, our aim was to give a calculus more expressive than GV which completes the picture of GV/CP and PGV/PCP. On the practical side, we found PGV easy to implement as a library for deadlock-free session-typed communication in Haskell[^2].

> "Dial down the misleading and unjustified claims about session types in the abstract and introduction in particular, and properly situate the work (please see Review 2 for concrete points that must be addressed)."

We rewrote the abstract and introduction clarifying the parts on deadlock freedom and the fact that our setting is binary session types, not MPST, and functional programming via GV, not process calculus.

> "Reviewer #2: It claims to admit a reduction semantics. The problem there is that mainstream session type systems have always been based on reduction semantics. To get such a semantics for linear functions is just a minor trick."

We would like to clarify that our contribution was to get rid of commuting conversions and use structural congruence, which makes our updated PCP closer to pi-calculus. We agree that this is a niche contribution, and as such have updated our contributions list to deemphasise this point.

> Reviewer #2: "Neither of [6,43] offer Curry-Howard correspondences with for a session typed pi-calculus. They do use pi-calculus like syntax, but that is just a trick."

We have rephrased the introduction to emphasise that these papers work towards a correspondence between session typed pi-calculus and linear logic.

> Reviewer #2: "In the direction of linear logic there are extensions of the genuine proof calculus BV hat can express session type systems that internalise the causal dependencies of Honda et al., which is a paper not compared to precisely either here or in the work on PCP which takes a more adhoc approach to internalising dependencies than BV."

We believe that the Curry-Howard correspondence between BV and session-typed pi-calculus is an interesting line of work, and have added a brief discussion of BV[^3] and two papers building on it[^4][^5] to the related work.

> Reviewer #3: "Being kinder to process calculi would only make the paper look better."

We rewrote the paragraph on the relevance of functional languages and GV, focusing on the practical side by referencing our library implementation in Haskell.

> Reviewer #3: "I would be happy if the authors made the full version accessible somewhere (e.g., arXiv)."

We have uploaded the full paper, including appendices, on arXiv[^6].

> Reviewer #3: "What do you mean with "deadlock freedom by design"?

We have rewritten sentences where 'by design' was occurring, but to clarify, with deadlock freedom 'by design' we meant that deadlock freedom is an integral part of the language or type system, namely all programs accepted are deadlock fee, as in CP, for example.

> Reviewer #3: "There are three overlapping citations to Wadler's work (42-43-44), using different ones in different places, but it seems that just one of them would suffice? (The journal version?)"

We have update the paper to consistently cite journal papers and extended versions in the main text. We used to specify the original works within the references to give a more precise bibliography and timeline. We have removed the references to the original works (to compress the bibliography).

[^1]: Ornela Dardha and Jorge A. Perez, Comparing Type Systems for Deadlock-Freedom, 2018. Available at <https://arxiv.org/abs/1810.00635>.
[^2]: Wen Kokke and Ornela Dardha, Deadlock-Free Session Types in Linear Haskell, 2021. Available at <https://arxiv.org/abs/2103.14481>.
[^3]: Alessio Guglielmi, A system of interaction and structure, 2007.
[^4]: Gabriel Ciobanu and Ross Horne, Behavioural Analysis of Sessions Using the Calculus of Structures, 2015.
[^5]: Session Subtyping and Multiparty Compatibility Using Circular Sequents, Ross Horne, 2020.
[^6]: Wen Kokke and Ornela Dardha, Prioritise the Best Variation, 2021. Available at <https://arxiv.org/abs/2103.14466>.
