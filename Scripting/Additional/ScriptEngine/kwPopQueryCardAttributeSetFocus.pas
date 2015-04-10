unit kwPopQueryCardAttributeSetFocus;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopQueryCardAttributeSetFocus.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::QueryCardProcessing::pop_QueryCard_Attribute_SetFocus
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
 TkwPopQueryCardAttributeSetFocus = {final} class(_kwQueryCardFromStackWord_)
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
 end;//TkwPopQueryCardAttributeSetFocus
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

type _Instance_R_ = TkwPopQueryCardAttributeSetFocus;

{$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.