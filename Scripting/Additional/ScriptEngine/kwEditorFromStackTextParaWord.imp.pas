{$IfNDef kwEditorFromStackTextParaWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEditorFromStackTextParaWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwEditorFromStackTextParaWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwEditorFromStackTextParaWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}
 _kwEditorFromStackTextParaWord_ = {mixin} class(_kwEditorFromStackCursorWord_)
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 protected
 // protected methods
   procedure DoPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); virtual; abstract;
 end;//_kwEditorFromStackTextParaWord_
{$IfEnd} //not NoScripts

{$Else kwEditorFromStackTextParaWord_imp}

{$IfNDef kwEditorFromStackTextParaWord_imp_impl}
{$Define kwEditorFromStackTextParaWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}

// start class _kwEditorFromStackTextParaWord_

procedure _kwEditorFromStackTextParaWord_.DoCursor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPoint: InevBasePoint);
//#UC START# *50B8BCDF0093_50BA0B820089_var*
var
 l_P : InevBasePoint;
 l_O : InevPara;
//#UC END# *50B8BCDF0093_50BA0B820089_var*
begin
//#UC START# *50B8BCDF0093_50BA0B820089_impl*
 l_P := aPoint.MostInner;
 if not l_P.Obj.AsObject.QT(InevPara, l_O) then
  RunnerAssert(false, '', aCtx);
 RunnerAssert(l_O.AsObject.IsKindOf(k2_typLeafPara), '', aCtx);
 DoPara(aCtx, anEditor, l_O);
//#UC END# *50B8BCDF0093_50BA0B820089_impl*
end;//_kwEditorFromStackTextParaWord_.DoCursor

{$IfEnd} //not NoScripts

{$Else  kwEditorFromStackTextParaWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwEditorFromStackTextParaWord_imp_impl}
{$EndIf kwEditorFromStackTextParaWord_imp}
