We have rewritten the paper with particular focus on abstract, introduction, and related work sections to address the reviewers' comments.

We have added all related work that were suggested to us by the reviewers and rewrote the related work section accordingly.

> Address the formal link to linear logic that is unclear.

We added a sentence which says that, though we have not proven that PGV is a (non-conservative) extension of GV, we believe that it is. We reference [1], which shows that CP can be embedded in a Kobayashi-style system, to support this belief.

> Provide a more compelling example that explains the need for this new system (in particular in comparison to existing work on session types such at [35]).

We would like to clarify that PGV is not more expressive than Padovani and Novara in terms of what processes are typeable. Rather, we think of PGV as an alternative language, which uses session types as opposed to linear channels, and which comes with a proven-correct relation to PCP. On the theoretical side, our aim was to give a calculus more expressive than GV which completes the picture of GV/CP and PGV/PCP. On the practical side, we found PGV easy to implement as a library for deadlock-free session-typed communication in Haskell.

> Dial down the misleading and unjustified claims about session types in the abstract and introduction in particular, and properly situate the work (please see Review 2 for concrete points that must be addressed).

We rewrote the abstract and introduction clarifying the parts on deadlock freedom and the fact that our setting is binary session types, not MPST, and functional programming via GV, not process calculus.

> Reviewer #2: It claims to admit a reduction semantics. The problem there is that mainstream session type systems have always been based on reduction semantics. To get such a semantics for linear functions is just a minor trick.

We would like to clarify that our contribution was to get rid of commuting conversions and use structural congruence, which makes our updated PCP closer to pi-calculus. We agree that this is a niche contribution, and as such have updated our contributions list to deemphasise this point.

> Reviewer #2: Neither of [6,43] offer Curry-Howard correspondences with for a session typed pi-calculus. They do use pi-calculus like syntax, but that is just a trick.

We have rephrased the introduction to emphasise that these papers work towards a correspondence between session typed pi-calculus and linear logic.

> Reviewer #2 In the direction of linear logic there are extensions of the genuine proof calculus BV [1] that can express session type systems that internalise the causal dependencies of Honda et al., which is a paper not compared to precisely either here or in the work on PCP which takes a more adhoc approach to internalising dependencies than BV.

We believe that the Curry-Howard correspondence between BV and session-typed pi-calculus is an interesting line of work, and have added a brief discussion of [3, 4, 5] to the related work.

> Reviewer #3: Being kinder to process calculi would only make the paper look better.

We rewrote the paragraph on the relevance of functional languages and GV, focusing on the practical side by referencing our library implementation in Haskell.

> Reviewer #3: I would be happy if the authors made the full version accessible somewhere (e.g., arXiv).

We have uploaded the full paper, including appendices, on arXiv.

> Reviewer #3: What do you mean with "deadlock freedom by design"?

We have rewritten sentences where 'by design' was occurring, but to clarify, with deadlock freedom 'by design' we meant that deadlock freedom is an integral part of the language or type system, namely all programs accepted are deadlock fee, as in CP, for example.

> Reviewer #3: There are three overlapping citations to Wadler's work (42-43-44), using different ones in different places, but it seems that just one of them would suffice? (The journal version?)

We have update the paper to consistently cite journal papers and extended versions in the main text. We used to specify the original works within the references to give a more precise bibliography and timeline. We have removed the references to the original works (to compress the bibliography).

[1]: Ornela Dardha and Jorge A. Perez, Comparing Type Systems for Deadlock-Freedom, 2018.
     Available at <https://arxiv.org/abs/1810.00635>.
[2]: Wen Kokke and Ornela Dardha, Deadlock-Free Session Types in Linear Haskell, 2021.
     Available at <https://arxiv.org/abs/2103.14481>.
[3]: Alessio Guglielmi, A system of interaction and structure, 2007.
[4]: Gabriel Ciobanu and Ross Horne, Behavioural Analysis of Sessions Using the Calculus of Structures, 2015.
[5]: Session Subtyping and Multiparty Compatibility Using Circular Sequents, Ross Horne, 2020.
[6]: Wen Kokke and Ornela Dardha, Prioritise the Best Variation, 2021.
     Available at <https://arxiv.org/abs/2103.14466>.
