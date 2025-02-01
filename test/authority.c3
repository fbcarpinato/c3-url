import url;

fn void test_no_authority() @test
{
  url::Authority! authority = url::parse_authority("");

	anyfault error = @catch(authority);

  assert(error == UrlError.INVALID_AUTHRORITY, "Invalid authority gets dectected correctly");
}

fn void test_simple_authority() @test
{
  url::Authority authority = url::parse_authority("test.com")!!;

  assert(authority.host == "test.com", "Authority gets parsed correctly");
  assert(authority.port == -1, "Port gets parsed correctly and assigned to -1 for missing");
}

fn void test_simple_authority_with_port() @test
{
  url::Authority authority = url::parse_authority("test.com:2222")!!;

  assert(authority.host == "test.com", "Authority gets parsed correctly");
  assert(authority.port == 2222, "Port gets parsed correctly");
}

fn void test_simple_authority_with_port_out_of_range_less_than_zero() @test
{
  url::Authority! authority = url::parse_authority("test.com:-2342");

	anyfault error = @catch(authority);

  assert(error == UrlError.INVALID_PORT, "Invalid port gets dectected correctly");
}


fn void test_simple_authority_with_port_out_of_range_greater_than_max() @test
{
  url::Authority! authority = url::parse_authority("test.com:23423421124312421342134312412");

	anyfault error = @catch(authority);

  assert(error == UrlError.INVALID_PORT, "Invalid port gets dectected correctly");
}

fn void test_simple_authority_with_port_invalid_number() @test
{
  url::Authority! authority = url::parse_authority("test.com:test");

	anyfault error = @catch(authority);

  assert(error == UrlError.INVALID_PORT, "Invalid port gets dectected correctly");
}
