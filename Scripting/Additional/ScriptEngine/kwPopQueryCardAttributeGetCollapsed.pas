unit kwPopQueryCardAttributeGetCollapsed;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopQueryCardAttributeGetCollapsed.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::QueryCardProcessing::pop_QueryCard_Attribute_GetCollapsed
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
 TkwPopQueryCardAttributeGetCollapsed = {final} class(_kwQueryCardFromStackWord_)
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopQueryCardAttributeGetCollapsed
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  evQueryCardInt,
  l3String,
  evReqIterator,
  nevBase,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopQueryCardAttributeGetCollapsed;

{$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}

// start class TkwPopQueryCardAttributeGetCollapsed

procedure TkwPopQueryCardAttributeGetCollapsed.DoCard(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
//#UC START# *4E808E8B01BB_4FEF23900010_var*
var
 l_Op: InevOp;
 l_Name: Il3CString;
 l_Value: Boolean;
 l_Found: Boolean;

 procedure CallIterator;

  function DoIt(const anItem: IevReq): Boolean;
  begin
   if l3Same(l_Name, anItem.ReqName) then
   begin
    Result := False;
    l_Found := True;
    aCtx.rEngine.PushBool(anItem.Group.Expanded);
    Exit;
   end//l3Same(l_Name, anItem.ReqName)
   else
    Result := True;
  end;//DoIt

 begin
  TevReqIterator.Make(aCard).DoReqF(L2IevReqIteratorDoReqAction(@DoIt));
 end;//CallIterator
//#UC END# *4E808E8B01BB_4FEF23900010_var*
begin
//#UC START# *4E808E8B01BB_4FEF23900010_impl*
 l_Name := aCtx.rEngine.PopString;
 l_Found := False;
 l_Op := aCard.StartOp;
 try
  CallIterator;
 finally
  l_Op := nil;
 end;//try..finally
 RunnerAssert(l_Found, 'Поле не найдено', aCtx);
//#UC END# *4E808E8B01BB_4FEF23900010_impl*
end;//TkwPopQueryCardAttributeGetCollapsed.DoCard

class function TkwPopQueryCardAttributeGetCollapsed.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:QueryCard:Attribute:GetCollapsed';
end;//TkwPopQueryCardAttributeGetCollapsed.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.