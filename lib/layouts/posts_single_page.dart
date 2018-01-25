part of site.layout;

class PostsSinglePage extends Component {
  final SinglePage page;

  PostsSinglePage(this.page);

  String render() => '''
<html>
  ${comp(new HeadComp(page))}
  <body>    
    ${comp(new NavBarComp(page.site, menu: menu))}
    
    <main>
      <article>
        ${page.content}
      </article>
    </main>
  </body>
</html>
  ''';
}