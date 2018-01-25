part of site.partials;

class Link {
  final String text;

  final String url;

  final String icon;

  const Link(this.text, this.url, {this.icon});
}

class NavBarMenu extends Link {
  const NavBarMenu(String text, String link, {String icon})
      : super(text, link, icon: icon);
}

class NavBarComp extends Component {
  final AnyPage page;

  final List<NavBarMenu> menu;

  NavBarComp(this.page, {this.menu: const []});

  String renderMenu() => when(
      menu.isNotEmpty,
      () => '''
          <ul class="nav navbar-nav navbar-right">
            ${forEach(menu, (NavBarMenu m) => '<li><a href="${m.url}">${m.text}</a></li>')}
          </ul>
      ''');

  String render() => '''
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="collapse navbar-collapse">
          <h1 class="nav navbar-nav"><a href="/">${page.site.meta.title}</a></h1>
          ${renderMenu()}
        </div>
      </div>
    </nav>
  ''';
}
