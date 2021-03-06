context("categories")

test_that("categories works as expected", {
  skip_on_cran()

  aa <- categories()

  expect_is(aa, "list")
  expect_named(aa, "category_list")

  expect_is(aa$category_list, "list")
  expect_is(aa$category_list$categories, "data.frame")
  expect_is(aa$category_list$can_create_category, "logical")
})

test_that("category works as expected", {
  skip_on_cran()

  aa <- category("questions")

  expect_is(aa, "list")
  expect_named(aa, c("users", "primary_groups", "topic_list"))

  expect_is(aa$users, "data.frame")
  expect_is(aa$topic_list, "list")
  expect_is(aa$topic_list$topics, "data.frame")
  expect_null(aa$topic_list$draft)
})

test_that("category_latest_topics works as expected", {
  skip_on_cran()

  aa <- category_latest_topics("packages")

  expect_is(aa, "list")
  expect_named(aa, c("users", "primary_groups", "topic_list"))

  expect_is(aa$users, "data.frame")
  expect_is(aa$topic_list, "list")
  expect_is(aa$topic_list$topics, "data.frame")
  expect_null(aa$topic_list$draft)
})

test_that("fails well with no input", {
  skip_on_cran()

  expect_error(category(), "argument \"category\" is missing")
  expect_error(category_create(), "argument \"category\" is missing")
  expect_error(category_latest_topics(), "argument \"category\" is missing")
  expect_error(category_new_topics(), "argument \"category\" is missing")
  expect_error(category_top_topics(), "argument \"category\" is missing")
})

test_that("fails well with non-existent user", {
  skip_on_cran()

  expect_error(category("asfafsfadfasdfd"), "Not Found \\(HTTP 404\\)")
})

test_that("curl options work", {
  skip_on_cran()

  expect_error(categories(timeout_ms = 1))
})
