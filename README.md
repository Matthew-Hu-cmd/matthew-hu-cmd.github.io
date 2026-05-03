
<h1 align="center">
AcadHomepage
</h1>

<div align="center">

[![](https://img.shields.io/github/stars/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/forks/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/issues/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/license/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io/blob/main/LICENSE)  | [中文文档](./docs/README-zh.md) 
</div>

<p align="center">A Modern and Responsive Academic Personal Homepage</p>

<p align="center">
    <br>
    <img src="docs/screenshot.png" width="100%"/>
    <br>
</p>

Some examples:
- [Demo Page](https://rayeren.github.io/acad-homepage.github.io/)
- [Personal Homepage of the author](https://rayeren.github.io/)

## Key Features
- **Automatically update google scholar citations**: using the google scholar crawler and github action, this REPO can update the author citations and publication citations automatically.
- **Support Google analytics**: you can trace the traffics of your homepage by easy configuration.
- **Responsive**: this homepage automatically adjust for different screen sizes and viewports.
- **Beautiful and Simple Design**: this homepage is beautiful and simple, which is very suitable for academic personal homepage.
- **SEO**: search Engine Optimization (SEO) helps search engines find the information you publish on your homepage easily, then rank it against similar websites.

## Quick Start

1. Fork this repo and rename it to `USERNAME.github.io`, where `USERNAME` is your GitHub username.
1. Update [`_config.yml`](./_config.yml):
   1. `title`: site title
   1. `description`: site description
   1. `repository`: `USERNAME/USERNAME.github.io`
   1. `author`: avatar, email, GitHub, location, and profile text
   1. `google_analytics_id` and SEO verification keys if needed
1. Update the homepage content in [`_pages/about.md`](./_pages/about.md) and the included section files under [`_pages/includes`](./_pages/includes).
1. Update navigation in [`_data/navigation.yml`](./_data/navigation.yml).
1. Add blog posts under [`_posts`](./_posts) using filenames such as `2026-05-03-my-first-post.md`.

### Blog Writing

This repo already supports an independent blog index page at `/blog/` and standalone post pages.

1. Create a new Markdown file in [`_posts`](./_posts).
1. Use the filename format:
   ```text
   YYYY-MM-DD-your-title.md
   ```
1. Add front matter like:
   ```yaml
   ---
   layout: post
   title: "Your Post Title"
   excerpt: "A short summary shown on the blog index."
   ---
   ```
1. Write the article body in Markdown below the front matter.

## Debug Locally

1. Clone the repo locally with `git clone`.
1. Install a user-managed Ruby environment such as `rbenv`. Avoid the macOS system Ruby.
1. Use Ruby `3.1.x` for this project. The current lockfile depends on `github-pages 215`, whose pinned `nokogiri` build does not work with Ruby `3.2+`.
1. Install and activate the project Ruby version:
   ```bash
   rbenv install 3.1.7
   rbenv local 3.1.7
   ruby -v
   ```
1. Install the Bundler version required by this project:
   ```bash
   gem install bundler:2.2.19
   ```
1. Install gems into the project directory instead of the system Ruby path:
   ```bash
   bundle config set --local path 'vendor/bundle'
   ```
1. On Apple Silicon Macs, make sure `ffi` uses a compatible system `libffi`:
   ```bash
   export PATH="/opt/homebrew/bin:$PATH"
   bundle config set --local build.ffi "--enable-system-libffi"
   export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
   export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
   export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
   ```
1. Install project dependencies:
   ```bash
   bundle _2.2.19_ install
   ```
1. Start the local development server:
   ```bash
   ./run_server.sh
   ```
1. Open http://127.0.0.1:4000 in your browser.
1. Edit pages, posts, styles, or includes. Jekyll LiveReload should refresh automatically.

### Local File Guide

- Homepage entry: [`_pages/about.md`](./_pages/about.md)
- Homepage sections: [`_pages/includes`](./_pages/includes)
- Blog index: [`_pages/blog.md`](./_pages/blog.md)
- Blog post layout: [`_layouts/post.html`](./_layouts/post.html)
- Blog posts: [`_posts`](./_posts)
- Navigation: [`_data/navigation.yml`](./_data/navigation.yml)
- Main styles: [`assets/css/main.scss`](./assets/css/main.scss)

## GitHub Deployment

This repo already includes a GitHub Pages deployment workflow in [`.github/workflows/jekyll.yml`](./.github/workflows/jekyll.yml).

1. Push your site to the `main` branch.
1. In GitHub, open `Settings -> Pages`.
1. Set `Source` to `GitHub Actions`.
1. In GitHub, open the `Actions` tab and make sure workflows are enabled.
1. The workflow `Deploy Jekyll site to Pages` will build and deploy automatically on every push to `main`.
1. You can also trigger it manually from `Actions -> Deploy Jekyll site to Pages -> Run workflow`.

### GitHub Actions For Google Scholar

The repo also includes an optional workflow at [`.github/workflows/google_scholar_crawler.yaml`](./.github/workflows/google_scholar_crawler.yaml).

1. Find your Google Scholar user ID from a URL like:
   ```text
   https://scholar.google.com/citations?user=SCHOLAR_ID
   ```
1. In GitHub, open `Settings -> Secrets and variables -> Actions`.
1. Add a repository secret named `GOOGLE_SCHOLAR_ID`.
1. Edit [`.github/workflows/google_scholar_crawler.yaml`](./.github/workflows/google_scholar_crawler.yaml) and uncomment the `env` section if you want to pass the secret into the crawler.
1. Enable the workflow from the `Actions` tab.
1. It will push citation JSON data to the `google-scholar-stats` branch.

If you do not need Google Scholar auto-updates, you can leave this workflow disabled.

### Notes for macOS

- The system Ruby on macOS is often old. If `gem install bundler:2.2.19` fails, or if native gems such as `commonmarker`, `ffi`, `eventmachine`, or `http_parser.rb` fail to build, switch to a user-managed Ruby first with `rbenv` or `mise`, then rerun the commands above.
- If Bundler reports that `nokogiri-1.13.3-*` is incompatible with your Ruby version, you are likely using Ruby `3.2+` by mistake. Switch back to the project Ruby version in `.ruby-version`.
- Avoid using `sudo bundle install`. Installing into `vendor/bundle` keeps the project self-contained and prevents permissions issues.
- `run_server.sh` now checks for the required Bundler version and missing gems, so it should tell you exactly what is missing before Jekyll starts.

# Acknowledges

- AcadHomepage incorporates Font Awesome, which is distributed under the terms of the SIL OFL 1.1 and MIT License.
- AcadHomepage is influenced by the github repo [mmistakes/minimal-mistakes](https://github.com/mmistakes/minimal-mistakes), which is distributed under the MIT License.
- AcadHomepage is influenced by the github repo [academicpages/academicpages.github.io](https://github.com/academicpages/academicpages.github.io), which is distributed under the MIT License.
