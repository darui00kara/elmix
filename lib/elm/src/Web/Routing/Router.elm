module Web.Routing.Router exposing (routing)

import Html exposing (Html)
import Navigation exposing (Location)

import Message exposing (Msg)
import Model.Params as Params exposing (Params, updatePath, updateModels, updateRender)
import Model.Models exposing (Models)
import Web.Routing.Route as Route exposing (PagePath, PagePath(..), build, take)
import Web.Controller.PageController as PageController
import Web.View.ErrorView as ErrorView exposing (notFound)

routing : Location -> Params -> (Params, Cmd Msg)
routing location params =
  let
    (models, cmd, render) = location
                            |> Route.build
                            |> Route.take
                            |> match params.models
  in
    ( ( params
        |> Params.updatePath   location
        |> Params.updateModels models
        |> Params.updateRender render
      )
    , cmd
    )

match : Models -> PagePath -> (Models, Cmd Msg, (Models -> Html Msg))
match models path =
  case path of
    Home    -> PageController.home    models
    About   -> PageController.about   models
    Help    -> PageController.help    models
    Contact -> PageController.contact models
    _ -> (models, Cmd.none, ErrorView.notFound)
