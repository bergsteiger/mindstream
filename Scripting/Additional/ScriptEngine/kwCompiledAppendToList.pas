unit kwCompiledAppendToList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledAppendToList.pas"
// Начат: 12.05.2011 21:29
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::TkwCompiledAppendToList
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
  kwCompiledVarWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledAppendToList = class(TkwCompiledVarWorker)
 protected
 // realized methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledAppendToList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledAppendToList

procedure TkwCompiledAppendToList.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4DCC18BE02BA_var*
//#UC END# *4DCBCD2200D2_4DCC18BE02BA_var*
begin
//#UC START# *4DCBCD2200D2_4DCC18BE02BA_impl*
 aVar.GetValue(aCtx).AsList.Add(aCtx.rEngine.Pop);
//#UC END# *4DCBCD2200D2_4DCC18BE02BA_impl*
end;//TkwCompiledAppendToList.DoVar

{$IfEnd} //not NoScripts

end.