# Meta

> The reviewers require the authors to rewrite their paper, and in particular:
> - address the formal link to linear logic that is unclear (specifically, the concrete points in Review 3 must be taken seriously).
> - provide a more compelling example that explains the need for this new system (in particular in comparison to existing work on session types such at [35]).

@wenkokke: As for a compelling example, we could take a standard example from multiparty session types and encode it. Milner's cyclic scheduler is a bad example, since each individual channel used in it is *linear*, and hence it doesn't demonstrate the difference with Padovani and Novara [35] very well.

> - dial down the misleading and unjustified claims about session types in the abstract and introduction in particular, and properly situate the work (please see Review 2 for concrete points that must be addressed).


# Review 1

## Paper description

> The authors study a refinement of GV, a core functional language with sessions, that allows parallel threads to share two (and possibly more) sessions, while at the same time preserving the deadlock freedom property of the original GV. To achieve this goal, the type structure of GV is enriched with "priorities", numbers attached to the input/output actions of session types and decorating arrow types that enforce the order in which channels are meant to be used. The type system ensures that no circular dependencies are created among different sessions. The papers also assesses the expressiveness of GV, by showing an encoding from PCP (a calculus of sessions based on linear logic and priority annotations) into PGV.

## Overall evaluation

> This is an interesting paper exploring the use of priorities/levels in session types for ensuring deadlock freedom and overcoming the limitation of other logic-based approaches, which restrict the addressable network topologies to trees or forests. The use of priorities by itself is not new, and in fact the proposed type system is closely tied to others found in the literature, but in this paper the authors fill the gap, to some extent, between such type systems and the linear logic interpretation of session types.

> I found one design choice not fully justified by the authors: they choose to encode choices using sums, unlike [19] and going in the direction of using encoded session types [13,35], but then they retain the structure of session types for other communications. My intuition is that this hybrid choice has been made to avoid extending the calculus with primitive constructs that are specific to session communications. Either way, I think that this choice should be motivated and compared to alternatives found in the literature.

@wenkokke: I'm not sure what the reviewer means here? Are they saying "Either *only* linear channels or *everything primitive*?" That'd be a fair point, to be honest. I think the original GV does require a primitive send and receive in order to maintain the tree structure, but we no longer need that, so the main reason we'd have for keeping it is for comparability to the old GV.

> ~~The paper is very readable up to section 3. Here it gets a bit too dense, likely because the authors had to compress the presentation of PCP in little space. Nonetheless, also here the content makes sense to people acquainted with the related literature, except for the reference to Milner's cyclic scheduler. I understand the authors wanted to cite a known example in the scope of their type system, but the given reference is absolutely inadequate to provide any meaningful information. I think the paper stands on its own even without this paragraph.~~

@wenkokke: We can probably remove the paragraph relating to Milner's cyclic scheduler.

@elektra85: I did remove the paragraph on cyclic sched.

> One question that I didn't see addressed nor discussed in the paper is whether this is actually an extension of GV, in the sense that every well-typed GV program is also a well-typed PGV program.  It would be reassuring to know that no well-typed GV program is rejected because of priorities.

@wenkokke: Yes! This is an open research question. We *strongly suspect* that it's true, but even for PCP there is no proof.

> In summary, I think this is a good paper that completes a long standing investigation on the use of priorities in session types. It is clear that a detailed presentation of all the material requires more than is allowed within the limits of a conference submission, but the authors managed to obtain a fairly self-contained version.

## Minor comments

> ~~page 1, abstract: "We show our type system is..."~~

@wenkokke: This is... fine? Added a 'that' just to be clear.

> ~~page 3, before example 1: it is not clear to me the reason why example 1 is typeable in PGV but not in Gay and Vasconcelos [18]. The latter work is not concerned with deadlock freedom, its type system is not strictly based on linear logic and its session types are not decorated with priorities, so I see no reason why the shown example should not be typeable in there, modulo the obvious differences in the syntax of the calculi.~~

> ~~page 4, duality: the last two equations should not have the overbar on the end on the right hand side.~~

> ~~page 10: "which ensure that"~~

> ~~page 11: "In corollay 1 we [will] show..." otherwise it appears as if corollary 1 has already been discussed, while this is not the case.~~

