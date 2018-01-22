part of site.partials;

/// Partial to renders HTML head component for a given [page]
class HeadComp extends Component {
  final AnyPage page;

  HeadComp(this.page);

  Site get site => page.site;

  String get title {
    if (page is SinglePage) {
      return (page as SinglePage).meta.title + ': ' + site.meta.title;
    } else if (page is Tag) {
      return (page as Tag).name + ': ' + site.meta.title;
    } else if (page is Category) {
      return (page as Category).name + ': ' + site.meta.title;
    } else if (page is Section) {
      return (page as Section).name + ': ' + site.meta.title;
    } else if (page is Site) {
      return (page as Site).meta.title;
    }
    throw new UnsupportedError('Unsupported list page!');
  }

  String render() {
    return '''
  <head>
    <title>$title</title>
    <meta property='og:title' content="$title">
    <meta property="og:type" content="${page is Site? 'website': 'article'}">
    ${when(page is SinglePage, () => '<meta name="description" content="${(page as SinglePage).meta.description}">')}
    <meta property="og:url" content="${page.permalink}">
    <!-- TODO meta og:image -->

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">

    <meta name="generator" content="Martini 0.1.0" />

    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
 

    <!-- My stylesheets -->
    <link rel="stylesheet" href="${site.meta.baseURL}/static/css/styles.css">
    <link rel="stylesheet" href="${site.meta.baseURL}/static/css/customize_prettify.css">
    <link rel="stylesheet" href="${site.meta.baseURL}/static/css/latex.css">
    <link rel="stylesheet" href="${site.meta.baseURL}/static/css/google_search.css">
    <!-- My RSS -->
    <link rel="alternate" type="application/rss+xml" title="RSS" href="${site.meta.baseURL}/index.xml">

    <!--Google prettify-->
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?lang=dart&lang=go&lang=css&lang=swift&lang=vhdl&lang=yaml"></script>
  </head>
    ''';
  }
}

class GoogleAnalytics extends Component {
  final String id;

  GoogleAnalytics(this.id);

  String render() => '''
    <!-- Global Site Tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=$id"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments)};
      gtag('js', new Date());
      gtag('config', '$id');
    </script>
  ''';
}