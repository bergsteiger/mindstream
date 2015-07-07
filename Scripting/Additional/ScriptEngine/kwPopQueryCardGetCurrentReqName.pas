unit kwPopQueryCardGetCurrentReqName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopQueryCardGetCurrentReqName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::QueryCardProcessing::pop_QueryCard_GetCurrentReqName
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
  evQueryCardEditor,
  tfwScriptingInterfaces,
  evCustomEditorWindow,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}
 TkwPopQueryCardGetCurrentReqName = {final} class(_kwQueryCardFromStackWord_)
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopQueryCardGetCurrentReqName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evQueryCardInt,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopQueryCardGetCurrentReqName;

{$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.