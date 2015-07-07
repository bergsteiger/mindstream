unit kwCompiledWStringVarDecLen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledWStringVarDecLen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::TkwCompiledWStringVarDecLen
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
 {$Include ..\ScriptEngine\kwCompiledVarAsStringWorker.imp.pas}
 TkwCompiledWStringVarDecLen = class(_kwCompiledVarAsStringWorker_)
 protected
 // realized methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledWStringVarDecLen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Types,
  l3Interfaces,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwCompiledVarAsStringWorker.imp.pas}

// start class TkwCompiledWStringVarDecLen

procedure TkwCompiledWStringVarDecLen.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4F55EA4D028C_var*
var
 l_P : Tl3PCharLen;
//#UC END# *4DCBCD2200D2_4F55EA4D028C_var*
begin
//#UC START# *4DCBCD2200D2_4F55EA4D028C_impl*
 Tl3WString(l_P) := aVar.GetValue(aCtx).AsWString;
 Dec(l_P.SLen);
 Assert(l_P.SLen >= 0);
 aVar.SetValue(TtfwStackValue_C(l_P), aCtx);
//#UC END# *4DCBCD2200D2_4F55EA4D028C_impl*
end;//TkwCompiledWStringVarDecLen.DoVar

{$IfEnd} //not NoScripts

end.