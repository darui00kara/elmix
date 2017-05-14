module Web.View.HelpersView exposing (renderImg, debug)

import List exposing (map)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Navigation

import Message as Msg exposing (Msg)
import Model.Params exposing (Params)
import Web.Routing.Route as Route

debug : Params -> Html Msg
debug params =
  div [ class "container" ]
    [ allLinks
    , currentPagePath params.currentPagePath
    , locationHistory params.locationHistory
    ]

allLinks : Html Msg
allLinks =
  div []
    [ h2 [] [ text "All Page Links" ]
    , ul [] (List.map link [ "/page/home"
                           , "/page/about"
                           , "/page/help"
                           , "/page/contact"
                           ]
            )
    ]

link : String -> Html Msg
link url =
  li [] [ button [ onClick (Msg.NewUrl url), class "btn btn-default btn-xs" ] [ text url ] ]

currentPagePath : Maybe Route.PagePath -> Html Msg
currentPagePath maybePagePath =
  div []
    [ h2 [] [ text "Current Page" ]
    , ul []
        [ li [] [ text (toRenderText maybePagePath) ] ]
    ]

toRenderText : Maybe Route.PagePath -> String
toRenderText maybePagePath =
  (Route.toString maybePagePath) ++ "(" ++ (Route.isSuccess maybePagePath) ++ ")"

locationHistory : List Navigation.Location -> Html Msg
locationHistory history =
  div []
    [ h2 [] [ text "Location History" ]
    , ul [] (List.map renderLocation history)
    ]

renderLocation : Navigation.Location -> Html Msg
renderLocation location =
  li [] [ text (location.pathname ++ location.hash) ]

renderImg : String -> Html Msg
renderImg path =
  div []
    [ img [ src path, height 480, width 320 ] [] ]
