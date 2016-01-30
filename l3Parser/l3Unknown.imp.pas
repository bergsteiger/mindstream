{$IfNDef l3Unknown}

{$Define l3Unknown}

 _l3UnknownPrim_Parent_ = _l3Unknown_Parent_;
 {$Include l3UnknownPrim.imp.pas}
   {$IfDef _Final_}
   _l3Unknown_ = class(_l3UnknownPrim_)
    {* В этом классе собираем методы, которые запрещено перекрывать и вызывать напрямую. }
     public
     // public methods
       class function NewInstance: TObject;
         reintroduce;
         {-}
       procedure FreeInstance;
         reintroduce;
         {-}
       procedure AfterConstruction;
         reintroduce;
         {-}
       procedure BeforeDestruction;
         reintroduce;
         {-}
       destructor Destroy;
         reintroduce;
         {-}
   end;//_l3Unknown_
   {$Else  _Final_}
   _l3Unknown_ = _l3UnknownPrim_;
   {$EndIf _Final_}

{$Else  l3Unknown}

{$Include l3UnknownPrim.imp.pas}

{$IfNDef _Unknown_NoImpl}
{$IfDef _Final_}
// start class _l3Unknown_

class function _l3Unknown_.NewInstance: TObject;
  {-}
begin
 Result := nil;
 Assert(false);
end;

procedure _l3Unknown_.FreeInstance;
  {-}
begin
 Assert(false);
end;

procedure _l3Unknown_.AfterConstruction;
  {-}
begin
 Assert(false);
end;

procedure _l3Unknown_.BeforeDestruction;
  {-}
begin
 Assert(false);
end;

destructor _l3Unknown_.Destroy;
  //reintroduce;
  {-}
begin
 Assert(false, 'Нельзя напрямую вызывать Destroy');
end;
{$EndIf _Final_}

{$EndIf _Unknown_NoImpl}
{$EndIf l3Unknown}
