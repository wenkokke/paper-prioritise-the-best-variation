The paper presents Priority GV (PGV), a session-typed concurrent functional language where the connectives in session types are annotated with priorities. Following Kobayashi's and Padovani's well-established methods and the previous development of PCP (Priority Classical Processes, a session-typed calculus with priorities), priorities are used to guarantee that well-typed terms are deadlock-free.

By means of an encoding, PGV is shown to be expressive enough to capture processes in PCP.


# Detailed Comments

I think that the paper will have a readership and that it is in the scope of LMCS. It is not a surprising paper: it seems that most of the useful intuition comes already from PCP and other works that split cut into two separate rules, and that the application of this intuition to GV leads quite naturally to fixing its problems. (If I missed some challenge, I'd appreciate if the authors could point me to them.) However, I think that papers like this are valuable (there is a lot of interest around the relationship between linear logic and process calculi right now).

Detailed comments are given in the remainder of this review.
I am asking for a major revision mainly because I believe that addressing all my comments and questions will take some time, and presentation made it difficult for me to read some parts of the paper and understand what it brings in terms of novelty (see in particular my comments for Section 4).

Some overarching questions that I'd like to see addressed in a revised version: Did you find it straightforward to apply the concepts from PCP to PGV? What was challenging?


## Abstract (& Intro)

You say in the abstract that deadlock-freedom is guaranteed in CP and GV by combining parallel composition/thread spawning with channel creation. Later in the Introduction, you say that deadlock-freedom actually depends on restricting the structure of processes and shared channels to trees, which is achieved by the aforementioned combination. But then you mention works (Hypersequent CP and Linear Compositional Choreographies) that achieve the tree structure without that combination. So the really important thing seems to be the "tree structure" of processes. What do you mean by that exactly? You say that "this ensures that two processes can only communicate via exactly one series of channels". What's a "series of channels"? A mini example on what can and cannot be written in CP / Hypersequent CP / Linear Compositional Choreographies would probably help.

The Introduction should mention that this article is the extended version of a published conference paper.


## Section 1 (Introduction)

1st line: "verify correct ordering of operations, namely protocols". Don't session types verify *implementations* of protocols, instead of the protocols themselves?

2nd line: "Regular types". I don't think you mean regular types in the technical sense. Perhaps you mean data types?

last line of page 1: I think you lack a colon at the end.

The document is full of emphasised words, a bit too much for my taste. I'd suggest to highlight only keywords that should be remembered for later, not words that the reader should really read (the reader should read everything, and if not that part should be erased)---an example is the emphasis on "alone" in line 4 of page 2. This might be a matter of taste so it's not a strong suggestion.

2nd paragraph: You say that Linear Compositional Choreographies maintain a correspondence to CLL, but they are based on Intuitionistic Linear Logic. 
Also, what do you mean when you say that Hypersequent CP and Linear Compositional Choreographies "maintain" the correspondence to CLL?

2nd paragraph: You say that PCP weakens the correspondence to CLL. What do you mean, exactly? Understanding this is important to gauge the relevance of PGV as well.

3rd paragraph: What is "reflection"?


## Section 2

page 4: In your presentation of types, I wondered if there are any well-formedness conditions on priority bounds.
page 4: You use a different font than usual for the empty set symbol, so maybe write explicitly in parenthesis that it is what you mean when you use the symbol for the first time?

page 5: Please explain the syntax of terms carefully. For example, you have a term for sequential composition (M;N) in a functional language, but you don't even mention it in the paragraph that describes terms. The term does not even appear in the semantics.
In general, the presentation seems to be aimed at experts in GV. Please make it more accessible.
Another example is that you say that you "recover fork", but at this point it's not clear what fork was in GV.

page 6: The syntax of configuration needs a line break or some spacing, I think.

page 6: I couldn't really make sense of the equations for the markings. I proceeded by guessing what spacing should have been there.

page 6: The paragraph on values and evaluation contexts is going to be clear only to a selected few. Please write some text that explains how contexts work (holes, notation for replacing a hole with a term, etc.), that values are a specialisation of terms, etc.

page 8: "to applied" -> "to be applied"

page 8: Would be nice to have an example about reductions before proceeding to typing.

page 10: in "a configuration C with flag \phi" you highlight C but not \phi (and likewise in the second-last line of the same paragraph). What's the rationale for colouring things?


## Section 3

page 12: Where is the case for M;N? Is it obtained by composing N of type unit with something like what is typed in T-LamUnit?

page 12: Here and in all other cases in the remainder, you write "= with \Delta" on top which usually stands for a definition. Is that what you mean? Don't you mean a simple "=" instead? Or perhaps you mean that "= with \Delta" stands for "which is defined as"? A clarification would be appreciated.

page 12, case T-LamUnit: I could not find a typing rule for a term let () = ..., which would be necessary here.
At this point I've also realised that I was getting a bit lost between what was syntactic sugar and what is actual syntax of the language. Having a table for syntactic sugar somewhere would be helpful.

page 20, case E-Close: I couldn't make sense of the derivation, where two subderivations seem to be organised vertically?.. Is that the right reading? Could you reorganise it to make it obvious?

page 22: Lemma 3.7 is fundamental and seems to be the key difference wrt PCP and Kobayashi's work. Is that the case? Is the proof trivial? Could you at least provide a sketch, or say at least *why* it is trivial?

page 23: In case (4), before introducing the subcases (a) and (b), it'd be kind to say that L' is either a ready term or a value.

page 23: In case (4.b), if L' is a value like an abstraction or a pair, what do you mean by "the endpoint that it is blocked on"?


## Section 4

Please write some introductory text for this section. At this point I had forgotten most about what PCP is and why it matters for this paper.

page 26: T-Res sTates
page 26: you sometimes say "well typed" and other times "well-typed".
page 27: Rule T-Halt recalls standard session types rather than linear logic. Could you elaborate on what the link between PCP and linear logic is? See also my previous comment on the introduction.

pages 27-36: These sections are too dry. There's no explanation of what works as usual, what is different, how the translation from PCP to PGV works (it is not even really *defined* before the proofs!), and what the reader should focus on. It almost reads like a file intended for a theorem prover. I suggest that you rewrite these sections by explaining these aspects, presenting selected rules and the translation with examples, and then putting what "works as usual" into an appendix.


## Section 6

1st paragraph: "andcapabilities" -> "and capabilities"

1st paragraph: As far as I know one of the most powerful of Kobayashi's systems is the one in

Naoki Kobayashi, Cosimo Laneve:
Deadlock analysis of unbounded process networks. Inf. Comput. 252: 48-70 (2017)

so it might be worth citing.

This system seems much more powerful than the one presented in this paper (but has no link to linear logic, as far as I know, so it doesn't detract from the authors' contribution).


3rd paragraph: Similarly, I don't think the average reader will know what a "global type" is. Might be worth saying something about it.


3rd paragraph: You say that [CM13] combine MPST with choreographies to achieve deadlock-freedom. But global types in MPST *are* choreographies. Do you mean choreographic programming ("combine MPST with choreographic programming")?
By the way, just like global types, I don't think that the average reader will know what choreographic programming is.


Your work and GV in general reminded me a lot of this paper:

Bernardo Toninho, Luís Caires, Frank Pfenning:
Higher-Order Processes, Functions, and Sessions: A Monadic Integration. ESOP 2013: 350-369

where the session-typed pi-calculus (with linear logic) is integrated with functions. Probably also worth mentioning.


page 39, 2nd line: Again, what do you mean by "loosening its ties to linear logic"?