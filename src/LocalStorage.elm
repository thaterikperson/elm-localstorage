module LocalStorage exposing (getItem, setItem)

{-| Allows you to store and retrieve objects from
the browser's localStorage. The value you set will
be encoded as JSON and decoded when you retrieve it.

@docs getItem, setItem

-}

import Json.Decode exposing (Decoder, decodeString)
import Json.Encode exposing (Value, encode)
import Native.LocalStorage
import Platform exposing (Task)
import Result exposing (Result)

{-| Fetch a value from localStorage with the
given key and decode it.

    case getItem Json.Decode.string myKey of
      Ok aStringValue -> aStringValue
      Err x -> x
-}
getItem : Decoder a -> String -> Result String a
getItem decoder key =
  Native.LocalStorage.getItem key
    |> decodeString decoder

{-| Save a value in localStorage with the
given key.

    _ = setItem myKey (Json.Encode.string "my value")
-}
setItem : String -> Value -> String
setItem key value =
  Native.LocalStorage.setItem key (encode 0 value)
