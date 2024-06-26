::
:::: Door for working with UrbIDs
  ::
/-  rank
/+  *string
::
|%
++  timestamp
::
  :::: Needs a bowl as its sample
    ::
  |_  bowl=bowl:gall
::
:::: new
  ::
  :: Create a new Timestamp
  ::
  ++  new
    ^-  tsp:rank
    [cr=now.bowl up=~ de=~ ri=0]
::
:::: upd
  ::
  :: Update a Timestamp
  ::
  ++  upd
    |=  t=tsp:rank
    ^-  tsp:rank
    [cr=cr.t up=[~ now.bowl] de=~ ri=(add ri.t 1)]
::
:::: del
  :: "Delete" a Timestamp
  ::
  ++  del
    |=  t=tsp:rank
    ^-  tsp:rank
    [cr=cr.t up=up.t de=(some now.bowl) ri=(add ri.t 1)]
  --
--