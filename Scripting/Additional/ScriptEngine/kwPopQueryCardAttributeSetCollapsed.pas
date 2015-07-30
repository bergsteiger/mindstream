unit kwPopQueryCardAttributeSetCollapsed;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopQueryCardAttributeSetCollapsed.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::QueryCardProcessing::pop_QueryCard_Attribute_SetCollapsed
//
// Управляет свойством Collapsed той ГРУППЫ к которой принадлежит данный атрибут
// 
// Пример:
// {code}
// 'AT_TEXT_NAME' true Search:SetAttributeCollapsed
// {code}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  nevBase,
  evQueryCardInt,
  evQueryCardEditor,
  tfwScriptingInterfaces,
  kwQueryCardFromStackWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopQueryCardAttributeSetCollapsed = {final scriptword} class(TkwQueryCardFromStackWord)
  {* Управляет свойством Collapsed той ГРУППЫ к которой принадлежит данный атрибут

Пример:
[code]
'AT_TEXT_NAME' true Search:SetAttributeCollapsed
[code] }
 private
 // private methods
   procedure DoModelImpl(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor);
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopQueryCardAttributeSetCollapsed
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Base,
  evReqIterator
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopQueryCardAttributeSetCollapsed

procedure TkwPopQueryCardAttributeSetCollapsed.DoModelImpl(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
var
 l_Op : InevOp;
 l_Name : Il3CString;
 l_Value : Boolean;

 procedure CallIterator;

  function DoIt(const anItem: IevReq): Boolean;
  //#UC START# *07D78AC0F47E__var*
  //#UC END# *07D78AC0F47E__var*
  begin
  //#UC START# *07D78AC0F47E__impl*
   if l3Same(l_Name, anItem.ReqName) then
   begin
    Result := false;
    anItem.Group.Expanded := not l_Value;
    Exit;
   end//l3Same(l_Name, anItem.ReqName)
   else
    Result := true;
  //#UC END# *07D78AC0F47E__impl*
  end;//DoIt

 //#UC START# *4F6996830081__var*
 //#UC END# *4F6996830081__var*
 begin
  //#UC START# *4F6996830081iter*
  TevReqIterator.Make(aCard).
  //#UC END# *4F6996830081iter*
   DoReqF(L2IevReqIteratorDoReqAction(@DoIt));
 end;//CallIterator

//#UC START# *4F6995F7028A_4F69959502BB_var*
//#UC END# *4F6995F7028A_4F69959502BB_var*
begin
//#UC START# *4F6995F7028A_4F69959502BB_impl*
 l_Value := aCtx.rEngine.PopBool;
 l_Name := aCtx.rEngine.PopString;
 l_Op := aCard.StartOp;
 try
  CallIterator;
 finally
  l_Op := nil;
 end;//try..finally
//#UC END# *4F6995F7028A_4F69959502BB_impl*
end;//TkwPopQueryCardAttributeSetCollapsed.DoModelImpl

procedure TkwPopQueryCardAttributeSetCollapsed.DoCard(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
//#UC START# *4E808E8B01BB_4F69959502BB_var*
//#UC END# *4E808E8B01BB_4F69959502BB_var*
begin
//#UC START# *4E808E8B01BB_4F69959502BB_impl*
 DoModelImpl(aCtx, aCard);
//#UC END# *4E808E8B01BB_4F69959502BB_impl*
end;//TkwPopQueryCardAttributeSetCollapsed.DoCard

class function TkwPopQueryCardAttributeSetCollapsed.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:QueryCard:Attribute:SetCollapsed';
end;//TkwPopQueryCardAttributeSetCollapsed.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_QueryCard_Attribute_SetCollapsed
 TkwPopQueryCardAttributeSetCollapsed.RegisterInEngine;
{$IfEnd} //not NoScripts

end.