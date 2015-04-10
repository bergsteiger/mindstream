unit kwArrayClear;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwArrayClear.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::array_Clear
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
 TkwArrayClear = {final} class(_tfwArrayWord_)
 protected
 // realized methods
   procedure DoArray(const aCtx: TtfwContext;
     const anArray: ItfwValueList); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwArrayClear
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwArrayClear;

{$Include ..\ScriptEngine\tfwArrayWord.imp.pas}

// start class TkwArrayClear

procedure TkwArrayClear.DoArray(const aCtx: TtfwContext;
  const anArray: ItfwValueList);
//#UC START# *4ED7A0640044_4F62FAD100A5_var*
//#UC END# *4ED7A0640044_4F62FAD100A5_var*
begin
//#UC START# *4ED7A0640044_4F62FAD100A5_impl*
 anArray.Clear;
//#UC END# *4ED7A0640044_4F62FAD100A5_impl*
end;//TkwArrayClear.DoArray

class function TkwArrayClear.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'array:Clear';
end;//TkwArrayClear.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwArrayWord.imp.pas}
{$IfEnd} //not NoScripts

end.