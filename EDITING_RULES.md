# Plantshop Investor Relations — Editing Rules

**Golden Rule**: Never mix the five passes (Copy, SEO, UX, Visual, Technical) in one edit. Work in one pass at a time.

## Safe Edits (Allowed in the Right Pass)

- Changing text inside existing elements (Pass 1)
- Updating the SEO title, meta, H1/H2 text, or schema (Pass 2)
- Improving button text, CTA clarity, or information order (Pass 3)
- Adjusting spacing, alignment, or colors using existing variables/patterns (Pass 4)
- Updating forms, analytics tags, or deployment scripts (Pass 5)

## Forbidden Edits (Never Do These)

- Mixing passes in a single commit or pull request.
- Changing the base `<style>` (fonts, CSS variables, .hero-card rules, etc.) without a dedicated Visual or Technical pass.
- Altering the `.hero-grid` structure or moving the `.hero-card` (Investor packet box) outside the hero.
- Introducing new font families, colors, or spacing scales that don't already exist in DESIGN_SYSTEM.md.
- Changing the custom large heading pattern (the serif div + `.num` span) without a Visual pass.
- Removing or duplicating the Investor packet box without explicit approval.
- Touching the embedded base64 fonts or logo hydration logic unless doing a Technical pass.
- Editing the bottom "What you get" cta-box structure without a Visual/UX pass.

## How to Change Text (Pass 1 — Copy Only)

1. Identify the exact string.
2. Replace only the visible text.
3. Do not touch classes, styles, or surrounding HTML.
4. Commit with a message that starts with "Copy: ".

Example:
```bash
git commit -m "Copy: Update hero lead paragraph for clarity"
```

## How to Add a New Section (Visual + SEO Passes)

1. **Copy pass first** (if new text is needed).
2. **SEO pass**: Decide the H2 text.
3. Add a new large heading using the exact pattern from DESIGN_SYSTEM.md:
   ```html
   <div style="font-family: var(--serif); font-size: clamp(32px, 3.4vw, 46px); line-height: 1.08; letter-spacing: -0.01em; color: var(--ink-900); margin-bottom: 24px;">
     <span class="num" style="font-family: var(--mono); margin-right: 8px; color: var(--ink-400);">11</span> New Section Title
   </div>
   ```
4. Add the content block immediately after.
5. Decide if the section is light or dark and apply the correct color.
6. Update SECTION_MAP.md.
7. Commit with "SEO: " or "Visual: " prefix.

**Never** add a new section using the old `.sec-head` grid pattern.

## How to Update Links / Buttons / CTAs (UX Pass)

- Only change the visible text or the `data-open-modal` value.
- Do not change button classes or add new button styles unless doing a Visual pass.
- Update any corresponding text in modals if needed (still UX pass).
- Document the change in SECTION_MAP.md if it affects a major section.

## General Process for Any Edit

1. Decide which single pass this belongs to.
2. Make the minimal change that belongs only to that pass.
3. Update the relevant .md file (SECTION_MAP.md for content/structure changes, etc.).
4. Test only what is relevant to that pass (see DEPLOYMENT_CHECKLIST.md).
5. Commit with a message that starts with the pass name: `Copy:`, `SEO:`, `UX:`, `Visual:`, or `Technical:`.

## Quick Reference — What Belongs Where

| Change Type                    | Pass       | Commit Prefix |
|--------------------------------|------------|---------------|
| Fix typo or rewrite paragraph  | Copy       | Copy:         |
| Update title/meta/H2/schema    | SEO        | SEO:          |
| Clarify a button or reorder info | UX       | UX:           |
| Adjust spacing or heading size | Visual     | Visual:       |
| Fix form submission or analytics | Technical | Technical:    |
| Move the packet box            | Visual + UX| (split into two commits) |

If a change genuinely requires two passes, do them as separate commits/PRs.

