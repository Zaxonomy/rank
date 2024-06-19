::
:::: a Door for working with Categories
  ::
/-  *rank
/-  *rank-category
::
:::: Lib Dependencies
  ::
/+  *rank-timestamp
/+  *rank-urbid
/+  *string
::
|%
++  category
  ::
  :::: Needs a bowl as its sample
    ::
  |_  bowl=bowl:gall
  ::
  :::: Answers a newly Constructed Category
    ::
  ++  new
    |=  [limit=@ud adjective=tape subject=tape period=tape]
    ^-  cate
    =/  uid  ~(new urbid bowl)
    =/  tsp  ~(new timestamp bowl)
    [id=uid li=limit ad=adjective su=subject pe=period ts=tsp]
  ::
  :::: Logically (soft) delete a Category.
    ::   We can't hard delete because someone might still be referencing it.
    ::
  ++  del
    |=  c=cate
    ^-  cate
    =.  ts.c  (~(del timestamp bowl) ts.c)
    c
  ::
  :::: Answers the Category's Limit.
    ::
  ++  get-limit
    |=  c=cate
    ^-  @ud
    li.c
  ::
  :::: Answers the Category's Timestamp structure.
    ::
  ++  get-timestamp
    |=  c=cate
    ^-  tsp:rank
    ts.c
::
:::: get-uid
  ::
  :: Answers the Category's unique identifier
  ::
  ++  get-urbid
    |=  c=cate
    ^-  uid:rank
    id.c
::
:::: Represent a Category as a cord.
  ::
  ++  to-cord
    |=  c=cate
    ^-  @t
    (crip (to-tape c))
::
:::: Represent a Category as a tape.
  ::
  ++  to-tape
    |=  c=cate
    ^-  tape
    (link " " (limo ["The" ~(rud at li.c) ad.c su.c "of" pe.c ~]))
  --
--