> ~~page 11, definition 2: given that x and y range over arbitrary variables, I think it's superfluous to list both link(x,y) and link(y,x)~~

> page 14, before lemma 7: when showing the translation of sequents, it's not clear whether the o annotation ranges over priorities (it's in a different font), nor where it comes from.

@wenkokke: Ah, we tripped someone up with the collision between GV's ●/○ and the priority variable 'o'!

TODO: @wenkokke insert a clarification that stresses that, unfortunately, GV uses ●/○ to mark main and child threads, and we're keeping that notation for comparability---but watch out, we're using different fonts and colouring to help you tell 'o' and '○' apart.

> ~~page 15, acknowledgments: "they"~~


# Review 2

## Paper description

> This paper applies a technique introduced in an existing calculus called PCP for permitting richer patterns of session interleaving, sometime referred to as a type of delegation, than the very restricted delegation patterns offered by calculi that provide a session calculus-like syntax for linear functions.

> To accept this paper one has to accept that building on GV is a good idea. An external motivation for pursuing this particular combination of calculi is not provided.

@elektra85: We have a full paragraph on why functional languages are useful, and in fact another reviewer did notice this. Said that, is there an external reference we could use to convince @reviewer2 that building on GV is worth it?

> The paper claims to make four contributions:
>
> 1. The selling point of being the "first" to combine PCP and GV is a weak one. I would drop this claim and put here instead a motivation external to sticking two Curry-Howard inspired ideas together.

@wenkokke: I disagree with @reviewer2 here. CP/GV were originally a package deal, so with the publication of PCP, it's natural to ask "What would PGV look like?" We answer that question, and I believe that's a contribution.

> 2. The trick with structural congruence preserving types is just a trick for coming up with a new proof. It's not a major contribution. Indeed it's unclear what this perspective brings to mainstream session types systems, which already had this property. The argument seems to be insular to a particular niche.

@wenkokke: The argument is certainly insular to this particular niche, but it's nonetheless a nice contribution, even if it's limited in scope.

> 3. It claims to admit a reduction semantics. The problem there is that mainstream session type systems have always been based on reduction semantics. To get such a semantics for linear functions is just a minor trick.

@wenkokke: I don't think we claim that our reduction semantics are in *any way* novel or a contribution? Our claim here is that we align PCP's *extant* reduction semantics with what is standard in process calculus. It's a niche contribution, but it's a nice one.

> 4. It provides an encoding of PGV into PCP. However, this is obvious. GV is just a more honest linear function presentation of CP which pretends to be the pi-calculus, but is not. Therefore there is no deep relationship between these systems beyond a change of syntax.

@wenkokke: I think this criticism is somewhat unfair. The encoding isn't surprising, and it's *meant* to show that these systems are in correspondence. The claim that "The translation is obvious because these systems are *clearly* the same" uses its raison d'être to argue against it.

> ~~The research question is also unclear. This paper claims to address the problem that session types cannot guarantee deadlock-freedom in the presence of delegation. While it is true that the original paper on multiparty session types guarantee deadlock-freedom for singleton sessions only, there have been session type systems that do guarantee deadlock-freedom. For example, a recent paper proposes "internal delegation" that guarantees more than deadlock-freedom -- it guarantees lock-freedom for processes with delegation, which is a strictly stronger property that implies deadlock-freedom. This is a quite a serious problem for this paper since it appears to be stated as the main research problem addressed. Rather the problem addressed is that GV does not handle real delegation; but this is different and much more restricted than the problem the authors claim to address up front.~~

@wenkokke: The research question is stated explicitly: "Can we design a more expressive GV where deadlock freedom is guaranteed by design and communication structures are not limited to only trees?" Nowhere do we mention delegation as having a special role in our research question.

@wenkokke: However, it would be extremely useful to find out which papers @reviewer2 is referring to with "a recent paper [which] proposes "internal delegation" that guarantees more than deadlock-freedom" so that we can discuss it in the related work section.

@elektra85: I believe it is [5]

~~TODO: @elektra85 discuss the "internal delegation" paper in the related work section~~

