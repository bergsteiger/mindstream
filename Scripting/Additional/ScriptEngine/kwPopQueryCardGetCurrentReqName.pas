unit kwPopQueryCardGetCurrentReqName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopQueryCardGetCurrentReqName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::QueryCardProcessing::pop_QueryCard_GetCurrentReqName
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
 TkwPopQueryCardGetCurrentReqName = {final scriptword} class(TkwQueryCardFromStackWord)
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopQueryCardGetCurrentReqName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evQueryCardInt
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopQueryCardGetCurrentReqName

procedure TkwPopQueryCardGetCurrentReqName.DoCard(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
//#UC START# *4E808E8B01BB_4FDB10E9009A_var*
var
 l_Control: IevEditorControl;
//#UC END# *4E808E8B01BB_4FDB10E9009A_var*
begin
//#UC START# *4E808E8B01BB_4FDB10E9009A_impl*
 if aCard.Selection.Cursor.MostInner.Obj^.AsObject.QT(IevEditorControl, l_Control) then
  aCtx.rEngine.PushString(l_Control.Req.ReqName)
 else
  Assert(False, 'Ошибка при получении интерфейса поля редактора!');
//#UC END# *4E808E8B01BB_4FDB10E9009A_impl*
end;//TkwPopQueryCardGetCurrentReqName.DoCard

class function TkwPopQueryCardGetCurrentReqName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:QueryCard:GetCurrentReqName';
end;//TkwPopQueryCardGetCurrentReqName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_QueryCard_GetCurrentReqName
 TkwPopQueryCardGetCurrentReqName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.