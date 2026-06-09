# Plantshop Investor Relations

This is the source for the Plantshop.me Investor Relations site (invest.plantshop.me).

## Workflow

1. **Make changes here** (in this repo, preferably on a feature branch).
2. **Push to GitHub** → Vercel automatically deploys a preview URL.
3. Review the preview.
4. When approved:
   - Merge to `main` (Vercel updates production preview).
   - Run the sync script to push to the live FTP server.

## Deploy to Vercel

- Connect this GitHub repo to Vercel (recommended).
- Or run `vercel` locally.

## Sync to Live FTP (when ready)

```bash
./scripts/sync-to-ftp.sh
```

(You will need the FTP credentials — they are **not** stored in the repo.)

## Notes

- The site is a single self-contained `index.html`.
- All development should happen in this repo first.
- Only push to FTP after changes have been reviewed on Vercel.
