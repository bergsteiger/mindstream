unit l3GraphicContainerStack;

 
{$Include l3Define.inc}

interface

uses
  l3ObjectList
  ;

type
 Tl3GraphicContainerStack = class(Tl3ObjectList)
 public
 // public methods
   class function Exists: Boolean;
 public
 // singleton factory method
   class function Instance: Tl3GraphicContainerStack;
    {- возвращает экземпляр синглетона. }
 end;//Tl3GraphicContainerStack

implementation

uses
  l3Base {a}
  ;


// start class Tl3GraphicContainerStack

var g_Tl3GraphicContainerStack : Tl3GraphicContainerStack = nil;

procedure Tl3GraphicContainerStackFree;
begin
 l3Free(g_Tl3GraphicContainerStack);
end;

class function Tl3GraphicContainerStack.Instance: Tl3GraphicContainerStack;
begin
 if (g_Tl3GraphicContainerStack = nil) then
 begin
  l3System.AddExitProc(Tl3GraphicContainerStackFree);
  g_Tl3GraphicContainerStack := Create;
 end;
 Result := g_Tl3GraphicContainerStack;
end;


class function Tl3GraphicContainerStack.Exists: Boolean;
//#UC START# *4DD3CE6A00B7_4DD3CD0B0193_var*
//#UC END# *4DD3CE6A00B7_4DD3CD0B0193_var*
begin
//#UC START# *4DD3CE6A00B7_4DD3CD0B0193_impl*
 Result := (g_Tl3GraphicContainerStack <> nil);
//#UC END# *4DD3CE6A00B7_4DD3CD0B0193_impl*
end;//Tl3GraphicContainerStack.Exists

end.