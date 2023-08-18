::  article
::
/-  *wiki
/+  rudder
::
^-  (page:rudder (map @ta book) action)
::
|_  [=bowl:gall =order:rudder books=(map @ta book)]
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  !!
::
++  final  (alert:rudder url.request.order build)
::
++  build
  |=  [arg=(list [k=@t v=@t]) msg=(unit [? @t])]
  ^-  reply:rudder
  ::
  =/  site=(pole knot)  (stab url.request.order)
  ?.  ?=([%wiki book-id=@ta page-id=@ta ~] site)
    [%code 404 'Invalid path']
  ?~  buuk=(~(get by books) book-id.site)
    [%code 404 (crip "Wiki {<book-id.site>} not found")]
  =/  =book  u.buuk
  ?~  puge=(~(get by pages.book) page-id.site)
    [%code 404 (crip "Article {<page-id.site>} not found in {<title.book>}")]
  =/  =page  u.puge
  ::
  |^  [%page render]
  ::
  ++  style  ""
  ::
  ++  render
    ^-  manx
    ;html
      ;head
        ;title: {(trip title.page)}
      ==
      ;body
        ;h1: {(trip title.page)}
        ;p: {content.page}
      ==
    ==
  --
--
