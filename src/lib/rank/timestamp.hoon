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
    [cr=now.bowl de=~]
::
:::: upd
  ::
  :: Update a Timestamp
  ::
  ++  upd
    |=  t=tsp:rank
    ^-  tsp:rank
    [cr=cr.t de=~]
::
:::: del
  :: "Delete" a Timestamp
  ::
  ++  del
    |=  t=tsp:rank
    ^-  tsp:rank
    [cr=cr.t de=(some now.bowl)]
  --
--