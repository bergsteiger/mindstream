unit afwAString;
 
{$Include ..\AFW\afwDefine.inc}

interface

uses
  l3Interfaces,
  l3ProtoObject
  ;

type
 TafwAString = class(Tl3ProtoObject, Il3AString)
 private
 // private fields
   f_String : Il3CString;
   f_Tmp : AnsiString;
 protected
 // realized methods
   function S: PAnsiChar;
     {* —обственно строка. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
   procedure ClearFields; override;
     {* —игнатура метода ClearFields }
 public
 // public methods
   constructor Create(const aString: Il3CString); reintroduce;
   class function Make(const aString: Il3CString): Il3AString; reintroduce;
     {* —игнатура фабрики TafwAString.Make }
 end;//TafwAString

implementation

uses
  l3String,
  l3Chars
  ;

// start class TafwAString

constructor TafwAString.Create(const aString: Il3CString);
//#UC START# *4F6C7A060311_4F6C79B10165_var*
//#UC END# *4F6C7A060311_4F6C79B10165_var*
begin
//#UC START# *4F6C7A060311_4F6C79B10165_impl*
 inherited Create;
 f_String := aString;
//#UC END# *4F6C7A060311_4F6C79B10165_impl*
end;//TafwAString.Create

class function TafwAString.Make(const aString: Il3CString): Il3AString;
var
 l_Inst : TafwAString;
begin
 l_Inst := Create(aString);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TafwAString.S: PAnsiChar;
//#UC START# *46A45D0A02A1_4F6C79B10165_var*
var
 l_S : Tl3WString;
//#UC END# *46A45D0A02A1_4F6C79B10165_var*
begin
//#UC START# *46A45D0A02A1_4F6C79B10165_impl*
 if (f_String = nil) then
  Result := ''
 else
 begin
  l_S := f_String.AsWStr;
  if (l_S.SCodePage = CP_ANSI) then
  begin
   Result := l_S.S;
   if (Result <> nil) AND (Result[l_S.SLen] <> #0) then
   begin
    f_Tmp := l3Str(l_S);
    Result := PAnsiChar(f_Tmp);
   end;//l_S.SLen >= l3StrLen(Result)
  end//f_String.SCodePage = CP_ANSI
  else
  begin
   f_Tmp := l3Str(l_S);
   Result := PAnsiChar(f_Tmp);
  end;//f_String.SCodePage = CP_ANSI
 end;//f_String = nil
//#UC END# *46A45D0A02A1_4F6C79B10165_impl*
end;//TafwAString.S

{$If not defined(DesignTimeLibrary)}
class function TafwAString.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4F6C79B10165_var*
//#UC END# *47A6FEE600FC_4F6C79B10165_var*
begin
//#UC START# *47A6FEE600FC_4F6C79B10165_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4F6C79B10165_impl*
end;//TafwAString.IsCacheable
{$IfEnd} //not DesignTimeLibrary

procedure TafwAString.ClearFields;
 {-}
begin
 f_String := nil;
 inherited;
end;//TafwAString.ClearFields

end.