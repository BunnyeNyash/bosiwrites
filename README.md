# BosiWrites — Hugo site

Your Blogger design, rebuilt as a free, self-hosted static site. No hosting
bill, ever — GitHub Pages serves it for free, and AdSense works with zero
platform restrictions since you own the actual HTML.

## What's in here

- `hugo.toml` — site config (title, social links, AdSense ID, menu)
- `content/posts/` — your blog posts (Markdown)
- `content/about.md`, `content/contact.md`, `content/privacy-policy.md` — static pages
- `layouts/` — the actual page templates (header, footer, post grid, hero slider, etc.)
- `static/css/style.css` — all site styling, including dark mode
- `static/js/main.js` — nav toggle, dark mode, hero slider, search
- `.github/workflows/hugo.yml` — auto-builds and deploys the site on every push

## 1. Install Hugo locally (to preview before publishing)

This environment couldn't reach the internet to install Hugo for you, so
you'll need to do this step yourself, once:

- **Mac**: `brew install hugo`
- **Windows**: `choco install hugo-extended` (or download from hugo.io)
- **Linux**: `sudo snap install hugo` (or download the `.deb`/`.tar.gz` from
  [Hugo's releases page](https://github.com/gohugoio/hugo/releases) —
  grab the **extended** version)

Then, from this folder:

```
hugo server -D
```

Open `http://localhost:1313` — that's your live-reloading local preview.
`-D` includes draft posts (the archetype marks new posts as drafts by default).

## 2. Put this on GitHub

1. Create a new **public** repo on GitHub, e.g. `bosiwrites`.
2. In this folder:
   ```
   git init
   git add .
   git commit -m "Initial site"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/bosiwrites.git
   git push -u origin main
   ```
3. In the repo's **Settings → Pages**, set "Source" to **GitHub Actions**.
   That's it — the workflow in `.github/workflows/hugo.yml` will build and
   deploy the site automatically on every push to `main`.
4. Your site will be live at `https://YOUR-USERNAME.github.io/bosiwrites/`.

**Important:** update `baseURL` in `hugo.toml` to match your actual GitHub
Pages URL before your first deploy, or internal links will be wrong.

## 3. Set up AdSense

1. Apply for AdSense at [adsense.google.com](https://adsense.google.com)
   with your live site URL. You'll want a handful of real posts and a
   filled-out Privacy Policy page (already scaffolded at
   `content/privacy-policy.md` — replace the bracketed placeholders) before
   applying.
2. Once approved, Google gives you a publisher ID like `ca-pub-1234567890123456`.
   Paste it into `hugo.toml`:
   ```toml
   adsenseClientId = "ca-pub-1234567890123456"
   ```
3. Google also gives you a line for `ads.txt` — paste it into
   `static/ads.txt`, replacing the placeholder comment.
4. Ad slots are already placed above and below each post's body
   (`layouts/_default/single.html`) — they'll only render once
   `adsenseClientId` is filled in.

## 4. Writing posts

```
hugo new posts/my-new-post.md
```

This uses the archetype in `archetypes/posts.md` to pre-fill the front
matter. Key fields:

```yaml
title: "Post Title"
date: 2026-08-07
categories: ["Technology"]   # powers Browse Categories + the category nav
image: "/images/cover.jpg"   # optional — put the file in static/images/
summary: "Short excerpt used in cards and the hero slider."
popular: true                # optional — flags it for the Most Popular row
draft: true                  # remove this line (or set to false) to publish
```

## 5. About "Most Popular"

Blogger's Popular Posts widget tracked real pageviews server-side — a static
site has no server, so there's no automatic way to know what's actually
popular. Right now, `layouts/partials/most-popular.html` shows whichever
posts you manually flag with `popular: true`, and falls back to your most
recent posts if nothing's flagged. If you later want *real* traffic-based
popularity, that requires pulling data from Google Analytics' API at build
time — a bigger project, and not something this scaffold sets up.

## 6. Search

Search is entirely client-side: Hugo generates a `search-index.json` file of
every post's title + URL at build time, and `static/js/main.js` fetches and
filters it as you type. No backend, no cost, works within GitHub Pages'
static hosting.

## Social links & other placeholders to fill in

- `hugo.toml` → `[params.social]` — replace the `#` placeholders with your
  real LinkedIn, GitHub, Facebook, Instagram, and YouTube URLs.
- `content/contact.md` — replace with your real contact info / form.
- `content/about.md` — replace with your real bio.
- `content/privacy-policy.md` — fill in the bracketed sections.
