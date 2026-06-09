# Plantshop Investor Relations — Section Map

This document maps every major section on the page, its current ID (if any), its heading, and its purpose.

Use this map before editing any section so you know what belongs where.

## Section 01 — Hero (Special)

**Location**: Top of page, `<section class="hero" id="top">`

**Heading treatment**: Special (not the standard numbered serif block)
- Eyebrow: `01 INVESTOR RELATIONS` (mono)
- H1: "Invest in a Category-Defining E-commerce Business in Dubai" (serif + purple `<em>`)

**Key elements**:
- Left column: headline, lead paragraph, CTAs ("Request Details", "Connect with Us"), KPI meta row.
- Right column: `.hero-card` — the Investor packet box (Confidential stamp, leaf image, "Investor packet", description, document list, lock).

**Purpose**: First impression + primary CTAs + packet teaser.

**Design rules**: Two-column `.hero-grid`. The `.hero-card` must stay inside this grid as the right child. Do not move it.

## Section 02 — About Plantshop.me

**Current heading**: `02 About Plantshop.me`

**ID**: `#overview`

**Content**: Company background, three capsule points (operating history, supplier access, fulfillment expertise).

**Purpose**: Establish credibility and history.

## Section 03 — Market Opportunity in UAE & GCC

**Current heading**: `03 Market Opportunity in UAE & GCC`

**ID**: `#opportunity`

**Content**: Macro description + key metrics (supplier network, operations, last-mile, demand engine) + market table + demand drivers.

**Design note**: This is a dark section (white text).

**Purpose**: Show the attractive market context.

## Section 04 — Why Invest in a UAE-Based E-commerce Business

**Current heading**: `04 Why Invest in a UAE-Based E-commerce Business`

**ID**: `#why`

**Content**: Five "Core strength" cards + "Barrier to entry" card.

**Purpose**: Articulate the moat and why this category is hard to copy.

## Section 05 — Business Model & Competitive Advantage

**Current heading**: `05 Business Model & Competitive Advantage`

**ID**: `#thesis`

**Content**: Venn diagram (E-commerce + Lifestyle + Fragmented supply = Plantshop.me) + three theses.

**Purpose**: Explain the strategic positioning and three vectors of value.

## Section 06 — Market Opportunity Snapshot

**Current heading**: `06 Market Opportunity Snapshot`

**ID**: `#market`

**Content**: Market size table (E-commerce, Landscaping, Global Gardening) + key demand drivers.

**Purpose**: Quantitative market data.

## Section 07 — Growth Strategy & Expansion Plan

**Current heading**: `07 Growth Strategy & Expansion Plan`

**ID**: `#model`

**Content**: Two columns — Business Model details + three Expansion Levers (Geographic, Technology, Customer).

**Purpose**: Show the repeatable model and the levers for 2–4× growth.

## Section 08 — Traction & Operating History

**Current heading**: `08 Traction & Operating History`

**ID**: `#financials`

**Content**: Financial outlook table (Revenue Growth, EBITDA, Operating Leverage) + note about data room.

**Design note**: Dark section (white text).

**Purpose**: Show traction and forward-looking economics.

## Section 09 — Investment Opportunities

**Current heading**: `09 Investment Opportunities`

**ID**: `#opps`

**Content**: Four "Type" cards (Strategic partnerships, Growth capital, Joint ventures, Acquisition) + evaluation criteria chips.

**Purpose**: Clearly list the four ways to engage.

## Section 10 — Traction Snapshot (sub-sections)

**Current heading**: `10 Traction Snapshot`

**ID**: `#traction`

**Content**: Three columns:
- Operating History
- Investor Profile
- Risk Considerations

**Purpose**: Summarize history, ideal investor, and honest risks.

## Final CTA Area (Engage / Next Steps)

**Current heading**: `11 Next Steps` (or similar clean label)

**Content**:
- "Connect with Us" headline + description
- Action buttons (Request Details, Connect with Us)
- Small `.cta-box` "What you get" (Access packet list)

**Purpose**: Final call-to-action and summary of what qualified investors receive.

**Design note**: Usually treated as a dark section.

---

## Special / Reusable Elements

- **Investor Packet Box** (`.hero-card`): Lives **only** inside the hero as the right column. Contains stamp, image, label, description, document list, and lock. Do not duplicate or move it.

- **Small "What you get" box** (`.cta-box`): Lives in the final CTA area. Lighter treatment than the hero card.

- **Numbered headings**: All main sections after the hero use the custom large serif pattern with mono number prefix (see DESIGN_SYSTEM.md).

- **Dark vs Light sections**: Follow the color rules strictly (see DESIGN_SYSTEM.md).

---

## Navigation

The topbar nav links to:
- #overview (02)
- #opportunity (03)
- #thesis (05)
- #model (07)
- #financials (08)
- #engage (final CTA)

Update this list in the `<nav>` if you add/remove major sections.

## When Adding or Renumbering Sections

1. Update this SECTION_MAP.md.
2. Update the topbar `<nav>` links if necessary.
3. Use the next sequential number (e.g. 11, 12...).
4. Decide light or dark treatment.
5. Follow the exact heading pattern from DESIGN_SYSTEM.md.

