{$IfNDef kwEditorFromStackNextParaWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEditorFromStackNextParaWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwEditorFromStackNextParaWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwEditorFromStackNextParaWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackTextParaWord.imp.pas}
 _kwEditorFromStackNextParaWord_ = {mixin} class(_kwEditorFromStackTextParaWord_)
 protected
 // realized methods
   procedure DoPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 protected
 // protected methods
   procedure DoNextPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); virtual; abstract;
 end;//_kwEditorFromStackNextParaWord_
{$IfEnd} //not NoScripts

{$Else kwEditorFromStackNextParaWord_imp}

{$IfNDef kwEditorFromStackNextParaWord_imp_impl}
{$Define kwEditorFromStackNextParaWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackTextParaWord.imp.pas}

// start class _kwEditorFromStackNextParaWord_

procedure _kwEditorFromStackNextParaWord_.DoPara(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPara: InevPara);
//#UC START# *50BA0BBD01BF_50BA0C4E001B_var*
//#UC END# *50BA0BBD01BF_50BA0C4E001B_var*
begin
//#UC START# *50BA0BBD01BF_50BA0C4E001B_impl*
 DoNextPara(aCtx, anEditor, aPara.Next);
//#UC END# *50BA0BBD01BF_50BA0C4E001B_impl*
end;//_kwEditorFromStackNextParaWord_.DoPara

{$IfEnd} //not NoScripts

{$Else  kwEditorFromStackNextParaWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackTextParaWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwEditorFromStackNextParaWord_imp_impl}
{$EndIf kwEditorFromStackNextParaWord_imp}
