module Web.View.ErrorView exposing (notFound)

import Html exposing (Html, div, text)

import Message as Msg exposing (Msg)
import Model.Models exposing (Models)

notFound : Models -> Html Msg
notFound _ =
  div [] [ text "Page not found" ]