> To substantiate the above better it would be good to be more precise about the contribution. Perhaps you could classify key session type systems that do satisfy deadlock-freedom in the presence of delegation and others that do not. You could then illustrate with good example how some mainstream session type systems (not restricting the particular take on the Curry-Howard world here) do not guarantee deadlock-freedom due to delegation (perhaps separating different kinds of delegation, such as the limited spawn-only type that falls out of the Curry-Howard inspired calculi, which is not classic delegation and is what I think you mean by the tree structure -- a claim that also needs to be illustrated better). You could then explain how to fix some of the systems that do not guarantee deadlock-freedom at all and also how you enable richer delegation patterns. My suspicion though is that if you go though with this then the case for PGV would remain weak.

@wenkokke: I'm not sure what @reviewer2 means with "the limited spawn-only type"? Do they mean the restrictions that on the tensor rule, which ensure the tree structure of the process?

> Why not focus on identifying a new delegation problem rather than adding an existing solution to a closely related existing system?

@wenkokke: I mean, this just says "Why not write a different paper?"

> Examples 1 and 2 are another place where the contribution could be saved. Unfortunately, the example provided is really simple. It is a classic dining philosopher example where both threads await the input of the other. Almost all mainstream session type systems can handle this. I can see two challenge here: firstly, explaining why your starting point, GV, is good if it fails to type Example 1; and, secondly, providing a series of more compelling examples that really explain why we need this new system.

@wenkokke: I mean, plurality and whatnot. It would be a good idea to provide a more compelling example, but I do believe it would be difficult to find examples which aren't encodable, in one way or another, in another formalism---where the only thing we'd have to offer is that the encoding is less painful.

> Since I could not identify a significant contribution of this paper, I cannot support it for acceptance.

## Further comments

> The following prominent sentence is ambiguous, and should be rewritten so that it does not mislead that reader into thinking that a broader class of session type systems fail to guarantee deadlock freedom than those that actually do:

> "Session type systems guarantee communication safety and session fidelity, but cannot guarantee deadlock freedom and avoid bad interleaving of different sessions."

@wenkokke: Good point! We should write "binary session types", not "session types".

