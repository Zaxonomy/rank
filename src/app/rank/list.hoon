/-  rank
/-  *rank-state
::
|=  app-state=app.display-state
^-  manx
;html
  ;head
    ;meta(charset "utf-8");
    ;link(href "/rank/css", rel "stylesheet");
  ==
  ;body
    ;main
      ;p: Second Page
      ;div.container
        ;*  %+  turn  color-two.app-state
          |=  t=@t
          ^-  manx
          ;div.smallcircle
            ;+  ;/  (trip t)
          ==
      ==
      ;div.container
        ;div
          =class  (weld "square " color-two.app-state)
          =event  "/click/square-two"
          ;+  ;/  color-two.app-state
        ==
        ;div
          =class  (weld "square " color-one.app-state)
          =event  "/click/square-one"
          ;+  ;/  color-one.app-state
        ==
        ;button(event "/click/navigate-to-index"): Return
      ==
    ==
  ==
==