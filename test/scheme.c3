import url;

fn void test_no_schema() @test
{
  url::Scheme scheme = url::parse_scheme("")!!;
  assert(scheme == url::Scheme.NONE, "No schema gets parsed correctly");
}

fn void test_http_schema() @test
{
  url::Scheme scheme = url::parse_scheme("http")!!;
  assert(scheme == url::Scheme.HTTP, "Https schema gets parsed correctly");
}

fn void test_https_schema() @test
{
  url::Scheme scheme = url::parse_scheme("https")!!;
  assert(scheme == url::Scheme.HTTPS, "Https schema gets parsed correctly");
}

fn void test_wss_schema() @test
{
  url::Scheme scheme = url::parse_scheme("wss")!!;
  assert(scheme == url::Scheme.WSS, "Wss schema gets parsed correctly");
}

fn void test_ws_schema() @test
{
  url::Scheme scheme = url::parse_scheme("ws")!!;
  assert(scheme == url::Scheme.WS, "Ws schema gets parsed correctly");
}

fn void test_file_schema() @test
{
  url::Scheme scheme = url::parse_scheme("file")!!;
  assert(scheme == url::Scheme.FILE, "File schema gets parsed correctly");
}

fn void test_ftp_schema() @test
{
  url::Scheme scheme = url::parse_scheme("ftp")!!;
  assert(scheme == url::Scheme.FTP, "Ftp schema gets parsed correctly");
}


fn void test_unknown_schema() @test
{
  url::Scheme! scheme = url::parse_scheme("random");

	anyfault error = @catch(scheme);

  assert(error == UrlError.INVALID_SCHEME, "Unknown schema gets parsed correctly");
}
