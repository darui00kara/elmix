module Web.View.ViewHelper exposing (..)

import List exposing (map)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Navigation

import Message as Msg exposing (Msg)
import Web.Routing.Route as Route

allLinks : Html Msg
allLinks =
  div []
    [ h1 [] [ text "Page links" ]
    , ul [] (List.map renderLink [ "/" ])
    ]

renderLink : String -> Html Msg
renderLink url =
  li [] [ button [ onClick (Msg.NewUrl url), class "btn btn-primary btn-xs" ] [ text url ] ]

currentPagePath : Maybe Route.PagePath -> Html Msg
currentPagePath maybePagePath =
  div []
    [ h1 [] [ text "Current Page" ]
    , ul []
        [ li [] [ text (Route.toString maybePagePath) ]
        , li [] [ text (Route.isSuccess maybePagePath) ]
        ]
    ]

locationHistory : List Navigation.Location -> Html Msg
locationHistory history =
  div []
    [ h1 [] [ text "Location History" ]
    , ul [] (List.map renderLocation history)
    ]

renderLocation : Navigation.Location -> Html Msg
renderLocation location =
  li [] [ text (location.pathname ++ location.hash) ]

renderImg : Html Msg
renderImg =
  div []
    [ img [ src "/images/sample.jpg" ] [] ]
