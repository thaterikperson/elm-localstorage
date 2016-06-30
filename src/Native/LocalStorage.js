var _thaterikperson$elm_localstorage$Native_LocalStorage = function() {

  function getItem(key) {
    return localStorage.getItem(key) || ""
  }

  function setItem(key, value) {
    localStorage.setItem(key, value)
    return key
  }

  return {
    getItem: getItem,
    setItem: F2(setItem)
  };
}();
