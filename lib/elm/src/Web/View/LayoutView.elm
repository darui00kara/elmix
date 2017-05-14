module Web.View.LayoutView exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)

import Message as Msg exposing (Msg)
import Model.Params exposing (Params)
import Web.View.CustomAttributes exposing (role)
import Web.View.HelpersView as Helpers exposing (debug)

render : Params -> Html Msg -> Html Msg
render params mainRender =
  div [ class "container" ]
    [ renderHeader params
    , main_ [ role "main" ]
        [ mainRender ]
    , renderFooter params
    ]

renderHeader : Params -> Html Msg
renderHeader params =
  header [ class "header" ]
    [ nav [ role "navigation" ]
       [ ul [ class "nav nav-pills pull-right" ]
           [ li [] [
               a [ href "http://www.phoenixframework.org/docs" ] [ text "Get Started" ] ]
           ]
       ]
    , span [ class "logo" ] []
    ]

renderFooter : Params -> Html Msg
renderFooter params =
  footer [ class "footer" ]
    [ div [] [ text "footer" ]
    , Helpers.debug params
    ]
