---
permalink: /blog/
title: "Blog"
author_profile: true
---

<div class="blog-callout">
  <p class="blog-callout__eyebrow">Independent Blog</p>
  <h1 class="blog-callout__title">Notes on research, building, and experiments</h1>
  <p class="blog-callout__summary">
    This page keeps longer writing separate from the homepage, so the main site stays concise while the blog can grow into a proper archive of ideas, project notes, and technical reflections.
  </p>
</div>

{% assign posts = site.posts %}
{% if posts.size > 0 %}
<div class="blog-post-list">
  {% for post in posts %}
    <a class="blog-post-card" href="{{ post.url | relative_url }}">
      <div class="blog-post-card__meta">{{ post.date | date: "%b %d, %Y" }}</div>
      <h2 class="blog-post-card__title">{{ post.title }}</h2>
      <p class="blog-post-card__excerpt">
        {% if post.excerpt %}
          {{ post.excerpt | strip_html | strip_newlines | truncate: 140 }}
        {% else %}
          {{ post.content | strip_html | strip_newlines | truncate: 140 }}
        {% endif %}
      </p>
      <span class="blog-post-card__cta">Read article</span>
    </a>
  {% endfor %}
</div>
{% else %}
<div class="blog-empty-state">
  No posts yet. Add a Markdown file under <code>_posts/</code> with a filename like <code>2026-05-03-my-first-post.md</code> to publish your first article.
</div>
{% endif %}
