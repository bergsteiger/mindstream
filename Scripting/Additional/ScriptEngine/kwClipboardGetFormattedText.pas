unit kwClipboardGetFormattedText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwClipboardGetFormattedText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::clipboard_GetFormattedText
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
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
 TkwClipboardGetFormattedText = {final} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwClipboardGetFormattedText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes,
  Clipbrd,
  l3Utils,
  Windows,
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwClipboardGetFormattedText;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

// start class TkwClipboardGetFormattedText

procedure TkwClipboardGetFormattedText.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_500D1B2102D0_var*
var
 l_Format: TevFormat;
 l_ClipbrdHandle: THandle;
 l_String: PChar;
//#UC END# *4DAEEDE10285_500D1B2102D0_var*
begin
//#UC START# *4DAEEDE10285_500D1B2102D0_impl*
 if aCtx.rEngine.IsTopInt
  then l_Format := aCtx.rEngine.PopInt
  else l_Format := l3GetClipboardByFormatName(aCtx.rEngine.PopDelphiString);

 if Clipboard.HasFormat(l_Format) then
 begin
  l_ClipbrdHandle := Clipboard.GetAsHandle(l_Format);
  l_String := GlobalLock(l_ClipbrdHandle);
  try
   //aCtx.rEngine.PushString( StrPas(l_String));
   aCtx.rEngine.PushString(TtfwCStringFactory.C(l3PCharLen(l_String, GlobalSize(l_ClipbrdHandle))));
  finally
   GlobalUnLock(l_ClipbrdHandle);
  end;
 end else
  // plain text                                    
  aCtx.rEngine.PushString(Clipboard.AsText);
//#UC END# *4DAEEDE10285_500D1B2102D0_impl*
end;//TkwClipboardGetFormattedText.DoDoIt

class function TkwClipboardGetFormattedText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'clipboard:GetFormattedText';
end;//TkwClipboardGetFormattedText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.