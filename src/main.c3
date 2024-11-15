module main;

import std::io;

import url;

fn void main()
{
  Url! url = url::from_string("https://test.com");

  if (try url)
  {
    io::printfn("Found a valid scheme %s", url.scheme);
    io::printfn("Found a valid host %s", url.host);
  }
}
