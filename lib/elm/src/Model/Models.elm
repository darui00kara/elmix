module Model.Models exposing (Models, new)

import Web.Model.Page exposing (Page)

type alias Models =
  { page : Web.Model.Page.Page }

new : Models
new =
  { page = { message = "none" } }