(There's a TODO for this later on, as @reviewer2 reiterates this point.)

> Regarding the 1st line of page 2, neither of [6,43] offer Curry-Howard correspondences with for a session typed pi-calculus. They do use pi-calculus like syntax, but that is just a trick. In reality, they offer a Curry-Howard correspondence with linear functions, much like GV more honestly claims. Yes, the argument you use has been published before, but I think it would be really much better to try to find a fresh perspective to keep this line of work moving forward on a more solid set of assumptions and principles.

> "Moreover, the benefit of working with GV over other session-typed functional languages is that GV has strong ties to linear logic, via its relation to CP"

@wenkokke: There's a great point. I'll grant @reviewer2 that CP is a *very non-standard* pi-calculus at best, and that most of its syntax is just a trick. HCP significantly improves the situation, and I believe I can prove that HCP is a truncation of BV which admits a mostly standard process calculus.

TODO: @wenkokke weaken the claims regarding the correspondence with linear logic.

> I would say rather that CP has the saving grace that it is connected to GV, which exposes more clearly the linear functions inhabiting session types. There is a long history of linear functions inhabiting linear logic formulas, e.g., the thesis of Lafont that is not mentioned.

@wenkokke: I'm not sure what @reviewer2 is getting in dragging Yves' Ph.D. thesis into this discussion. From what I can assess, their point is that CP isn't process calculus, but rather linear functions, so you should describe them as such. However, they describe a correspondence between process calculus and BV below, and I think it would be fair to say that they would accept such a calculus as a process calculus. Therefore, I think it's fair for us to position CP as aspiring towards that better calculus? However, I'm uncertain how to incorporate this into the paper.

@elektra85: we could add this to the discussion/conclusion section at the end of the paper.

## Following PC discussion

> The following expands on the message in Review 4, and is in addition to the comments above.
> Several prominent claim such as the second sentence of the abstract are not true in general and the scope in which it might be true is not made clear. For example, the original 2008 paper on multi-party session types allows the IO causal dependency of your example by referring to global types. Other papers make use of multi-party compatibility to reconstruct the global dependencies from the local type and more recently some use model checking directly -- you do not mention such branches of the literature that make justifying your claims harder. Many papers on session types build on these directions and much of the literature is fairly language agnostic, so could be applied to the language typed in this paper.

@wenkokke: @reviewer2 is correct that our claims regarding session types and deadlock freedom are too loose, and only really hold for binary session types. However, I'm not familiar with the more recent work they're referring to. Do you happen to know which papers "make use of multi-party compatibility to reconstruct the global dependencies from the local type" and which "use model checking directly"?

@elektra85: *maybe* these are the papers @reviewer2 is talking about [6], [7], [8], and [9]

TODO: @elektra85 weaken the claims regarding session types and deadlock freedom in the abstract and introduction

~~TODO: @elektra85 compare PCP/PGV to the approaches mentioned by @reviewer2 in the related work section.~~

> Furthermore, even in the direction of linear logic there are extensions of the genuine proof calculus BV [1] that can express session type systems that internalise the causal dependencies of Honda et al., which is a paper not compared to precisely either here or in the work on PCP which takes a more adhoc approach to internalising dependencies than BV. This overstating of claims, failure to situate the work, and particularly the poor illustration of the session interleaving problems in the session type literature (not just GV) must be addressed in a final version of the paper, which will be shepherded.

@wenkokke: @reviewer2 is correct that the correspondence between process calculus and BV is likely much nicer than the correspondence between process calculus and CLL. However, we should asses what the expressivity of BV is compared to that of PCP. We know that PCP is more expressive than linear logic, precisely due to the ad-hoc approach to internalising dependencies via priorities. My intuition is that, since BV corresponds *loosely* to linear logic, the expressivity of a calculus following such a correspondence would correspond to that of CP, not that of PCP.

~~TODO: @elektra85 see if you can assess the expressivity of [1] compared to PCP/PGV.~~

TODO: @wenkokke see if you can assess the expressivity of [2] compared to PCP/PGV.

~~TODO: @elektra85 see if you can identify the papers hinted at by @reviewer2; if not, we'll have to request that the PC ask @reviewer2 to provide references (which is probably safest anyway, to not misinterpret their words)~~


# Review 3

## Paper description

> The paper introduces PGV (Priority GV), an extension of Wadler's functional calculus GV.
> GV is a variation of a previously-developed lambda calculus that is equipped with message passing primitives and typed with session types. Its main appeal is that it can be encoded to Classical Processes (CP), a session-typed process calculus that is in a propositions-as-types correspondence with classical linear logic. CP was itself inspired by the seminal work by Caires and Pfenning on the propositions-as-types correspondence between propositions in intuitionistic linear logic and session types (by Honda et al.). CP reconstructs that correspondence for classical linear logic, which shows how to obtain the usual notion of duality found in session types (and the symmetric interpretation of interacting processes that comes with it).

> Inspired by the line of work originally established by Kobayashi on types for lock-freedom in the pi-calculus, PGV extends the types of GV with priorities: annotations that allow for determining the order in which actions are performed by processes. In particular, it builds on a previous adaptation of priorities (a simplification of Kobayashi's idea by Padovani) to CP: Priority CP, by Dardha (one of the authors of this submission) and Gay.

## Overall evaluation

### Strengths

> I enjoyed reading the paper, which I think makes a valuable contribution to the line of work on session types for functional calculi. That is, showing that the ideas developed by Kobayashi, Padovani, Dardha, and Gay have a natural way of being adopted in this setting.
> Indeed, this is a natural continuation of the line of work by Dardha and Gay on the usage of priorities in the setting of linear logic. I recommend its acceptance into FORTE's proceedings. I think that the venue is appropriate.

### Weaknesses

> 1. The technical development of the paper does not seem very challenging: most of the definitions seem to fall into place. While this might be because the authors were very careful in the design of the calculi, not much is discussed about this in the paper.

@wenkokke: Thank you for giving us the benefit of the doubt, we were careful to design the logic such that the proofs would fall into place easily.

> 2. Presentation is weird at times with respect to related work (especially regarding previous work based on Intuitionistic Linear Logic) or claims, and needs to be adjusted. I chose to keep "Accept" as score because I trust that the authors can address my comments in the camera ready version, should the paper be accepted.

@wenkokke: It would be extremely helpful if @reviewer3 had summarised those problems with presentation here, or at least provided some forward references, since it seems that, for them, acceptance depends on fixing these.

> 3. A lot of the technical development of the paper is in the appendix, meaning that there won't be space to publish it: not even the proof of the key result about progress, which is the whole reason for which priorities are interesting! This is a shame. I would've gladly given the same score for a paper without the encoding to PCP, but with a few more results, proofs, and examples about PGV given in the main paper. However, *I do not think that the authors should be blamed for this*, since making papers "packed with results" at the expense of presentation has become trendy in the community of concurrency and programming languages over the last 5/10 years. I would be happy if the authors made the full version accessible somewhere (e.g., arXiv).

@wenkokke: I agree with @reviewer3: it'd be good to see more of the proofs in the paper itself. @reviewer3 will be glad to know that the draft version of the paper is already on arXiv, including appendices.

TODO: @wenkokke once the rewrite is complete, move the progress proof into the main body of the paper if space permits

## Minor comments

> ~~Abstract: "Session type systems [...] cannot guarantee deadlock freedom"~~
> ~~This is contradicted right afterwards: CP and other systems are essentially session type systems.~~
> ~~I would specify that "session types" _alone_ do not guarantee deadlock freedom. They can certainly guarantee deadlock freedom when used in the appropriate typing system.~~

@wenkokke: Woops, yeah, that's a contradiction. I think that line used to be correct. It should say something along the lines of "but cannot rule out deadlocks that arise from bad interleaving of different sessions".

> p.1: GV is introduced by citing derivative works [43,30], but later the originals are introduced [18,19]. Wouldn't presenting in the opposite way make more sense?

@wenkokke: I feel it doesn't become *quintessentially* GV until it starts ruling out deadlocks via syntactic restrictions. That is certainly where the name comes from, even if there is the mysterious coincidence of GV and Gay and Vasconcelos.

> p.2/3: That PGV is encodable to PCP contributes to showing the expressivity of PCP, just like in Wadler's earlier work encoding GV to CP showed the expressivity of CP. But that's not what the authors discuss: rather, they claim that this encoding shows a "strong" link to linear logic. Since this is claimed right after the same qualifier is used for the link between GV and CP, I was expecting the same link "strength". However, looking at the typing rules of PCP in the appendix, I was left wondering how near to classical linear logic PCP actually is. To me, PCP looks like a "standard" session type system with priorities, obtained by replacing the usual session type symbols (e.g., ! and ?) with the symbols of the connectives and units of CLL and adopting the typing rule for bound output (tensor) instead of the one for free output. Is this sufficient to claim a strong link to linear logic? At the very least, the link seems weaker than the one presented with CP.

@wenkokke: We should clarify the link between CP and PCP if we want to keep these claims about the "strong" link to linear logic. @reviewer3 is right in that the relation between PCP and CLL is tenuous at best. We don't have CLL--->PCP, even if we suspect it holds, and we know that certainly PCP-/->CLL.

TODO: either we prove the injection from CP--->PCP or GV--->PGV, or we put some serious qualifiers on the claim that PGV has any ties to linear logic, and weaken the terminology to "logic-inspired"

TODO: add in PCP section that as for CP, in PCP we prove cycle elimination and obtain deadlock freedom as a result of that; this is the most formal connection to LL. It is not clear what priorities mean in logic and if they have a meaning at all and definitely CP --> PCP and PCP -/-> are not proved but we can conjecture them and say these are future work!

> It seems to me that the work by Balzers et al. on manifest sharing for Intuitionistic Linear Logic is nearer to a logical approach, due to their usage of stratification and modalities, but this might be a matter of taste.

@wenkokke: The original work on Manifest Sharing has deadlocks, but it does seem like @reviewer3 is pointing towards the 2019 paper which ensures deadlock freedom via modalities. We believe that there is a correspondence between modalities and priorities, which we should perhaps mention in the related work section. However, proving this fact is out of scope for this paper.

TODO: @elektra85 add discussion of priorities vs. modalities to the related work section

> If the authors can justify a link as strong as CP's, please clarify. Otherwise, consider weakening or contextualising better the claim.

@wenkokke: We cannot. See above.

> ~~ p.2: "[...] guarantee deadlock freedom by design"~~

> ~~ A clarification is needed here. What do you mean with "deadlock freedom by design"?~~

> ~~ Googling gives [10] where deadlock-freedom by design is described as "by using choreographies as initial design tool". But this paper has no choreographies. Did you mean something different? By design of what?~~

@wenkokke: This is a straightforward misunderstanding of us using "by design" to mean "baked into the language".

> ~~p.2: "Recent developments in the Classical Process (CP) [...] to decoupling these constructs"~~
> ~~This makes it sound like this decoupling was invented thanks to CP/CLL, but it had already been discovered for Intuitionistic Linear Logic, by extending the propositions-as-types correspondence by Caires and Pfenning with hypersequents:~~
> ~~Is there a fundamental difference?~~

@wenkokke: I believe [3] uses hypersequents, much like HCP, which means that it enforces a tree structure, which means it's more restrictive than PCP/PGV. There's absolutely a difference between the decouplings. However, we cite HCP. Therefore it will also cite [3] and [4].

> ~~p.2: Classical Process -> Classical Processes~~

> p.2: "We aim to further investigate GV [...]"

> This paragraph oversells functional languages.
> Being kinder to process calculi would only make the paper look better.
> For example, "there is a clear separation between a program that the user writes, and a configuration": to many, this would look like a disadvantage that points to lack of expressivity. Indeed, your system is arguably more complicated than a process calculus as a consequence (processes normally do not require this extra layer).

> Another example: "[...] within a functional language allows to derive extensions of the communication capabilities of the language via well-understood extensions of the functional fragment [...]"
> Sure, but that comes at the cost of having functions and sum types (something not necessary in pi calculus), and your semantics still needs to have dedicate rules for communications *in addition* to those for the functional layer. Dardha and Sangiorgi showed that if pi is equipped with variants, the same is achievable in that setting. The pi calculus looks like a clear winner in terms of simplicity.

> Case in point, examples 1 and 2 expose quite a bit of "functional boilerplate".

> Note that I actually *like* your encodings of selections (see below my comment for p.5), I was just surprised by the strength of the claim regarding the advantages of functional languages. The same arguments can be made more neutrally.
> In summary, I don't think that anybody would doubt that studying how to do concurrency in a functional setting is valuable, because of the higher-order and well-known features of lambda calculus, but the claims against process calculi (many of these features have been studied in pi) look a bit unfair to me.

@wenkokke: That's because I wrote this section, and I like functional languages.

TODO: @elektra85 rephrase the cited passages to be kinder towards process calculus

> RQ: "by design" appears again, leaving me confused. See previous comment on the same aspect. Your approach seems quite standard: achieve deadlock-freedom by a carefully designed typing system. Nothing in the calculus aids with deadlock-freedom if one removes the typing.

@wenkokke: Yes, that's what we meant by design! Perhaps we should make our intended meaning more explicit, though?

> ~~p.5: I like how select and offer are syntactic sugar!~~

@wenkokke: Thanks!

> ~~p.15: "they useful" -> "their useful"~~

> ~~There are three overlapping citations to Wadler's work (42-43-44), using different ones in different places, but it seems that just one of them would suffice? (The journal version?)~~

@wenkokke: We should standardise on only citing the journal version [43]. However, I do still think having both the original paper *and* the journal version in the bibliography is valuable. (We consistently do this, see [18, 19].) @reviewer3 seems to have misread [44], which is a different paper, though I feel that one's on Wadler for giving two of his papers almost identical names.

> p.15: There is new work on Kobayashi's approach [11].
> Could that be interesting in the future for this line of work as well?

@wenkokke: Oh, very cool! We should look into this!


[1]: http://dx.doi.org/10.1007/978-3-319-41579-6_8
[2]: https://arxiv.org/abs/cs/9910023
[3]: https://doi.org/10.1007/978-3-662-44584-6_5
[4]: https://arxiv.org/abs/1803.01049
[5]: https://www.sciencedirect.com/science/article/abs/pii/S030439751930578X
[6]: https://arxiv.org/abs/1304.1902
[7]: https://link.springer.com/article/10.1007/s00236-016-0285-y
[8]: https://www.sciencedirect.com/science/article/pii/S2352220817301487
[9]: https://dl.acm.org/doi/10.1145/3290343
[10]: https://dl.acm.org/doi/10.1145/2429069.2429101
[11]: https://doi.org/10.1016/j.ic.2016.03.004
