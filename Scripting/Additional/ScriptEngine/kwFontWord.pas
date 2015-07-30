unit kwFontWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::TkwFontWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  Graphics,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwFontWord = {abstract} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); virtual; abstract;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwFontWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFontWord

procedure TkwFontWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5190B0AF007C_var*
var
 l_Unknown: IUnknown;
 l_IFont: Il3Font;
 l_Obj: TObject;
//#UC END# *4DAEEDE10285_5190B0AF007C_var*
begin
//#UC START# *4DAEEDE10285_5190B0AF007C_impl*
 if aCtx.rEngine.IsTopIntf then
 begin
  l_Unknown := aCtx.rEngine.PopIntf;
  Supports(l_Unknown, Il3Font, l_IFont);
  RunnerAssert(Assigned(l_IFont), 'Не передан интерфейс Il3Font', aCtx);
  DoIFont(l_IFont, aCtx);
 end else
 if aCtx.rEngine.IsTopObj then
 begin
  l_Obj := aCtx.rEngine.PopObj;
  RunnerAssert(l_Obj is TFont, 'Не передан объект TFont', aCtx);
  DoFont(l_Obj as TFont, aCtx);
 end else
  RunnerError('Не передан TFont или Il3Font', aCtx);
//#UC END# *4DAEEDE10285_5190B0AF007C_impl*
end;//TkwFontWord.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwFontWord
 TkwFontWord.RegisterClass;
{$IfEnd} //not NoScripts

end.