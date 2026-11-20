# VibePlayer landing page

A plain static website (HTML, CSS and a little JavaScript). No backend, no build step, no API keys, no payment
credentials. It is the public page for **VibePlayer** with the app description, Free/Premium plans and prices,
the direct-download button, the Google Play "Coming Soon" notice, and the Privacy Policy, Terms and Refund Policy.

## What is in this folder

| File | What it is |
|---|---|
| `index.html` | The landing page (hero, about, features, plans and pricing, get the app, contact) |
| `privacy.html`, `terms.html`, `refund.html` | The three legal pages |
| `style.css`, `main.js`, `favicon.svg` | Styling, a small script (mobile menu, download-button check), icon |
| `robots.txt`, `.nojekyll` | Search-engine rules, and tells GitHub Pages to serve the files as they are |
| `set-download-link.sh` | Puts your real download link into the Download buttons |
| `check-before-publish.sh` | Tells you if the site is ready to publish |

## Facts used on the page (change them if they ever change)

- Contact email: `zama27@duck.com`
- Premium prices (NGN): Monthly 1,500, Yearly 13,500, Lifetime 35,000
- Google Play: shown as **Coming Soon**
- Search for these values with: `grep -rn "1,500\|13,500\|35,000\|zama27" *.html`

## Step 1: Get a direct download link for the app

The Download buttons need a real link, and right now they have none, so they show "Download link coming soon".
The simplest free way is a **GitHub Release** in the same public repo as the website:

1. Build the APK you want people to install. Use a release APK signed with your own key for public downloads.
   Debug builds are for testing only.
2. After Step 3 below, open your website repo on github.com, tap **Releases**, then **Create a new release**.
3. Give it a tag such as `v1.0.0`, attach the APK file, and tap **Publish release**.
4. Open the release, long-press the APK file name and copy the link. It looks like
   `https://github.com/AbFasaha/vibeplayer-site/releases/download/v1.0.0/VibePlayer.apk`.

Do **not** upload the APK into the repository's files; use the Release.
Anything in a public repo or release can be downloaded by anyone, so never put keys, keystores or passwords there.

## Step 2: Put the link into the page (Termux)

```
cd ~/vibeplayer-site
sh set-download-link.sh "https://github.com/AbFasaha/vibeplayer-site/releases/download/v1.0.0/VibePlayer.apk"
sh check-before-publish.sh
```

`check-before-publish.sh` must say `READY to publish.`

## Step 3: Create the public repository and publish (GitHub Pages)

1. On github.com tap **+** then **New repository**. Name: `vibeplayer-site`. Choose **Public**.
   Do not tick "Add a README". Tap **Create repository**.
2. In Termux, copy this folder to your home folder and push it:

```
cp -r ~/storage/downloads/vibeplayer-landing ~/vibeplayer-site
cd ~/vibeplayer-site
git init -b main
git add -A
git commit -m "VibePlayer landing page"
git remote add origin https://github.com/AbFasaha/vibeplayer-site.git
git push -u origin main
```

   (Use the same sign-in you already use for pushing VibePlayer.)
3. On github.com open the repo, then **Settings** then **Pages**. Under **Build and deployment** choose
   **Deploy from a branch**, branch **main**, folder **/ (root)**, then **Save**.
4. Wait about a minute and refresh the Pages settings. The site address appears at the top:
   `https://abfasaha.github.io/vibeplayer-site/`
5. Open that address on your phone and test the buttons.

## Step 4: Give Paystack the link

Reply to Paystack's email with the website address from Step 3. Update your Paystack dashboard business website
(`dashboard.paystack.com/#/compliance/contact?edit=true`) to the same address.

## Updating later

Edit a file, then:

```
cd ~/vibeplayer-site
git add -A && git commit -m "Update page" && git push
```

GitHub Pages updates itself within a minute or two.

## Things to keep true

- The page says Premium purchasing for direct-download users is "being opened". When your website checkout is live,
  change the "How Premium is bought and paid for" box in `index.html` and the matching lines in `terms.html`.
- When the app is on Google Play, replace the "Coming Soon on Google Play" box with the real Play link.
- If you host somewhere other than GitHub Pages, update the hosting line in `privacy.html` section 1.
