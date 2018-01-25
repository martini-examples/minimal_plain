import 'package:jaguar_martini/jaguar_martini.dart';

/// Shortcode renderer for Github Gists
class GistShortCode implements ShortCode {
  final String name = 'gist';

  String transform(Map<String, String> params, String content) {
    return 'Gist with id ${params['id']}';
  }

  const GistShortCode();
}

class AsciinemaShortCode implements ShortCode {
  final String name = "asciinema";

  const AsciinemaShortCode();

  String transform(Map<String, String> params, String content) {
    final String id = params["id"];
    final String size =
        params["size"] != null ? ' data-size="${params["size"]}"' : '';
    final String autoplay = params["autoplay"] != null
        ? ' data-autoplay="${params["autoplay"]}"'
        : '';
    return '''
  <script type="text/javascript" src="https://asciinema.org/a/$id.js" 
    id="asciicast-$id"$size$autoplay async>
  </script>''';
  }
}
