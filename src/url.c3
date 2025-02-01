module url;

import std::io;

struct Url {
  Scheme    scheme;
  Authority authority;
  Path      path;
  String    query;
}

fn Url! from_string(String url) {
  int len = url.len;

  if (len == 0) {
    return UrlError.EMPTY?;
  }

  Scheme! scheme = parse_scheme(url);

  if (catch error = scheme) {
    return error?;
  }

  url = url.strip(scheme.value);

  if (
    url[0] != ':' ||
    url[1] != '/' ||
    url[2] != '/'
  ) {
    return UrlError.MISSING_SCHEME_SEPARATOR?;
  }

  url = url.strip("://");

  Authority! authority = parse_authority(url);

  if (catch error = authority) {
    return error?;
  }

  url = url.strip(authority.raw);

  io::printfn("remaining part %s", url);

  return Url{
    .scheme = scheme,
    .authority = authority
  };
}


