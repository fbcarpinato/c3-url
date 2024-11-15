module url;

enum Scheme : char(int value)
{
  HTTP      = 1,
  HTTPS     = 2,
}
struct Url
{
  Scheme    scheme;
  String    host;
  String    port;
  String    path;
  String    query;
}

fault UrlError {
   EMPTY,
   INVALID_SCHEME,
   MISSING_SCHEME_SEPARATOR,
   INVALID_AUTHRORITY,
   INVALID_HOST,
   INVALID_PORT,
   INVALID_PATH,
   INVALID_QUERY,
   INVALID_FRAGMENT
}

fn Url! from_string(String url)
{
  int len = url.len;

  if (len == 0)
  {
    return UrlError.EMPTY?;
  }

  int current_index = 0;

  int temp = current_index;
  while (temp < len - 1 && url[temp + 1] != ':') temp++;

  Scheme scheme;

  switch (url[current_index..temp]) {
      case "https": {
        scheme = Scheme.HTTPS;
      }
      case "http": {
        scheme = Scheme.HTTP;
      }
      default: {
          return UrlError.INVALID_SCHEME?;
      }
  }

  temp += 4;
  current_index = temp;

  while (temp < len - 1 && url[temp + 1] != ':') temp++;

  char[] host = url[current_index..temp];

  return Url{
      .scheme = scheme,
      .host = (String)host
  };
}

