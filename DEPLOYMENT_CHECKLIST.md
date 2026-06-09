# Plantshop Investor Relations — Deployment Checklist

Use this checklist **every time** you are about to push changes that should reach the live site.

Work through the list in order. Do not skip steps.

## 1. Local Preview & Basic Checks
- [ ] Run `vercel dev` (or equivalent local server) and open the site.
- [ ] Hard refresh (Cmd/Ctrl + Shift + R) to clear any cache.
- [ ] Verify no console errors in DevTools.

## 2. Mobile / Responsive Check
- [ ] Test on at least one mobile viewport (use browser dev tools device toolbar or real phone).
- [ ] Check the hero (especially the packet card on the right — does it stack nicely?).
- [ ] Check all numbered sections and the final CTA area.
- [ ] Verify text is readable and buttons are tappable.

## 3. Forms & Modals
- [ ] Open "Request Details" modal and fill/submit the form (or at least verify it opens cleanly).
- [ ] Open "Connect with Us" modal and fill/submit.
- [ ] Test closing modals with Escape key and clicking the overlay.
- [ ] Confirm the form fields and success/error states (if any) look correct.

## 4. Buttons & CTAs
- [ ] All primary and ghost buttons are visible and have correct hover/focus states.
- [ ] Topbar "Request Details" and "Connect with Us" buttons work.
- [ ] Bottom CTA buttons work.
- [ ] Any links in the footer or nav point to the right place (or open the correct modal).

## 5. Analytics
- [ ] Google tag (gtag) is still present in the head.
- [ ] No obvious breakage in the dataLayer or gtag calls (check console if you have events).

## 6. SEO & Structured Data
- [ ] `<title>` is still the correct SEO title.
- [ ] Meta description is present and accurate.
- [ ] Main H1/H2s follow the desired structure (check SECTION_MAP.md).
- [ ] The JSON-LD schema script is present in the head (Organization + WebPage + ItemList).
- [ ] Run a quick schema validator (optional but recommended) on the deployed page.

## 7. Visual & Content Sanity (Quick Pass)
- [ ] All numbered headings (02–11 etc.) are present and in the correct order.
- [ ] Investor packet box is in the hero (right column) with original content.
- [ ] Bottom "What you get" area shows the small cta-box (not a duplicate packet box).
- [ ] No obvious layout breakage, overlapping elements, or missing images.
- [ ] Dark and light sections have correct text colors.

## 8. Commit
- [ ] Stage only the files you intentionally changed.
- [ ] Write a clear commit message that mentions which pass you were in (Copy / SEO / UX / Visual / Technical).
- Example: `SEO: Update meta description and H2 for Market section`

## 9. Push to GitHub
- [ ] `git push origin main` (or your feature branch).

## 10. Verify on Vercel (Dev / Staging)
- [ ] Go to the Vercel dashboard for the project.
- [ ] Confirm a new deployment started for your commit.
- [ ] Wait for it to finish (green check).
- [ ] Visit the new deployment URL.
- [ ] Hard refresh.
- [ ] Repeat the mobile, forms, buttons, and visual checks from above on the live Vercel URL.
- [ ] Confirm the Investor packet box is in the correct place (hero) and the bottom is clean.

## 11. (Optional but Recommended) Promote to Production on Vercel
- If the deployment looks good, promote/assign it to the Production environment in the Vercel dashboard.

## 12. Real Live FTP (Only After Full Sign-off)
**Never** run the FTP sync until you have completed steps 1–11 and are explicitly ready.

- [ ] You (or a required reviewer) have approved the Vercel production deployment.
- [ ] Run `./scripts/sync-to-ftp.sh` from the project root.
- [ ] Follow the double confirmation prompts in the script (type `yes`, then the exact phrase `DEPLOY TO LIVE FTP`).
- [ ] After the upload succeeds, hard refresh the live site (`invest.plantshop.me`) or wait for Cloudflare cache to clear.
- [ ] Do a final spot-check on the live FTP URL (hero box placement, headings, forms if possible).

## Quick "I Just Want to Push Text" Mini-Checklist
If you only changed copy (Pass 1):
- [ ] Local preview looks good
- [ ] Mobile preview looks good
- [ ] Commit with "Copy:" prefix
- [ ] Push
- [ ] Verify on latest Vercel deployment
- [ ] (Later) run sync script only if this text change also needs to go to real FTP

## Emergency / Rollback
- If something breaks on Vercel: redeploy the previous successful commit from the dashboard.
- If something bad reaches the real FTP: you will need to restore the previous `index.html` via the sync script or direct FTP upload (have the previous version saved locally or in git history).

---

**Remember**: The entire point of this checklist + the pass system is to prevent the kind of mixed changes that previously caused layout and duplication issues.

When in doubt, do one pass, push, review on Vercel, then decide on the FTP step.

