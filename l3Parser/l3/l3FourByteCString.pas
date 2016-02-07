unit l3FourByteCString;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3CProtoObject
  ;

type
 Tl3FourByteCString = class(Tl3CProtoObject, Il3CString)
 private
 // private fields
   f_Chars : Integer;
 protected
 // realized methods
   function pm_GetAsWStr: Tl3WString;
 public
 // public methods
   constructor Create(aChars: Integer); reintroduce;
   class function Make(aChars: Integer): Il3CString; reintroduce;
     {* Сигнатура фабрики Tl3FourByteCString.Make }
 end;//Tl3FourByteCString

implementation

uses
  l3String,
  l3Chars
  {$If not defined(NoScripts)}
  ,
  tfwIl3CStringPack
  {$IfEnd} //not NoScripts
  
  ;

// start class Tl3FourByteCString

constructor Tl3FourByteCString.Create(aChars: Integer);
//#UC START# *4F5D87B300C6_4F5D87440315_var*
//#UC END# *4F5D87B300C6_4F5D87440315_var*
begin
//#UC START# *4F5D87B300C6_4F5D87440315_impl*
 inherited Create;
 f_Chars := aChars;
//#UC END# *4F5D87B300C6_4F5D87440315_impl*
end;//Tl3FourByteCString.Create

class function Tl3FourByteCString.Make(aChars: Integer): Il3CString;
var
 l_Inst : Tl3FourByteCString;
begin
 l_Inst := Create(aChars);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3FourByteCString.pm_GetAsWStr: Tl3WString;
//#UC START# *46780DEF03E5_4F5D87440315get_var*
//#UC END# *46780DEF03E5_4F5D87440315get_var*
begin
//#UC START# *46780DEF03E5_4F5D87440315get_impl*
 Result.S := @f_Chars;
 Result.SLen := 4;
 Result.SCodePage := CP_ANSI;
//#UC END# *46780DEF03E5_4F5D87440315get_impl*
end;//Tl3FourByteCString.pm_GetAsWStr

end.