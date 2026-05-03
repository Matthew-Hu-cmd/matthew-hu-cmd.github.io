# ✍️ Blog

<div class="blog-callout">
  <p class="blog-callout__eyebrow">Latest Writing</p>
  <h2 class="blog-callout__title">A dedicated space for longer thoughts</h2>
  <p class="blog-callout__summary">
    I use this blog to write down research notes, project retrospectives, and ideas that deserve more room than a homepage section.
  </p>

  {% assign featured_posts = site.posts | slice: 0, 3 %}
  {% if featured_posts.size > 0 %}
  <div class="blog-post-list">
    {% for post in featured_posts %}
      <a class="blog-post-card" href="{{ post.url | relative_url }}">
        <div class="blog-post-card__meta">{{ post.date | date: "%b %d, %Y" }}</div>
        <h3 class="blog-post-card__title">{{ post.title }}</h3>
        <p class="blog-post-card__excerpt">
          {% if post.excerpt %}
            {{ post.excerpt | strip_html | strip_newlines | truncate: 120 }}
          {% else %}
            {{ post.content | strip_html | strip_newlines | truncate: 120 }}
          {% endif %}
        </p>
        <span class="blog-post-card__cta">Open article</span>
      </a>
    {% endfor %}
  </div>
  {% else %}
  <div class="blog-empty-state">
    Your blog page is ready. Add posts under <code>_posts/</code> whenever you want to publish a new article.
  </div>
  {% endif %}

  <div class="blog-actions">
    <a class="btn" href="{{ '/blog/' | relative_url }}">Visit the full blog</a>
  </div>
</div>
