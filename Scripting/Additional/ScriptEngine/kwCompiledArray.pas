unit kwCompiledArray;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledArray.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::TkwCompiledArray
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
  kwBeginLikeCompiledCode,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledArray = class(TkwBeginLikeCompiledCode)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledArray
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwArray,
  SysUtils,
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledArray

procedure TkwCompiledArray.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52EB991C028F_var*
var
 l_A : TtfwArray;
 l_V : TtfwStackValue;
//#UC END# *4DAEEDE10285_52EB991C028F_var*
begin
//#UC START# *4DAEEDE10285_52EB991C028F_impl*
 aCtx.rEngine.PushBracket;
 inherited;
 l_A := TtfwArray.Create;
 try
  try
   while true do
   begin
    l_V := aCtx.rEngine.Pop;
    if l_V.IsBracket then
     break;
    l_A.Insert(0, l_V);
   end;//while true
  finally
   aCtx.rEngine.Push(TtfwStackValue_C(ItfwValueList(l_A)));
  end;//try..finally
 finally
  FreeAndNil(l_A);
 end;//try..finally
//#UC END# *4DAEEDE10285_52EB991C028F_impl*
end;//TkwCompiledArray.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DA546B03B2*
 TkwCompiledArray.RegisterClass;
//#UC END# *53DA546B03B2*
{$IfEnd} //not NoScripts

end.