module url;

enum Scheme : char(String value) {
  HTTP      = "http",
  HTTPS     = "https",
  WSS       = "wss",
  WS        = "ws",
  FILE      = "file",
  FTP       = "ftp",
}

fn Scheme! parse_scheme(String url) {
  if (url.len >= 5) {
    if (
        url[0].to_lower() == 'h' &&
        url[1].to_lower() == 't' &&
        url[2].to_lower() == 't' &&
        url[3].to_lower() == 'p' &&
        url[4].to_lower() == 's') {
      return Scheme.HTTPS;
    }
  }

  if (url.len >= 4) {
    if (
        url[0].to_lower() == 'f' &&
        url[1].to_lower() == 'i' &&
        url[2].to_lower() == 'l' &&
        url[3].to_lower() == 'e') {
      return Scheme.FILE;
    }

    if (
        url[0].to_lower() == 'h' &&
        url[1].to_lower() == 't' &&
        url[2].to_lower() == 't' &&
        url[3].to_lower() == 'p') {
      return Scheme.HTTP;
    }
  }

  if (url.len >= 3) {
    if (
        url[0].to_lower() == 'f' &&
        url[1].to_lower() == 't' &&
        url[2].to_lower() == 'p') {
      return Scheme.FTP;
    }

    if (
        url[0].to_lower() == 'w' &&
        url[1].to_lower() == 's' &&
        url[2].to_lower() == 's') {
      return Scheme.WSS;
    }
  }

  if (url.len >= 2) {
    if (
        url[0].to_lower() == 'w' &&
        url[1].to_lower() == 's') {
      return Scheme.WS;    }
  }

  return UrlError.INVALID_SCHEME?;
}
