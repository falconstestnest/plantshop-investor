# Plantshop Investor Relations — Design System

This document defines the visual language for the site. All edits must respect these rules.

## Fonts

- **Headings (large serif)**: `var(--serif)` → "Source Serif 4", "Source Serif Pro", Georgia, serif
  - Used for main section titles and the hero H1.
  - Size: `clamp(32px, 3.4vw, 46px)` (or the hero H1 variant).
  - Letter-spacing: `-0.01em`
  - Weight: 400 (normal)

- **Body / UI text**: `var(--sans)` → "Inter", system sans-serif stack

- **Mono / Labels / Numbers / Tags**: `var(--mono)` → "JetBrains Mono", ui-monospace, Menlo, monospace
  - Used for:
    - `.num` (section numbers)
    - `.eyebrow`
    - `.tag` (PDF sizes, etc.)
    - Stamps, small labels, code-like elements
  - Typically small (10–12px), uppercase, with letter-spacing 0.1–0.22em

**Rule**: Never change the font stack or introduce new font families without updating this file and the embedded `<style>`.

## Colors

### Core Palette (from CSS variables)
- `--paper`: #FBF9F5 (light background)
- `--paper-2`: #F4F1EA
- `--ink-900`: #181425 (primary dark text)
- `--ink-800`: #2A2140
- `--ink-700`: #433861
- `--ink-500`: #6B6184 (secondary / muted text)
- `--ink-400`: #8E86A3 (used for `.num` in light sections)
- `--ink-300`: #B8B1C7
- `--line`: rgba(36,22,64,0.12)
- `--line-2`: rgba(36,22,64,0.06)

### Accent Colors
- `--purple-700`: #5D2E8C (hero `<em>`, some accents)
- `--purple-600` / `--purple-800` etc. for variants
- `--green-500`: #7FBA42 (highlights, some dark-section eye brows)
- `--green-700`: #3E7F2E

### Section Color Rules
- **Light sections**: Text uses `--ink-900` (or 800/700). `.num` usually `--ink-400`.
- **Dark sections** (e.g. macro, financials, final CTA): 
  - Main text/headings: `#fff`
  - `.num` and muted elements: `rgba(255,255,255,0.4)`
  - Eyebrows can use `--green-500` for contrast.

**Rule**: When creating or editing a section, copy the exact color from an existing similar section (light or dark).

## Spacing & Rhythm

- Main section headings: `margin-bottom: 24px`
- Hero padding: generous (top ~110px, bottom ~120px in original)
- Cards (`.hero-card`): `padding: 36px`, `min-height: 420px`
- Lists and tables: consistent 14px padding on items, subtle borders using `--line` / `--line-2`
- `.wrap`: centered container (used throughout)
- Gaps in grids: 32px, 48px, 80px (hero), etc.

**Rule**: Match spacing from nearby similar elements. Do not introduce new arbitrary margins/paddings.

## Cards & Special Elements

### .hero-card (Investor Packet box)
- White background card in the hero right column.
- Absolute positioned `.stamp` (top-right, mono, uppercase, `--ink-400`)
- Subtle `.leaf-bg` image (rotated, low opacity)
- `.doc-label`: mono, small, uppercase, purple accent
- `h4`: serif, 26px, tight line-height
- `.doc-list`: bordered list with `.tag` spans (mono, small, uppercase)
- `.lock`: small text + inline SVG icon

**This element must keep its exact class structure and visual treatment.** It is the primary "packet" visual motif.

### .cta-box
- Small, clean "What you get" / access packet summary at the bottom.
- Uses `.eyebrow` + `h4` + `ul` with `.tag`
- Much lighter visual weight than `.hero-card`

## Headings

### Main Numbered Sections (02–10+)
Use this exact pattern for consistency:

```html
<div style="font-family: var(--serif); font-size: clamp(32px, 3.4vw, 46px); line-height: 1.08; letter-spacing: -0.01em; color: [appropriate]; margin-bottom: 24px;">
  <span class="num" style="font-family: var(--mono); margin-right: 8px; color: [appropriate muted];">XX</span> Full Title Here
</div>
```

- Number always in `.num` mono span.
- Title text uses the serif size of the container.
- Color on the outer div controls the title; color on `.num` controls the number.

### Hero H1
Special treatment (bigger, with purple `<em>`):
```html
<h1 style="margin-top:22px;">
  Invest in a <em>Category-Defining E-commerce Business</em> in Dubai
</h1>
```

### Small Labels (.eyebrow)
- Mono, small (~10-11px), uppercase, letter-spacing 0.18–0.22em
- Color varies by context (purple/green accents or muted ink)

## Dark / Light Section Rules

- Light sections default to ink colors on paper background.
- Dark sections (identified by class or explicit white text) flip to white text + muted white numbers/eye brows.
- When adding a new section, decide light or dark based on neighboring sections and apply the correct color set.

## Other Rules

- All custom large headings must follow the serif + num pattern above.
- Do not mix the old `.sec-head` grid pattern with the new full-width headings.
- Keep the hero exactly as a two-column `.hero-grid`.
- The Investor packet box lives **only** inside the hero as `.hero-card`.
- Bottom "What you get" uses the lighter `.cta-box` pattern.
- Never introduce new font sizes, colors, or spacing that don't already exist in the design system.

