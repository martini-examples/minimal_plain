part of site.layout;

class PostsIndexPage extends Component {
  final ListPage page;

  final PaginationInfo paginationInfo;

  PostsIndexPage(this.page, this.paginationInfo);

  Site get site => page.site;

  String get heading {
    if (page is Tag) {
      return (page as Tag).name;
    } else if (page is Category) {
      return (page as Category).name;
    } else if (page is Section) {
      return (page as Section).name;
    } else if(page is Site) {
      return (page as Site).meta.title;
    }
    throw new UnsupportedError('Unsupported list page!');
  }

  @override
  String render() {
    return '''
<html>
  ${comp(new HeadComp(page))}

  <body>
    ${comp(new NavBarComp(page.site, menu: menu))}

    <main>
      <div class="row">
        <div class="col-sm-9">
          <div class="articles">
            ${range(paginationInfo.start, paginationInfo.end,
            (i) => new PostsListItemPartial(page.pages[i]).render())}
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
    ''';
  }
}