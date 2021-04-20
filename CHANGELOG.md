# Changes for version 21.07

The authors have rewritten the paper, with particular focus on abstract, introduction and related work sections to address the reviewers' comments. Details below.

Major changes

- We rewrote the abstract and introduction clarifying the parts on deadlock freedom and the fact that our setting is binary session types (not MPST) and functional programming via GV (not process calculus).
- We updated our contributions list following reviewers' suggestions. Regarding reviewer's 2 comment on reduction relation on PCP we would like to clarify that our contribution here simply getting rid of commuting conversions and use structural congruence instead, which makes our updated PCP closer to pi-calculus.
- With regards to a new example: we want to clarify that PGV is not more expressive than Padovani and Novara in terms of what processes can be typed; we think of it as an alternative programming language. On the theoretical side our aim was to give calculus more expressive than GV (answering our research question) and 'close the circle' of GV/CP/PGV/PCP connection. On the practical side, PGV is easy to implement as a library in Haskell for deadlock free functional programming with session types.
- We have added all related work for MPST that were suggested to us by the reviewers and rewrote the text on related work.


Minor

- We have uploaded a full paper on arxiv.
- We have rewritten sentences where 'by design' was occurring, but just to clarify with deadlock freedom 'by design' we meant that deadlock freedom is an integral part of the language or type system, namely all programs accepted are deadlock fee, as in CP, for example.