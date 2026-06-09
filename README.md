# Plantshop Investor Relations

This is the source for the Plantshop.me Investor Relations site (invest.plantshop.me).

## Recommended Safe Workflow (Double Confirmation)

We want **all changes to go through Vercel first**, and **only reach the real live FTP after you have explicitly approved it twice**.

### Daily Development Flow

1. Make changes in this repo (on a branch).
2. Push to GitHub.
3. Vercel automatically creates a **preview deployment**.
4. Thoroughly review the preview (design, content, responsiveness, etc.).
5. When you're happy:
   - Merge to `main` (this updates the main Vercel deployment).
6. **Only then** decide whether to push to the real FTP.

### Pushing to Live FTP (with Double Confirmation)

You have **two safe options**:

#### Option A: Local Script (Recommended for now)

Run this from the project root:

```bash
./scripts/sync-to-ftp.sh
```

This script has strong protections:
- Checks you're on the `main` branch with a clean working tree
- Shows you the exact commit that will go live
- Requires you to type `yes`
- Requires a second confirmation by typing the exact phrase `DEPLOY TO LIVE FTP`

Nothing touches the live FTP unless you do both confirmations.

#### Option B: GitHub Actions + Manual Approval (Strongest protection)

1. Go to the **Actions** tab in GitHub.
2. Select **"Deploy to Live FTP"**.
3. Click **"Run workflow"**.
4. Type the confirmation phrase and run it.

**This will be blocked** until you (or a required reviewer) explicitly approve the deployment in the GitHub UI under the `production` environment.

This is the closest thing to "double confirmation" you can get, because even triggering the workflow isn't enough — a human must click "Approve" in GitHub.

---

## Setup Required (One-time)

### 1. GitHub Environment Protection (for Option B)

Go to your repo → **Settings → Environments → New environment**

- Name it: `production`
- Add yourself as a **Required reviewer**
- (Optional) Add a wait timer if you want

### 2. Store FTP Credentials as GitHub Secrets (for Option B)

Go to **Settings → Secrets and variables → Actions**

Add two secrets:
- `FTP_USER` → `invest_user`
- `FTP_PASS` → (the password)

These are never exposed in logs.

---

## Notes & Best Practices

- **Never** push directly to FTP without going through Vercel first.
- The local sync script and the GitHub Action both contain multiple confirmation steps.
- Credentials are **never** committed to the repo.
- After an FTP push, you will usually need to do a hard refresh (`Cmd/Ctrl + Shift + R`) or wait for Cloudflare to clear its cache on the live site.

## Local Vercel Development

```bash
vercel dev
```

This gives you a local preview without touching GitHub or FTP.
