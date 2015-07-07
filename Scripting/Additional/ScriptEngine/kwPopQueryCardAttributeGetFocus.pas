unit kwPopQueryCardAttributeGetFocus;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopQueryCardAttributeGetFocus.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::QueryCardProcessing::pop_QueryCard_Attribute_GetFocus
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
 TkwPopQueryCardAttributeGetFocus = {final} class(_kwQueryCardFromStackWord_)
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopQueryCardAttributeGetFocus
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  evQueryCardInt,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopQueryCardAttributeGetFocus;

{$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}

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
  RunnerAssert(False, 'Текущее поле не найдено', aCtx);
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
 {$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.