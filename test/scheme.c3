import url;

fn void test_no_scheme() @test
{
  url::Scheme scheme = url::parse_scheme("")!!;
  assert(scheme == url::Scheme.NONE, "No scheme gets parsed correctly");
}

fn void test_http_scheme() @test
{
  url::Scheme scheme = url::parse_scheme("http")!!;
  assert(scheme == url::Scheme.HTTP, "Https scheme gets parsed correctly");
}

fn void test_https_scheme() @test
{
  url::Scheme scheme = url::parse_scheme("https")!!;
  assert(scheme == url::Scheme.HTTPS, "Https scheme gets parsed correctly");
}

fn void test_wss_scheme() @test
{
  url::Scheme scheme = url::parse_scheme("wss")!!;
  assert(scheme == url::Scheme.WSS, "Wss scheme gets parsed correctly");
}

fn void test_ws_scheme() @test
{
  url::Scheme scheme = url::parse_scheme("ws")!!;
  assert(scheme == url::Scheme.WS, "Ws scheme gets parsed correctly");
}

fn void test_file_scheme() @test
{
  url::Scheme scheme = url::parse_scheme("file")!!;
  assert(scheme == url::Scheme.FILE, "File scheme gets parsed correctly");
}

fn void test_ftp_scheme() @test
{
  url::Scheme scheme = url::parse_scheme("ftp")!!;
  assert(scheme == url::Scheme.FTP, "Ftp scheme gets parsed correctly");
}


fn void test_unknown_scheme() @test
{
  url::Scheme! scheme = url::parse_scheme("random");

	anyfault error = @catch(scheme);

  assert(error == UrlError.INVALID_SCHEME, "Unknown scheme gets parsed correctly");
}
