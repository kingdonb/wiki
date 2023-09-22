/-  *wiki
/+  rudder
/~  web  (page:rudder (map @ta book) action)  /web/wiki
::
|_  books=(map @ta book)
::
+$  sig  %~.~
::
++  http-route
  ^-  route:rudder
  |=  =trail:rudder
  ^-  (unit place:rudder)
  ?^  point=((point:rudder /wiki & ~(key by web)) trail)
    point
  =/  site=(list @t)  site.trail
  =/  pat=(pole knot)  (need (decap:rudder /wiki site))
  |^  ?:  tail-fas        `[%away (snip site)]
      ?+  pat             page-resource
        [sig %new ~]      `[%page & %new-book]
        [@ta ~]           `[%page auth %book]
        [@ta sig %new ~]  `[%page & %new-page]
      ==
  ::
  ++  auth
    ^-  ?
    =/  book-id=@ta  -.pat
    ?~  book=(~(get by books) book-id)  &
    !public-read.rules.u.book
  ::
  ++  tail-fas  ?=([%$ *] (flop pat)) :: detect trailing /
  ::
  ++  page-resource
    ^-  (unit place:rudder)
    :-  ~
    :-  %page
    =/  n=@  (lent pat)
    ?:  (lth n 3)       [auth %page]
    =/  suf=path  (slag (sub n 2) pat)
    ?+  suf             [auth %page]
      [sig %edit ~]     [& %edit-page]
      [sig %history ~]  [auth %history]
    ==
  --
::
--