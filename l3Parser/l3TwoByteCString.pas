unit l3TwoByteCString;

{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3CProtoObject
  ;

type
 Tl3TwoByteCString = class(Tl3CProtoObject, Il3CString)
 private
 // private fields
   f_Chars : Word;
 protected
 // realized methods
   function pm_GetAsWStr: Tl3WString;
 public
 // public methods
   constructor Create(aChars: Word); reintroduce;
   class function Make(aChars: Word): Il3CString; reintroduce;
     {* Сигнатура фабрики Tl3TwoByteCString.Make }
 end;//Tl3TwoByteCString

implementation

uses
  l3String,
  l3Chars
  {$If not defined(NoScripts)}
  ,
  tfwIl3CStringPack
  {$IfEnd} //not NoScripts
  
  ;

// start class Tl3TwoByteCString

constructor Tl3TwoByteCString.Create(aChars: Word);
//#UC START# *4F5CBCAF00B4_4F5CBBE60070_var*
//#UC END# *4F5CBCAF00B4_4F5CBBE60070_var*
begin
//#UC START# *4F5CBCAF00B4_4F5CBBE60070_impl*
 inherited Create;
 f_Chars := aChars;
//#UC END# *4F5CBCAF00B4_4F5CBBE60070_impl*
end;//Tl3TwoByteCString.Create

class function Tl3TwoByteCString.Make(aChars: Word): Il3CString;
var
 l_Inst : Tl3TwoByteCString;
begin
 l_Inst := Create(aChars);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3TwoByteCString.pm_GetAsWStr: Tl3WString;
//#UC START# *46780DEF03E5_4F5CBBE60070get_var*
//#UC END# *46780DEF03E5_4F5CBBE60070get_var*
begin
//#UC START# *46780DEF03E5_4F5CBBE60070get_impl*
 Result.S := @f_Chars;
 Result.SLen := 2;
 Result.SCodePage := CP_ANSI;
//#UC END# *46780DEF03E5_4F5CBBE60070get_impl*
end;//Tl3TwoByteCString.pm_GetAsWStr

end.