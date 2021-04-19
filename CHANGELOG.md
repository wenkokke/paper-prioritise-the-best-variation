# Changes for version 21.07

The authors have rewritten the paper, with particular focus on abstract, introduction and related work sections and have addressed the reviewers' comments as detailed below.

Major

- We rewrote the abstract and introduction clarifying the part on deadlock freedom and the fact that our setting is binary session types (not MPST) and functional programming via GV.
- We updated our contributions following reviewers' suggestions (note that the reduction relation in Updated PCP and it is not related to functions; rather we simply got rid of commuting conversions and use structural cong, which makes the updated PCP be closer to pi-calculus)
- With regards to a new example: we want to highlight that PGV is not more expressive than Padovani and Novara in terms of processes typed, but instead aims to give a more complete GV/CP/PGV/PCP connection and it easy to implement it as a library for Haskell for deadlock free programming with session types. Hence it can have a practical use.
- We have added all related work for MPST that were suggested to us by the reviewers.


Minor

- We have uploaded a full paper on arxiv.
- We have rewritten sentences where 'by design' was occurring, but just to explain 'by design' means that it is an integral part of the language or type system.