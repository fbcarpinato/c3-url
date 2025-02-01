import url;

fn void test_invalid_scheme() @test
{
  Url! url = url::from_string("test://test.com");

  anyfault excuse = @catch(url);

  assert(excuse == url::UrlError.INVALID_SCHEME, "Url scheme is invalid");
}


fn void test_missing_separator() @test
{
  Url! url = url::from_string("test//test.com");

  anyfault excuse = @catch(url);

  assert(excuse == url::UrlError.MISSING_SCHEME_SEPARATOR, "Url is missing scheme separator");
}
