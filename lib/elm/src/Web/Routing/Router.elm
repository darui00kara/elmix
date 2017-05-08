module Web.Routing.Router exposing (routing)

import Html exposing (Html)
import Navigation

import Message exposing (Msg)
import Model.Params as Params exposing (Params)
import Web.Routing.Route as Route

routing : Navigation.Location -> Params -> (Params, Cmd Msg)
routing location params =
  let
    (updateParams, cmd) = location
                          |> Route.build
                          |> Route.take
                          |> match params
  in
    ( ( location |> Params.updatePath updateParams )
    , cmd
    )

match : Params -> Route.PagePath -> (Params, Cmd Msg)
match params path =
  case path of
    _ -> (params, Cmd.none)
