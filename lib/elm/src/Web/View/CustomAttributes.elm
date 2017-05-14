module Web.View.CustomAttributes exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (attribute)

role : String -> Attribute msg
role name =
  attribute "role" name
