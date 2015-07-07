{$IfNDef kwFontWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFontWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::FontKeywords::kwFontWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwFontWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwFontWord_ = {mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); virtual; abstract;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwFontWord_
{$IfEnd} //not NoScripts

{$Else kwFontWord_imp}

{$IfNDef kwFontWord_imp_impl}
{$Define kwFontWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwFontWord_

procedure _kwFontWord_.DoDoIt(const aCtx: TtfwContext);
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
  RunnerAssert(False, 'Не передан TFont или Il3Font', aCtx);
//#UC END# *4DAEEDE10285_5190B0AF007C_impl*
end;//_kwFontWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  kwFontWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwFontWord_imp_impl}
{$EndIf kwFontWord_imp}
