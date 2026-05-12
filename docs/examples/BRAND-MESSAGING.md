# Example: Brand Messaging Guide

> This example demonstrates the canonical template applied to a creative marketing project.
> **Showcases:** role-based persona, audience targeting, gated steps for creative work,
> review criteria for brand alignment.

## The Structured Prompt

```xml
<role>
Act as a Senior Product Manager and Brand Strategist with 10+ years experience launching
consumer goods to millennial and Gen Z audiences.
</role>

<context>
<background>
We are launching a new eco-friendly water bottle and need to establish our brand voice
before the website goes live. The product is made from 100% recycled ocean plastics and
filters water as you drink.
</background>
<audience>
Environmentally conscious millennials (ages 25-40) who are willing to pay a premium for
sustainable products. They value transparency, scientific rigor, and aesthetic design.
</audience>
<source_material>
Our market research indicates three key differentiators: (1) the bottle filters 99.9% of
microplastics, (2) each purchase removes 1kg of ocean plastic, (3) the design won a
Red Dot award. Competitors in the space include S'well, Hydro Flask, and LARQ.
</source_material>
</context>

<objective>
Create a comprehensive brand messaging guide that can be handed off to our web design team
for the landing page and product pages.
</objective>

<instructions>
Break this project down into the following steps. Do not move to the next step until
I review and approve the current one:

Step 1: Propose 3 distinct brand voice options (e.g., Professional, Quirky, Urgent)
with a short example of each applied to the product description.

Step 2: Once I choose a voice, write the core brand messaging including a tagline,
mission statement, and three key value propositions.

Step 3: Write the copy for the homepage hero section, product features section, and
FAQ based on the approved messaging.
</instructions>

<format>
Present the final guide in a Markdown table format, clearly separating the section name,
the copy, and the design notes for the web team.
</format>

<constraints>
- Tone: Confident but not arrogant; avoid corporate jargon
- Length: Keep the homepage copy under 300 words total
- Exclusions: Do not mention competitor brand names. Do not use exclamation points
- Limitations: Only use the source material provided above; do not invent product features
</constraints>

<review_criteria>
Before finalizing Step 3, review your output against the following checklist:
1. Does it align with the chosen brand voice from Step 1?
2. Is the copy under the 300-word limit?
3. Are all factual claims backed by the provided source material?
</review_criteria>

<first_action>
Acknowledge this brief and execute Step 1: Propose 3 distinct brand voice options.
</first_action>
```

## Why This Works

| Element | What It Achieves |
|---------|------------------|
| `<role>` | Sets Claude's expertise level -- no generic "AI assistant" responses |
| `<context>` | Prevents bad assumptions -- Claude knows who it's talking to and why |
| `<instructions>` with gating | Prevents 3 hours of wrong work in a single response |
| `<constraints>` | Uses negative space to narrowly focus output |
| `<review_criteria>` | Triggers self-correction before delivering final text |
| `<first_action>` | Claude starts immediately -- no "how should I begin?" delay |
