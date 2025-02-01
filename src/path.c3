module url;

import std::collections;

struct Path {
  List(<String>) segments;
  String raw;
}

fn Path parse_path(String url) {
  List(<String>) segments;
  segments.new_init();

  foreach (segment : url.tsplit("/")) {
    if (segment.len > 0) {
      segments.push(segment);
    }
  }

  // TODO: we should free this memory???
  return Path {
    .segments = segments,
    .raw = url
  };
}
