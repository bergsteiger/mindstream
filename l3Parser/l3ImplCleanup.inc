{$IfDef _Unknown_NoImpl}
procedure _Unknown_Child_.AfterDestroyCalled;
  //virtual;
  {-}
begin
end;

procedure _Unknown_Child_.AfterConstruction;
  //override;
  {-}
begin
 inherited;
 InitFields;
end;

destructor _Unknown_Child_.Destroy;
  //override;
begin
 Release;
 inherited;
 AfterDestroyCalled;
end;

procedure _Unknown_Child_.Release;
  //virtual;
  {-}
begin
 Cleanup;
 ClearFields;
end;

procedure _Unknown_Child_.ClearFields;
  //virtual;
  {-}
begin
end;

procedure _Unknown_Child_.InitFields;
  //virtual;
  {-}
begin
end;
  
{$EndIf _Unknown_NoImpl}
procedure _Unknown_Child_.Cleanup;
  //virtual;
  {-}

