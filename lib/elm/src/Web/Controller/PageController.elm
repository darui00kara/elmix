module Web.Controller.PageController exposing (home, about, help, contact)

import Html exposing (Html)

import Message as Msg exposing (Msg)
import Model.Models exposing (Models)
import Web.View.PageView as View

home : Models -> (Models, Cmd Msg, (Models -> Html Msg))
home models =
  ( models
  , Cmd.none
  , View.home
  )

about : Models -> (Models, Cmd Msg, (Models -> Html Msg))
about models =
  ( models
  , Cmd.none
  , View.about
  )

help : Models -> (Models, Cmd Msg, (Models -> Html Msg))
help models =
  ( models
  , Cmd.none
  , View.help
  )

contact : Models -> (Models, Cmd Msg, (Models -> Html Msg))
contact models =
  ( models
  , Cmd.none
  , View.contact
  )
