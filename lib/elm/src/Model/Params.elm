module Model.Params exposing (Params, new, updatePath, updateModels, updateRender)

import Html exposing (Html)
import Navigation exposing (Location)

import Model.Models as Models exposing (Models, new)
import Message exposing (Msg)
import Web.Routing.Route as Route exposing (build)

type alias Params =
  { currentPagePath : Maybe Route.PagePath
  , locationHistory : List Location
  , models : Models
  , render : Models -> Html Msg
  }

new : Location -> (Models -> Html Msg) -> Params
new location startRender =
  Params
    (Route.build location)
    [ location ]
    Models.new
    startRender

updatePath : Location -> Params -> Params
updatePath location params =
  { params
    | currentPagePath = Route.build location
    , locationHistory = location :: params.locationHistory
  }

updateModels : Models -> Params -> Params
updateModels update params =
  { params | models = update }

updateRender : (Models -> Html Msg) -> Params -> Params
updateRender update params =
  { params | render = update }
