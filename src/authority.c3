module url;

struct Authority {
  String host;
  int port;
}

fn Authority! parse_authority(String authority_url) {
  Authority authority = {.host = "", .port = -1};

  if (authority_url.len == 0) {
    return UrlError.INVALID_AUTHRORITY?;
  }

  String[] parts = authority_url.tsplit(":", 2);

  if (parts[0]) {
    authority.host = parts[0];
  } else {
    return UrlError.INVALID_HOST?;
  }

  if (parts.len > 1) {
    int! port = String.to_int(parts[1]);

    if (catch port) {
      return UrlError.INVALID_PORT?;
    }

    if (port < 0 || port > 65535) {
      return UrlError.INVALID_PORT?;
    }

    authority.port = port;
  }

  return authority;
}
