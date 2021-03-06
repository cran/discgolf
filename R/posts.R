#' Work with posts
#'
#' @name posts
#' @param post_id A post id
#' @param topic_id A topic id
#' @param text Text to put in post
#' @template args
#' @examples \dontrun{
#' # get a post
#' post_get(90)
#' post_get(120)
#' post_get(130)
#' post_get(155)
#' cat(post_get(155)$raw)
#'
#' # create post, create topic first
#' z <- topic_create("The problems with blue skies",
#'   text = "just saying these things cause I like the sky very much")
#' zz <- post_create(topic_id = z$topic_id,
#'   text = "There isn't a problem is there?")
#' topic(z$topic_id)
#' post_get(zz$id)
#'
#' # Wikify a post
#' post_wikify(zz$id)
#'
#' # cleanup - delete the topic
#' topic_delete(z$topic_id)
#' }

#' @export
#' @rdname posts
post_get <- function(post_id, url = NULL, key = NULL, user = NULL, ...) {
  args <- dc(list(api_key = check_key(key), api_username = check_user(user)))
  disc_GET(check_url(url), sprintf("posts/%s.json", post_id), args, ...)
}

#' @export
#' @rdname posts
post_create <- function(topic_id, text, url=NULL, key=NULL, user=NULL, ...){
  args <- dc(list(api_key = check_key(key), api_username = check_user(user)))
  body <- dc(list(topic_id = topic_id, raw = text))
  disc_POST(check_url(url), "posts", args, body, ...)
}

#' @export
#' @rdname posts
post_wikify <- function(post_id, url=NULL, key=NULL, user=NULL, ...){
  args <- dc(list(api_key = check_key(key), api_username = check_user(user),
                  wiki = "true"))
  disc_PUT(check_url(url), sprintf("posts/%s/wiki", post_id), args, ...)
}
