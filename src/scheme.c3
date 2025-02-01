module url;

enum Scheme : char(int value) {
  NONE      = 0,
  HTTP      = 1,
  HTTPS     = 2,
  WSS       = 3,
  WS        = 4,
  FILE      = 5,
  FTP       = 6,
}

fn Scheme! parse_scheme(String url) {
  switch (url.len) {
    case 0:
      return Scheme.NONE;

    case 2: {
              if (url[0].to_lower() == 'w' && url[1].to_lower() == 's') {
                return Scheme.WS;
              }
            }

    case 3: {
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

    case 4: {
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

    case 5: {
              if (
                  url[0].to_lower() == 'h' &&
                  url[1].to_lower() == 't' &&
                  url[2].to_lower() == 't' &&
                  url[3].to_lower() == 'p' &&
                  url[4].to_lower() == 's') {
                return Scheme.HTTPS;
              }
            }
  }

  return UrlError.INVALID_SCHEME?;
}
