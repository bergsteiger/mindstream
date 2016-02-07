unit l3ConstStrings;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ConstStrings1
  ;

type
 Tl3ConstStrings = class(Tl3ConstStrings1)
 public
 // public methods
   class function Exists: Boolean;
 public
 // singleton factory method
   class function Instance: Tl3ConstStrings;
    {- возвращает экземпляр синглетона. }
 end;//Tl3ConstStrings

var
   g_l3ConstStringsSealed : Boolean = false;

implementation

uses
  l3Base {a}
  ;


// start class Tl3ConstStrings

var g_Tl3ConstStrings : Tl3ConstStrings = nil;

procedure Tl3ConstStringsFree;
begin
 l3Free(g_Tl3ConstStrings);
end;

class function Tl3ConstStrings.Instance: Tl3ConstStrings;
begin
 if (g_Tl3ConstStrings = nil) then
 begin
  l3System.AddExitProc(Tl3ConstStringsFree);
  g_Tl3ConstStrings := Create;
 end;
 Result := g_Tl3ConstStrings;
end;


class function Tl3ConstStrings.Exists: Boolean;
//#UC START# *4BA227540063_4BA2214002EE_var*
//#UC END# *4BA227540063_4BA2214002EE_var*
begin
//#UC START# *4BA227540063_4BA2214002EE_impl*
 Result := (g_Tl3ConstStrings <> nil);
//#UC END# *4BA227540063_4BA2214002EE_impl*
end;//Tl3ConstStrings.Exists

end.