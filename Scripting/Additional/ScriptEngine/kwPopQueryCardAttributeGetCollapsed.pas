unit kwPopQueryCardAttributeGetCollapsed;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopQueryCardAttributeGetCollapsed.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::QueryCardProcessing::pop_QueryCard_Attribute_GetCollapsed
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
 TkwPopQueryCardAttributeGetCollapsed = {final scriptword} class(TkwQueryCardFromStackWord)
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 protected
 // overridden protected methods
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
  nevBase
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация pop_QueryCard_Attribute_GetCollapsed
 TkwPopQueryCardAttributeGetCollapsed.RegisterInEngine;
{$IfEnd} //not NoScripts

end.