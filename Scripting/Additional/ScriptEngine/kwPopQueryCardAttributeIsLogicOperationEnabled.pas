unit kwPopQueryCardAttributeIsLogicOperationEnabled;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopQueryCardAttributeIsLogicOperationEnabled.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::QueryCardProcessing::pop_QueryCard_Attribute_IsLogicOperationEnabled
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
 TkwPopQueryCardAttributeIsLogicOperationEnabled = {final scriptword} class(TkwQueryCardFromStackWord)
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
 end;//TkwPopQueryCardAttributeIsLogicOperationEnabled
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

// start class TkwPopQueryCardAttributeIsLogicOperationEnabled

procedure TkwPopQueryCardAttributeIsLogicOperationEnabled.DoModelImpl(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
var
 l_Name : Il3CString;
 l_IsEnabled : Boolean;
 l_Op : InevOp;

 procedure CallIterator;

  function DoIt(const anItem: IevReq): Boolean;
  //#UC START# *1E86D84EDB95__var*
  var
   l_F : IevEditorControlField;
  //#UC END# *1E86D84EDB95__var*
  begin
  //#UC START# *1E86D84EDB95__impl*
   if l3Same(l_Name, anItem.ReqName) then
   begin
    Result := false;
    l_F := anItem.FirstField;
    l_IsEnabled := (l_F As IevEditorFieldWithTree).IsLogicalStateButtonEnabled; 
    Exit;
   end else
    Result := true;
  //#UC END# *1E86D84EDB95__impl*
  end;//DoIt

 //#UC START# *50F01237000C__var*
 //#UC END# *50F01237000C__var*
 begin
  //#UC START# *50F01237000Citer*
  TevReqIterator.Make(aCard).
  //#UC END# *50F01237000Citer*
   DoReqF(L2IevReqIteratorDoReqAction(@DoIt));
 end;//CallIterator

//#UC START# *50F011CD0374_50EFDD9B0123_var*
//#UC END# *50F011CD0374_50EFDD9B0123_var*
begin
//#UC START# *50F011CD0374_50EFDD9B0123_impl*
 l_Name := aCtx.rEngine.PopString;
 l_Op := aCard.StartOp;
 try
  CallIterator;
 finally
  l_Op := nil;
 end;//try..finally
 aCtx.rEngine.PushBool(l_IsEnabled);
//#UC END# *50F011CD0374_50EFDD9B0123_impl*
end;//TkwPopQueryCardAttributeIsLogicOperationEnabled.DoModelImpl

procedure TkwPopQueryCardAttributeIsLogicOperationEnabled.DoCard(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
//#UC START# *4E808E8B01BB_50EFDD9B0123_var*
//#UC END# *4E808E8B01BB_50EFDD9B0123_var*
begin
//#UC START# *4E808E8B01BB_50EFDD9B0123_impl*
 DoModelImpl(aCtx, aCard);
//#UC END# *4E808E8B01BB_50EFDD9B0123_impl*
end;//TkwPopQueryCardAttributeIsLogicOperationEnabled.DoCard

class function TkwPopQueryCardAttributeIsLogicOperationEnabled.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:QueryCard:Attribute:IsLogicOperationEnabled';
end;//TkwPopQueryCardAttributeIsLogicOperationEnabled.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_QueryCard_Attribute_IsLogicOperationEnabled
 TkwPopQueryCardAttributeIsLogicOperationEnabled.RegisterInEngine;
{$IfEnd} //not NoScripts

end.