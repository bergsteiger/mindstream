unit kwEmitString;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEmitString.pas"
// Начат: 22.04.2011 19:32
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::EmitString
//
// Позволяет ввести строку.
// Пример:
// {code}
// : "Ввести строку" STRING IN aString
// aString emitstring
// ;
// {code}
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwEmitString = class(_tfwAutoregisteringWord_)
  {* Позволяет ввести строку.
Пример:
[code]
: "Ввести строку" STRING IN aString
 aString emitstring
;
[code] }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEmitString
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  Windows,
  Messages,
  l3Chars,
  l3Interfaces,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwEmitString;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwEmitString

procedure TkwEmitString.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB19F7802E3_var*
var
 l_Index : Integer;
(* l_Scan  : Integer;*)
 l_C     : Integer;
 l_H     : THandle;
 l_S     : Il3CString;
//#UC END# *4DAEEDE10285_4DB19F7802E3_var*
begin
//#UC START# *4DAEEDE10285_4DB19F7802E3_impl*
 l_S := aCtx.rEngine.PopString;
 try
  with l3PCharLen(l_S) do
  begin
   if not l3IsANSI(SCodePage) then
    RunnerAssert(false, 'Странная кодировка строки', aCtx);
   l_H := GetFocus;
   for l_Index := 0 to Pred(SLen) do
   begin
    l_C := ORD(S[l_Index]);
    if (GetFocus <> l_H) then
     SetFocus(l_H);
    SendMessage(l_H, WM_CHAR, l_C, 0);
 (*   l_Scan := MapVirtualKey(l_C, 0);
    keybd_event(l_C, l_Scan, 0, 0); { Key down }
    keybd_event(l_C, l_Scan, KEYEVENTF_KEYUP, 0);*)
   end;//for l_Index
  end;//with l3PCharLen(aCtx.rEngine.PopString)
 finally
  l_S := nil;
 end;//try..finally
//#UC END# *4DAEEDE10285_4DB19F7802E3_impl*
end;//TkwEmitString.DoDoIt

class function TkwEmitString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'emitstring';
end;//TkwEmitString.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.