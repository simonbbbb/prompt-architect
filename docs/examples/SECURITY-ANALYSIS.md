# Example: AI Security Threat Analysis & Go-to-Market Strategy

> This example demonstrates the canonical template applied to a complex strategic research
> project with multiple phases.
> **Showcases:** academic rigor, the "audience paradox" pattern, phased research with
> approval gates, monetization architecture thinking.

## The Structured Prompt

```xml
<role>
Act as a Lead AI Security Researcher and Strategic Business Analyst. You possess a
Ph.D.-level understanding of cybersecurity frameworks (MITRE ATLAS, NIST AI RMF) and
deep expertise in AI threat modeling and technology commercialization.
</role>

<context>
<background>
The AI landscape is expanding rapidly, exposing novel vulnerability surfaces. Crucially,
the timeline of cyber attacks has compressed drastically -- what used to take 30 minutes
or more now takes seconds to minutes due to AI automation. We want to build a defensive
tool to protect end-users from this accelerated AI attack exposure.
</background>
<audience_paradox>
We are facing a classic go-to-market dilemma: Selling to consumers has lower friction,
but consumers historically do not spend out-of-pocket on cybersecurity. Selling to
enterprise yields higher ACV but involves massive sales friction, long cycles, and high
security auditing requirements. We need to find the optimal "audience mode."
</audience_paradox>
<source_material>
Rely on your established knowledge base of academic literature regarding AI vulnerabilities
(prompt injection, model extraction, automated social engineering, LLM-integrated malware)
as well as historical cybersecurity business models.
</source_material>
</context>

<objective>
Conduct a highest-level academic and strategic research analysis to determine:
1) The exact, most pressing problem we can solve, 2) The ideal audience mode,
3) The desired defensive impact, 4) Viable pathways to monetization.
</objective>

<instructions>
Break this research project down into the following distinct phases. Do not move to the
next phase until I have reviewed, critiqued, and approved the current one:

Phase 1: Threat Landscape & Problem Definition
Conduct an academic-style literature review of the current AI threat landscape. Focus
specifically on the "compression of attack time" (seconds-to-minutes). Identify and rank
the top 3 specific AI-driven threat vectors where traditional defense mechanisms fail due
to this speed. Conclude this phase by proposing 2-3 specific defensive tool concepts.

Phase 2: Audience Segmentation & Paradox Resolution
Take the defensive tool concepts from Phase 1 and analyze them against the consumer/enterprise
spending paradox. Evaluate at least three alternative audience modes (e.g., "Prosumer,"
B2B2C via ISP/antivirus bundling, SMBs, API-developers). Use academic frameworks for
technology adoption to justify which mode offers the highest monetization probability.

Phase 3: Impact Modeling & Monetization Architecture
Based on the chosen audience mode from Phase 2, define the exact desired defensive impact
(e.g., "reduce time-to-mitigation from X to Y"). Propose 3 distinct monetization
architectures (Freemium, Embedded licensing, Subscription) tailored to this audience,
including pros/cons and estimated friction levels.
</instructions>

<format>
Format your responses as structured academic briefing documents. Use rigorous, precise
language. Include citations to known cybersecurity frameworks or academic concepts. Use
Markdown headers, bullet points, and comparison tables for dense strategic information.
</format>

<constraints>
- Rigor: Maintain a high academic standard. Avoid generic marketing fluff.
- Focus: Keep focus strictly on AI-generated threats and AI-automated attack speed.
- Objectivity: If a concept is economically unviable, state it plainly.
</constraints>

<review_criteria>
Before outputting each phase, internally verify:
1. Did I specifically address the "speed of attack" compression?
2. Did I provide concrete examples rather than abstract concepts?
3. Did I actively try to solve the consumer spending paradox rather than just acknowledging it?
</review_criteria>

<first_action>
Acknowledge this brief and execute Phase 1: Threat Landscape & Problem Definition.
</first_action>
```

## Advanced Patterns Demystified

| Pattern | What It Does |
|---------|--------------|
| `<audience_paradox>` | A named tension -- forces Claude to work the problem, not gloss over it |
| Phased research | Each phase is independently reviewable; a bad Phase 1 doesn't waste Phases 2-3 |
| Academic rigor constraint | Prevents shallow "just do X" answers |
| Objectivity constraint | Forces Claude to argue against the premise if the data says so |
| Concrete examples requirement | Prevents abstract theory without grounding |
