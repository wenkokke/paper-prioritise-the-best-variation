# TODO: discuss

- @Reviewer2: While I generally understand the use of priorities to rule out circular waiting dependency, I am unclear about what the invariants are that the type system maintains in terms of priorities. Also, I didn’t get a clear understanding of the handling of priorities when it comes to closures. With regard to the former, for example, I am unclear about what the precise relationship is between the priority of the sequent and those in the context. There seems to be some relationship that is imposed by typing, but I was unable to distill the pattern, nor have the authors properly explained this. Closures are really tricky, and the authors should devote more time and space to convincingly argue that the enforced treatment is correct. Ideally, there would be a discussion based on a number of examples, including one that would be ruled out by typing, so that the reader can get an understanding of what the key concerns are. The current treatment is short, with the only justification for the chosen treatment: ”Closures suspend communication, so T-Lam stores the priority bounds of the function body on the function type, and T-App restores them.”

  @elektra85: at this stage we cannot do the discussion section + examples. I think adding a couple of sentences in English would do. These should comment on the invariants wrt priorities and the relationship between priorities of the seq and context.

- @Reviewer1: In general, the presentation seems to be aimed at experts in GV. Please make it more accessible.


- @Reviewer1: page 23: In case (4.b), if L' is a value like an abstraction or a pair, what do you mean by "the endpoint that it is blocked on"?

  @wenkokke: This requires more consideration on my part.
  @elektra85: what consideration? can't you comment exactly on what the reviewer is asking? just say the endpoint that it is blocked on, i.e., blah blah.

- @Reviewer1: Having a table for syntactic sugar somewhere would be helpful.

- @Reviewer1: page 8: Would be nice to have an example about reductions before proceeding to typing.

- @Reviewer1: pages 27-36: These sections are too dry. There's no explanation of what works as usual, what is different, how the translation from PCP to PGV works (it is not even really _defined_ before the proofs!), and what the reader should focus on. It almost reads like a file intended for a theorem prover. I suggest that you rewrite these sections by explaining these aspects, presenting selected rules and the translation with examples, and then putting what "works as usual" into an appendix.

- @wenkokke: Regarding Figure 3, are these definitions? I believe so: we're deriving the typing rules for the syntactic sugar from the core typing rules.
  @elektra85: perhaps your comment above is misplaced wen, and refers to something else? anyway I think this is far to big to be addressed now. however, you can add a paragraph at the beginning of the sections the reviewer is mentioning by recaping exactly what they want: what is new and where the reader should focus.

  Related comments:

  - @Reviewer1: page 12: Here and in all other cases in the remainder, you write "= with \Delta" on top which usually stands for a definition. Is that what you mean? Don't you mean a simple "=" instead? Or perhaps you mean that "= with \Delta" stands for "which is defined as"? A clarification would be appreciated.

  @elektra85: add a sentence about this in the paper. reviewer1 has been kind and a clarification would be appreciated is a kind request.


- @Reviewer2: Another technical comment I have is on the distinction between variables and channels (which the authors refer to as names). The latter are generated at runtime (via new), and are also gathered, in the environment. I believe that’s also the reason why the usual theorems (preservation and progress) are stated relative to a non-empty context. However, the formalization should guarantee that the respective terms are closed. It would also be helpful if different meta variables were used for variables and names. Currently, x, y, z are used for both.

  @elektra85: needs to be addressed.