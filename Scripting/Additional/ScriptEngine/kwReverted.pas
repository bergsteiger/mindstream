unit kwReverted;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwReverted.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::Reverted
//
// Возвращает массив с итерацией в обратном порядке
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
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwArrayWord.imp.pas}
 TkwReverted = {final} class(_tfwArrayWord_)
  {* Возвращает массив с итерацией в обратном порядке }
 protected
 // realized methods
   procedure DoArray(const aCtx: TtfwContext;
     const anArray: ItfwValueList); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwReverted
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwRevertedArrayView,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwReverted;

{$Include ..\ScriptEngine\tfwArrayWord.imp.pas}

// start class TkwReverted

procedure TkwReverted.DoArray(const aCtx: TtfwContext;
  const anArray: ItfwValueList);
//#UC START# *4ED7A0640044_52E271F303B8_var*
//#UC END# *4ED7A0640044_52E271F303B8_var*
begin
//#UC START# *4ED7A0640044_52E271F303B8_impl*
 aCtx.rEngine.Push(TtfwStackValue_C(TtfwRevertedArrayView.Make(anArray)));
//#UC END# *4ED7A0640044_52E271F303B8_impl*
end;//TkwReverted.DoArray

class function TkwReverted.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Reverted';
end;//TkwReverted.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwArrayWord.imp.pas}
{$IfEnd} //not NoScripts

end.