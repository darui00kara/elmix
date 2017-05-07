module Web exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Navigation
import Model.Params exposing (Params)
import Message as Msg exposing (Msg)

-- main

main : Program Never Params Msg
main =
  Navigation.program Msg.UrlChange
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- init

init : Navigation.Location -> (Params, Cmd Msg)
init location =
  ({name = "test"}, Cmd.none)

-- update 

update : Msg -> Params -> (Params, Cmd Msg)
update msg params =
  (params, Cmd.none)

-- view

view : Params -> Html Msg
view params =
  div []
    [ text "test" ]

-- subscriptions

subscriptions : Params -> Sub Msg
subscriptions params =
  Sub.none
