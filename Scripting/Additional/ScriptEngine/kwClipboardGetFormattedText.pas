unit kwClipboardGetFormattedText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwClipboardGetFormattedText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::clipboard_GetFormattedText
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwSysUtilsWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwClipboardGetFormattedText = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwClipboardGetFormattedText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Clipbrd,
  l3Utils,
  Windows,
  SysUtils,
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwClipboardGetFormattedText

procedure TkwClipboardGetFormattedText.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_500D1B2102D0_var*
var
 l_Format: Cardinal;
 l_ClipbrdHandle: THandle;
 l_String: PChar;
//#UC END# *4DAEEDE10285_500D1B2102D0_var*
begin
//#UC START# *4DAEEDE10285_500D1B2102D0_impl*
 if aCtx.rEngine.IsTopInt then
  l_Format := Cardinal(aCtx.rEngine.PopInt)
 else
  l_Format := Cardinal(l3GetClipboardByFormatName(aCtx.rEngine.PopDelphiString));

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
// Регистрация clipboard_GetFormattedText
 TkwClipboardGetFormattedText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.