# LocalStorage

Allows you to store and retrieve objects from the browser's localStorage. The value you set will be encoded as JSON and decoded when you retrieve it.

### getItem

Fetch a value from localStorage with the given key and decode it.

`getItem : Decoder a -> String -> Result String a`

```elm
case getItem Json.Decode.string myKey of
  Ok aStringValue -> aStringValue
  Err x -> x
```

### setItem

Save a value in localStorage with the given key. Note: value will be encoded as JSON for easier retrieval.

`setItem : String -> Value -> Task String String`

```elm
task = setItem myKey (Json.Encode.string "my value")
```
