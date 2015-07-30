unit kwPopQueryCardAttributeSetFocus;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopQueryCardAttributeSetFocus.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::QueryCardProcessing::pop_QueryCard_Attribute_SetFocus
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
 TkwPopQueryCardAttributeSetFocus = {final scriptword} class(TkwQueryCardFromStackWord)
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
 end;//TkwPopQueryCardAttributeSetFocus
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

// start class TkwPopQueryCardAttributeSetFocus

procedure TkwPopQueryCardAttributeSetFocus.DoModelImpl(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
var
 l_Name : Il3CString;
 l_Op : InevOp;

 procedure CallIterator;

  function DoIt(const anItem: IevReq): Boolean;
  //#UC START# *68801C8A78FF__var*
  var
   l_F : IevEditorControlField;
  //#UC END# *68801C8A78FF__var*
  begin
  //#UC START# *68801C8A78FF__impl*
   if l3Same(l_Name, anItem.ReqName) then
   begin
    Result := false;
    l_F := anItem.FirstField;
    l_F.SetFocus(true);
    Exit;
   end//l3Same(l_Name, anItem.ReqName)
   else
    Result := true;
  //#UC END# *68801C8A78FF__impl*
  end;//DoIt

 //#UC START# *4F69A17402A1__var*
 //#UC END# *4F69A17402A1__var*
 begin
  //#UC START# *4F69A17402A1iter*
  TevReqIterator.Make(aCard).
  //#UC END# *4F69A17402A1iter*
   DoReqF(L2IevReqIteratorDoReqAction(@DoIt));
 end;//CallIterator

//#UC START# *4F69A12C0199_4F69A0DF02E0_var*
//#UC END# *4F69A12C0199_4F69A0DF02E0_var*
begin
//#UC START# *4F69A12C0199_4F69A0DF02E0_impl*
 l_Name := aCtx.rEngine.PopString;
 l_Op := aCard.StartOp;
 try
  CallIterator;
 finally
  l_Op := nil;
 end;//try..finally
//#UC END# *4F69A12C0199_4F69A0DF02E0_impl*
end;//TkwPopQueryCardAttributeSetFocus.DoModelImpl

procedure TkwPopQueryCardAttributeSetFocus.DoCard(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
//#UC START# *4E808E8B01BB_4F69A0DF02E0_var*
//#UC END# *4E808E8B01BB_4F69A0DF02E0_var*
begin
//#UC START# *4E808E8B01BB_4F69A0DF02E0_impl*
 DoModelImpl(aCtx, aCard);
//#UC END# *4E808E8B01BB_4F69A0DF02E0_impl*
end;//TkwPopQueryCardAttributeSetFocus.DoCard

class function TkwPopQueryCardAttributeSetFocus.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:QueryCard:Attribute:SetFocus';
end;//TkwPopQueryCardAttributeSetFocus.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_QueryCard_Attribute_SetFocus
 TkwPopQueryCardAttributeSetFocus.RegisterInEngine;
{$IfEnd} //not NoScripts

end.