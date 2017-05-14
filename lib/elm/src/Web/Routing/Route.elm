module Web.Routing.Route exposing (PagePath, PagePath(..), build, take, isSuccess, toString)

import Navigation exposing (Location)
import UrlParser as Url exposing (Parser, oneOf, top, map, s, (</>))

type PagePath =
  NotFound
  | Home
  | About
  | Help
  | Contact

route : Parser (PagePath -> a) a
route =
  oneOf [ map Home    (s "page" </> s "home")
        , map About   (s "page" </> s "about")
        , map Help    (s "page" </> s "help")
        , map Contact (s "page" </> s "contact")
        ]

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
    About    -> "About"
    Help     -> "Help"
    Contact  -> "Contact"
