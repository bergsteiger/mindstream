unit l3IEBitmapContainerStack;


{$Include l3Define.inc}

interface

uses
  l3ObjectList
  ;

type
 Tl3IEBitmapContainerStack = class(Tl3ObjectList)
 public
 // public methods
   class function Exists: Boolean;
 public
 // singleton factory method
   class function Instance: Tl3IEBitmapContainerStack;
    {- возвращает экземпляр синглетона. }
 end;//Tl3IEBitmapContainerStack

implementation

uses
  l3Base {a}
  ;


// start class Tl3IEBitmapContainerStack

var g_Tl3IEBitmapContainerStack : Tl3IEBitmapContainerStack = nil;

procedure Tl3IEBitmapContainerStackFree;
begin
 l3Free(g_Tl3IEBitmapContainerStack);
end;

class function Tl3IEBitmapContainerStack.Instance: Tl3IEBitmapContainerStack;
begin
 if (g_Tl3IEBitmapContainerStack = nil) then
 begin
  l3System.AddExitProc(Tl3IEBitmapContainerStackFree);
  g_Tl3IEBitmapContainerStack := Create;
 end;
 Result := g_Tl3IEBitmapContainerStack;
end;


class function Tl3IEBitmapContainerStack.Exists: Boolean;
//#UC START# *4DD3D0BB03BD_4DD3D054004A_var*
//#UC END# *4DD3D0BB03BD_4DD3D054004A_var*
begin
//#UC START# *4DD3D0BB03BD_4DD3D054004A_impl*
 Result := (g_Tl3IEBitmapContainerStack <> nil);
//#UC END# *4DD3D0BB03BD_4DD3D054004A_impl*
end;//Tl3IEBitmapContainerStack.Exists

end.