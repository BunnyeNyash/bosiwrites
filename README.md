# BosiWrites

A modern, responsive blog built with **Hugo** and designed for deployment on **GitHub Pages**. The site is lightweight, fast, SEO-friendly, and easy to customize without relying on a CMS or paid hosting.

Whether you're using this project as-is or adapting it for your own blog, this guide explains how to set everything up.

---

## Project Structure

```
hugo.toml                 # Site configuration
content/                  # Blog posts and pages
layouts/                  # Templates and page layouts
static/css/               # Stylesheets
static/js/                # JavaScript
static/images/            # Images
.github/workflows/        # GitHub Actions deployment workflow
```

Key folders:

* **content/posts/** – Blog posts written in Markdown.
* **content/about.md** – About page.
* **content/contact.md** – Contact page.
* **content/privacy-policy.md** – Privacy Policy page.
* **layouts/** – Templates for posts, pages, homepage, navigation, footer, and other site components.
* **static/css/style.css** – Main stylesheet with responsive design and dark mode.
* **static/js/main.js** – Navigation, dark mode, hero slider, and search functionality.

---

# Running the Site Locally

Install the **Hugo Extended** version.

Examples:

**macOS**

```bash
brew install hugo
```

**Windows**

```bash
choco install hugo-extended
```

**Linux**

```bash
sudo snap install hugo
```

Start the development server:

```bash
hugo server -D
```

Visit:

```
http://localhost:1313
```

The `-D` flag includes draft posts while developing.

---

# Deploying to GitHub Pages

1. Create a new GitHub repository.
2. Push this project to the repository.

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
git push -u origin main
```

3. In **Repository Settings → Pages**, select **GitHub Actions** as the deployment source.

The included GitHub Actions workflow will automatically build and deploy the site whenever changes are pushed to the `main` branch.

Before deploying, update the `baseURL` value inside `hugo.toml` to match your GitHub Pages URL.

---

# Adding New Posts

Create a new post:

```bash
hugo new posts/my-new-post.md
```

Example front matter:

```yaml
title: "Post Title"
date: 2026-08-07
categories: ["Technology"]
image: "/images/cover.jpg"
summary: "Short description of the article."
popular: true
draft: true
```

To publish a post, either remove the `draft` field or set it to:

```yaml
draft: false
```

---

# AdSense Configuration

If you plan to monetize the site with Google AdSense:

1. Apply for approval using your live website.
2. Add your publisher ID to `hugo.toml`:

```toml
adsenseClientId = "ca-pub-xxxxxxxxxxxxxxxx"
```

3. Replace the placeholder content in `static/ads.txt` with your own AdSense information.

---

# Search

Search is fully client-side.

During the build process, Hugo generates a search index containing post titles and URLs. JavaScript loads this index and filters results in real time, so no backend or database is required.

---

# Most Popular Posts

Posts marked with:

```yaml
popular: true
```

appear in the **Most Popular** section.

If no posts are marked as popular, the site automatically displays the most recent posts instead.

---

# Customization

Before publishing your own version of the site, remember to update:

* Site title and configuration in `hugo.toml`
* Social media links
* About page
* Contact page
* Privacy Policy
* Images and branding

---

# License

You're free to modify this project for your own personal or commercial website. If you redistribute modified versions, please keep this README updated to reflect your own changes.
