unit kwTreeCheckFlag;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeCheckFlag.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::TreeCheckFlag
//
// tree:CheckFlag
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
  tfwScriptingInterfaces,
  vtOutliner,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
 TkwTreeCheckFlag = class(_kwTreeControlWord_)
  {* tree:CheckFlag }
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeCheckFlag
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Bits,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTreeCheckFlag;

{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

// start class TkwTreeCheckFlag

procedure TkwTreeCheckFlag.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_4ECB514501E0_var*
var
 l_Flag   : Integer;
 l_NodeID : Integer;
//#UC END# *4E01B8F1008E_4ECB514501E0_var*
begin
//#UC START# *4E01B8F1008E_4ECB514501E0_impl*
 l_Flag := 0; l_NodeID := 0;
 if aCtx.rEngine.IsTopInt then
  l_Flag := aCtx.rEngine.PopInt
 else
  RunnerAssert(False, 'Не задан флаг для проверки.', aCtx);
 //l3TestMask(otlBlocks.CTree.NodeFlags[otlBlocks.CTree.CNodes[Index]], nfContens)
 if aCtx.rEngine.IsTopInt then
  l_NodeID := aCtx.rEngine.PopInt
 else
  RunnerAssert(False, 'Не задан узел дерева.', aCtx);
 aCtx.rEngine.PushBool(l3TestMask(aTreeControl.CTree.CNodes[l_NodeID].Flags, l_Flag));
//#UC END# *4E01B8F1008E_4ECB514501E0_impl*
end;//TkwTreeCheckFlag.DoTreeContol

class function TkwTreeCheckFlag.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:CheckFlag';
end;//TkwTreeCheckFlag.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.