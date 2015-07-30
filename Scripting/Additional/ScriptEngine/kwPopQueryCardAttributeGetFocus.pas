unit kwPopQueryCardAttributeGetFocus;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopQueryCardAttributeGetFocus.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::QueryCardProcessing::pop_QueryCard_Attribute_GetFocus
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwQueryCardFromStackWord,
  evQueryCardEditor,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopQueryCardAttributeGetFocus = {final scriptword} class(TkwQueryCardFromStackWord)
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopQueryCardAttributeGetFocus
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  evQueryCardInt
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopQueryCardAttributeGetFocus

procedure TkwPopQueryCardAttributeGetFocus.DoCard(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
//#UC START# *4E808E8B01BB_4FEF234F01FB_var*
var
 l_Control: IevCustomEditorControl;
 l_C: IevEditorControl;
//#UC END# *4E808E8B01BB_4FEF234F01FB_var*
begin
//#UC START# *4E808E8B01BB_4FEF234F01FB_impl*
 l_Control := aCard.GetControl;
 if Supports(l_Control, IevEditorControl, l_C) then
  aCtx.rEngine.PushString(l_C.Req.ReqName)
 else
  RunnerError('Текущее поле не найдено', aCtx);
//#UC END# *4E808E8B01BB_4FEF234F01FB_impl*
end;//TkwPopQueryCardAttributeGetFocus.DoCard

class function TkwPopQueryCardAttributeGetFocus.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:QueryCard:Attribute:GetFocus';
end;//TkwPopQueryCardAttributeGetFocus.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_QueryCard_Attribute_GetFocus
 TkwPopQueryCardAttributeGetFocus.RegisterInEngine;
{$IfEnd} //not NoScripts

end.