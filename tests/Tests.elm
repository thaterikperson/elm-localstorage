module Tests exposing (..)

import ElmTest exposing (..)
import Json.Decode as JD exposing ((:=))
import Json.Encode as JE
import LocalStorage exposing (getItem, setItem)
import String


all : Test
all =
  let
    stringItemKey = setItem "string-item" (JE.string "test string")
    intItemKey = setItem "int-item" (JE.int 10)
    objectItemKey = setItem "obj-item" (JE.object [("prop", JE.string "val")])
    objectDeocder = JD.object1 (\val -> { prop = val }) ("prop" := JD.string)
  in
    suite "LocalStorage Test Suite"
      [ test "getItem string" (assertEqual (getItem JD.string "string-item") (Ok "test string"))
      , test "getItem int" (assertEqual (getItem JD.int "int-item") (Ok 10))
      , test "getItem object" (assertEqual (getItem objectDeocder "obj-item") (Ok { prop = "val" }))
      , test "getItem object fail" (assertEqual (getItem JD.int "string-item") (Err "Expecting an Int but instead got: \"test string\""))
      , test "setItem string" (assertEqual stringItemKey "string-item")
      , test "setItem int" (assertEqual intItemKey "int-item")
      , test "setItem object" (assertEqual objectItemKey "obj-item")
      ]


main =
  runSuiteHtml all
