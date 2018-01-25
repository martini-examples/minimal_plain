part of site.partials;

class PostsListItemPartial extends Component {
  final SinglePage page;

  PostsListItemPartial(this.page);

  @override
  String render() {
    return '''
<article class="single">
  <header class="article-header">
    <div class="article-title">
      <a href="${page.permalink}">${page.meta.title}</a>
    </div>
    <time class="article-time" datetime="${page.meta.date.toString()}">
      ${formatDate(page.meta.date, dateFormat)}
    </time>
  </header>

  <div class="article-body" itemprop="articleBody">${page.content}</div>
</article>
    ''';
  }
}