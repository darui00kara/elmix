module Message exposing (Msg(..))

import Navigation exposing (Location)

type Msg =
  UrlChange Location
  | NewUrl String
  | RequestMsg
  | FormMsg
