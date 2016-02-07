{$IfDef _Unknown_NoImpl}
procedure ClearFields;
  virtual;
  {-}
procedure Cleanup;
  virtual;
  {-}
procedure AfterDestroyCalled;
  virtual;
  {-}
procedure Release;
  virtual;
  {-}
procedure InitFields;
  virtual;
  {-}
public
procedure AfterConstruction;
  override;
  {-}
destructor Destroy;
  override;
  {-}
{$Else  _Unknown_NoImpl}
procedure Cleanup;
  override;
  {-}
{$EndIf _Unknown_NoImpl}
