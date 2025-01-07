module url;

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

  String[] parts = url.tsplit(":", 2);

  if (parts.len != 2) {
    return UrlError.MISSING_SCHEME_SEPARATOR?;
  }

  Scheme scheme = parse_scheme(parts[0]);

  if (scheme == Scheme.UNKNOWN)
  {
    return UrlError.INVALID_SCHEME?;
  }

  return Url{
      .scheme = scheme
  };
}


