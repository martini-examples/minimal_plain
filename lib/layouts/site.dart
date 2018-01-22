part of site.layout;

class SiteIndexPage extends Component {
  final Site site;

  SiteIndexPage(this.site);
  
  final menu = <NavBarMenu>[
    new NavBarMenu('Wiki', 'https://github.com/Jaguar-dart/jaguar/wiki'),
    new NavBarMenu('API', 'https://www.dartdocs.org/documentation/jaguar/latest/index.html'),
    new NavBarMenu('Examples', 'https://github.com/jaguar-examples'),
    new NavBarMenu('Snippets', ''),
    new NavBarMenu('Gitter', 'https://gitter.im/jaguar_dart/jaguar'),
    new NavBarMenu('Github', 'https://github.com/Jaguar-dart'),
  ];

  @override
  String render() {
    return '''
<html>
  ${comp(new HeadComp(site))}

  <body>
    ${comp(new NavBarComp(site, menu: menu))}
    
    <main>
      <div class="intro">
          <h1>${site.meta.title}</h1>
          <h2>${site.meta.description}</h2>
      </div>
    </main>
    
    
    <footer>
      <p class="copyright text-muted">${site.meta.copyright}</p>
    </footer>
  </body>
</html>
    ''';
  }
}

class SiteLayout implements SiteWriter {
  @override
  List<String> index(Site site) => [new SiteIndexPage(site).render()];

  @override
  List<String> categories(Category categories) => [];

  @override
  List<String> tags(Tag tags) => [];
}

