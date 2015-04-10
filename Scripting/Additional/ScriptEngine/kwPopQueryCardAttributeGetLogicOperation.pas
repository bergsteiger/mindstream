unit kwPopQueryCardAttributeGetLogicOperation;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopQueryCardAttributeGetLogicOperation.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::QueryCardProcessing::pop_QueryCard_Attribute_GetLogicOperation
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
  l3Interfaces,
  nevBase,
  evQueryCardInt,
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
 TkwPopQueryCardAttributeGetLogicOperation = {final} class(_kwQueryCardFromStackWord_)
 private
 // private methods
   procedure DoModelImpl(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor);
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopQueryCardAttributeGetLogicOperation
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Base,
  evReqIterator,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopQueryCardAttributeGetLogicOperation;

{$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}

// start class TkwPopQueryCardAttributeGetLogicOperation

procedure TkwPopQueryCardAttributeGetLogicOperation.DoModelImpl(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
var
 l_Name : Il3CString;
 l_Op : InevOp;
 l_LogicOp : Integer;

 procedure CallIterator;

  function DoIt(const anItem: IevReq): Boolean;
  //#UC START# *2B70B2B2422D__var*
  var
   l_F : IevEditorControlField;
  //#UC END# *2B70B2B2422D__var*
  begin
  //#UC START# *2B70B2B2422D__impl*
   if l3Same(l_Name, anItem.ReqName) then
   begin
    Result := false;
    l_F := anItem.FirstField;
    l_LogicOp := (l_F As IevEditorFieldWithTree).LogicalState; 
    Exit;
   end else
    Result := true;
  //#UC END# *2B70B2B2422D__impl*
  end;//DoIt

 //#UC START# *50EFE2330224__var*
 //#UC END# *50EFE2330224__var*
 begin
  //#UC START# *50EFE2330224iter*
  TevReqIterator.Make(aCard).
  //#UC END# *50EFE2330224iter*
   DoReqF(L2IevReqIteratorDoReqAction(@DoIt));
 end;//CallIterator

//#UC START# *50EFE12701AD_50EFDD1802BC_var*
//#UC END# *50EFE12701AD_50EFDD1802BC_var*
begin
//#UC START# *50EFE12701AD_50EFDD1802BC_impl*
 l_Name := aCtx.rEngine.PopString;
 l_Op := aCard.StartOp;
 try
  CallIterator;
 finally
  l_Op := nil;
 end;//try..finally
 aCtx.rEngine.PushInt(l_LogicOp);
//#UC END# *50EFE12701AD_50EFDD1802BC_impl*
end;//TkwPopQueryCardAttributeGetLogicOperation.DoModelImpl

procedure TkwPopQueryCardAttributeGetLogicOperation.DoCard(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
//#UC START# *4E808E8B01BB_50EFDD1802BC_var*
//#UC END# *4E808E8B01BB_50EFDD1802BC_var*
begin
//#UC START# *4E808E8B01BB_50EFDD1802BC_impl*
 DoModelImpl(aCtx, aCard);
//#UC END# *4E808E8B01BB_50EFDD1802BC_impl*
end;//TkwPopQueryCardAttributeGetLogicOperation.DoCard

class function TkwPopQueryCardAttributeGetLogicOperation.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:QueryCard:Attribute:GetLogicOperation';
end;//TkwPopQueryCardAttributeGetLogicOperation.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.