module Web.Routing.Route exposing (PagePath, PagePath(..), build, take, isSuccess, toString)

import Navigation exposing (Location)
import UrlParser as Url exposing (oneOf, top, map)

type PagePath =
  NotFound
  | Home

route : Url.Parser (PagePath -> a) a
route =
  oneOf [ map Home top ]

take : Maybe PagePath -> PagePath
take maybePagePath =
  Maybe.withDefault NotFound maybePagePath

build : Location -> Maybe PagePath
build location =
  Url.parsePath route location

isSuccess : Maybe PagePath -> String
isSuccess maybePagePath =
  case (take maybePagePath) of
    NotFound -> "404"
    _ -> "200"

toString : Maybe PagePath -> String
toString maybePagePath =
  case (maybePagePath |> take) of
    NotFound -> "NotFound"
    Home     -> "Home" 
