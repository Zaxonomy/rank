|%
::
:::: Basic Application Data Structures
  ::
::
:::: An UrbID (`uid`) is a [@p @ta] tuple containing a Ship name and a unique string.
  :: This is what we use to tag all our distributed structures so that they
  ::   can be properly sourced and synced.
  :: It needs to be a @ta not a tape because it will appear in scry paths.
  ::
+$  uid
  $:  sh=@p
      uu=@ta
  ==
::
:::: A Timestamp (`tsp`) is a [time u(time) u(time) @u] containing three times representing
  ::   the CReation, Last UPdate, and DEletion times and the RIft (or continuity number,
  ::   it is a count of the number of times that a value has changed) for an Entity.
  ::
  ::   NOTE: this is not called `time` to avoid conflicting with the urbit stdlib.
  ::   NOTE: An immutable will always have up=~ and ri=0.
  ::
+$  tsp
 $:  cr=time
     up=(unit time)
     de=(unit time)
     ri=@u
  ==
::
:::: An Category (`ctg`) is a tuple of [Limit Adjective Subject Period].
  :: The 10 Best Novels of The Twentieth Century
  ::
::
+$  ctg
  $:  id=uid
      li=@ud
      ad=tape
      su=tape
      pe=tape
      ts=tsp
  ==
::
:::: A Subject (`sbj`) is a [Title, Artist] tuple
  :: It is what we are Ranking.
  ::
+$  sbj
  $:  id=uid
      ti=tape
      ar=tape
      ts=tsp
  ==
::
::
:::: A Ranking ('rkg') is a an List (Ordered Set?) of {Subject}s for a {Category}.
  ::
+$  rkg
  $:  ca=ctg
      ra=(list sbj)
  ==
::
+$  test-data
  $:  ca=(unit ctg)
      ra=(unit rkg)
      su=(unit sbj)
      sl=(unit (list sbj))
  ==
::
:::: Display State (mast)
  ::
+$  app            [color-one=tape color-two=tape letters=(list [l=@t id=@ud])]
+$  display        $~([[%html ~] [[%head ~] ~] [[%body ~] ~] ~] manx)
+$  display-state  [=app =display current-url=path]
::
:::: Stored App State
  ::
+$  state-0
  $:  %0
      display-state
      categories=(list ctg)
      pals=(list @p)
      rankings=(list rkg)
      subjects=(list sbj)
  ==
::
+$  versioned-state
  $%  state-0
  ==
::
:::: Application Mark Structures
  ::
+$  action
  $%
    [%add-category limit=@ud adjective=tape subject=tape period=tape]
    [%remove-category key=@ta]
    :: :-  %remove-category
    ::   $=  key  tape
    [%add-subject title=tape artist=tape]
    [%remove-subject key=@ta]
::
:::: THE FOLLOWING ARE FOR TESTING/DEBUG ONLY.
  ::
    [%purge-category key=@ta]
  ==
--