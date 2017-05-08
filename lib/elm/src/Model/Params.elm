module Model.Params exposing (Params, new, updatePath)

import Navigation exposing (Location)
import Web.Routing.Route as Route exposing (PagePath, build, toString)

type alias Params =
  { currentPagePath : Maybe Route.PagePath
  , locationHistory : List Location
  }

new : Location -> Params
new location =
  Params
    (Route.build location)
    [ location ]

updatePath : Params -> Location -> Params
updatePath params location =
  { params
    | currentPagePath = Route.build location
    , locationHistory = location :: params.locationHistory
  }
