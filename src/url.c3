module url;

struct Url {
  Scheme    scheme;
  Authority authority;
  String    path;
  String    query;
}


fn Url! from_string(String url) {
  int len = url.len;

  if (len == 0) {
    return UrlError.EMPTY?;
  }

  String[] parts = url.tsplit("://", 2);

  if (parts.len != 2) {
    return UrlError.MISSING_SCHEME_SEPARATOR?;
  }

  Scheme! scheme = parse_scheme(parts[0]);

  if (catch error = scheme) {
    return error?;
  }

  parts = parts[1].tsplit("/", 1);

  Authority! authority = parse_authority(parts[0]);

  if (catch error = authority) {
    return error?;
  }

  return Url{
    .scheme = scheme,
    .authority = authority
  };
}


