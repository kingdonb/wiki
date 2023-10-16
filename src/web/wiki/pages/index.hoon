::  app index
::
/-  *wiki
/+  rudder, web=wiki-web
::
^-  (page:rudder state-0 action)
::
|_  [=bowl:gall =order:rudder state-0]
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  !!
::
++  final  (alert:rudder url.request.order build)
::
++  build
  |=  $:  arg=(list [k=@t v=@t])
          msg=(unit [success=? text=@t])
      ==
  ^-  reply:rudder
  =/  [site=(pole knot) query=(map @t @t)]  (sane-url:web url.request.order)
  ::
  |^  [%page render]
  ::
  ++  on-page-load
    =/  alert=(unit tape)  (query-msg:web query)
    ?~  alert  ""
    """
    javascript:window.alert('{u.alert}');
    window.history.pushState(\{}, document.title, window.location.pathname);
    """
  ::
  ++  render
    ^-  manx
    ;html
      ;+  (doc-head:web bowl "%wiki")
      ;body(onload on-page-load)
        ;h1: %wiki manager
        ;a/"/wiki/~/new"
          ;button(type "button"): New Wiki
        ==
        ;h2: Your Wikis
        ;ul.wiki-list
          ;*  %+  turn  ~(tap by books)
              |=  [id=@ta =book]
              ^-  manx
              ;li.wiki-list-item
                ;+  ?:(public-read.rules.book globe:icon:web lock:icon:web)
                ;a/"/wiki/{(trip id)}": {(trip title.book)}
              ==
        ==
      ==
    ==
  --
--
