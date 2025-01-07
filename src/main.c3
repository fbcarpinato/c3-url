module main;

import std::io;

import url;

fn void main()
{
  Url! url = url::from_string("https://test.com");

  if (catch error = url)
  {
      io::printfn("Found some error %s", error);
      return;
  }

  io::printfn("Found a valid scheme %s", url.scheme);
  io::printfn("Found a valid host %s", url.host);
}
