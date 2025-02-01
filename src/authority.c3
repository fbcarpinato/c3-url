module url;

struct Authority {
  String raw;
  String host;
  int port;
}

fn Authority! parse_authority(String url) {
  if (url.len == 0) {
    return UrlError.INVALID_AUTHRORITY?;
  }

  usz start = 0;
  usz end = url.len - 1;

  for (usz i = start; i < url.len - 1; ++i) {
    if (url[i + 1] == '/' || url[i + 1] == '?') {
      end = i;
      break;
    }
  }

  String authority_url = url[start..end];

  Authority authority = {
    .raw = authority_url,
    .host = "",
    .port = -1
  };

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
