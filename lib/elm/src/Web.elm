module Web exposing (..)

import Html exposing (Html, div)
import Navigation
import Model.Params as Params exposing (Params)
import Message as Msg exposing (Msg)
import Web.Routing.Router as Router exposing (routing)
import Web.View.LayoutView as LayoutView exposing (render)
import Web.View.PageView as Render exposing (home)

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
  (Params.new location Render.home) |> Router.routing location

-- update 

update : Msg -> Params -> (Params, Cmd Msg)
update msg params =
  case msg of
    Msg.NewUrl url ->
      (params, Navigation.newUrl url)
    Msg.UrlChange location ->
      Router.routing location params
    _ ->
      (params, Cmd.none)

-- view

view : Params -> Html Msg
view params =
  params.render |> LayoutView.render params

-- subscriptions

subscriptions : Params -> Sub Msg
subscriptions params =
  Sub.none
