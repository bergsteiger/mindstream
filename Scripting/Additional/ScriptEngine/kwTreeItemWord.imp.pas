{$IfNDef kwTreeItemWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeItemWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::kwTreeItemWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwTreeItemWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
 _kwTreeItemWord_ = {mixin} class(_kwTreeControlWord_)
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoTreeItem(aTreeControl: TvtCustomOutliner;
     anItemIndex: Integer;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwTreeItemWord_
{$IfEnd} //not NoScripts

{$Else kwTreeItemWord_imp}

{$IfNDef kwTreeItemWord_imp_impl}
{$Define kwTreeItemWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

type
  TvtCustomOutlinerHack = class(TvtCustomOutliner)
  end;//TvtCustomOutlinerHack

// start class _kwTreeItemWord_

procedure _kwTreeItemWord_.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_504DD02502D8_var*
//#UC END# *4E01B8F1008E_504DD02502D8_var*
begin
//#UC START# *4E01B8F1008E_504DD02502D8_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задан номер узла.', aCtx);
 DoTreeItem(aTreeControl, aCtx.rEngine.PopInt, aCtx);
//#UC END# *4E01B8F1008E_504DD02502D8_impl*
end;//_kwTreeItemWord_.DoTreeContol

{$IfEnd} //not NoScripts

{$Else  kwTreeItemWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwTreeItemWord_imp_impl}
{$EndIf kwTreeItemWord_imp}
