module Web.View.PageView exposing (home, about, help, contact)

import Html exposing (..)

import Message as Msg exposing (Msg)
import Model.Models exposing (Models)

home : Models -> Html Msg
home models =
  div [] [ text "Home" ]

about : Models -> Html Msg
about models =
  div [] [ text "About" ]

help : Models -> Html Msg
help models =
  div [] [ text "Help" ]

contact : Models -> Html Msg
contact models =
  div [] [ text "Contact" ]
