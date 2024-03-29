test_that('get_session_auth ok', {
  skip_on_cran()
  sess = get_session_auth(auth_args[1L], auth_args[2L], auth_args[3L])
  expect_type(sess, 'list')
})

test_that('get_session_auth not ok', {
  skip_on_cran()
  expect_error(get_session_auth('1', 'nobody@a.io', 'password'))
})

test_that('scto_auth file ok', {
  skip_on_cran()
  auth = scto_auth(auth_file = auth_file)
  expect_class(auth, 'scto_auth')
})

test_that('scto_auth file not ok', {
  skip_on_cran()
  f = withr::local_tempfile()
  writeLines(c('swans', 'elephants'), f)
  expect_error(scto_auth(auth_file = f))
})

test_that('scto_auth args', {
  skip_on_cran()
  auth = scto_auth(
    servername = auth_args[1L], username = auth_args[2L],
    password = auth_args[3L])
  expect_class(auth, 'scto_auth')
})
