unit kwArrayCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwArrayCount.pas"
// Начат: 01.12.2011 19:41
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::array_Count
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
 TkwArrayCount = class(_tfwArrayWord_)
 protected
 // realized methods
   procedure DoArray(const aCtx: TtfwContext;
     const anArray: ItfwValueList); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwArrayCount
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwArrayCount;

{$Include ..\ScriptEngine\tfwArrayWord.imp.pas}

// start class TkwArrayCount

procedure TkwArrayCount.DoArray(const aCtx: TtfwContext;
  const anArray: ItfwValueList);
//#UC START# *4ED7A0640044_4ED7A0210165_var*
//#UC END# *4ED7A0640044_4ED7A0210165_var*
begin
//#UC START# *4ED7A0640044_4ED7A0210165_impl*
 aCtx.rEngine.PushInt(anArray.Count);
//#UC END# *4ED7A0640044_4ED7A0210165_impl*
end;//TkwArrayCount.DoArray

class function TkwArrayCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'array:Count';
end;//TkwArrayCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwArrayWord.imp.pas}
{$IfEnd} //not NoScripts

end.