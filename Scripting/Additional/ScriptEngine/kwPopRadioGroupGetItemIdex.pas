unit kwPopRadioGroupGetItemIdex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopRadioGroupGetItemIdex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_RadioGroup_GetItemIdex
//
// *Формат:*
// {code}
// aControlObj pop:RadioGroup:GetItemIndex
// {code}
// *Описание:* Возвращает текущее значение свойства ItemIndex у контрола  aControlObj
// (классTRadioGroup)
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
  ExtCtrls,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwRadioGroupFromStack.imp.pas}
 TkwPopRadioGroupGetItemIdex = {final} class(_kwRadioGroupFromStack_)
  {* *Формат:* 
[code]
aControlObj pop:RadioGroup:GetItemIndex
[code] 
*Описание:* Возвращает текущее значение свойства ItemIndex у контрола  aControlObj (классTRadioGroup) }
 protected
 // realized methods
   procedure DoWithRadioGroup(const aRadioGroup: TRadioGroup;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopRadioGroupGetItemIdex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopRadioGroupGetItemIdex;

{$Include ..\ScriptEngine\kwRadioGroupFromStack.imp.pas}

// start class TkwPopRadioGroupGetItemIdex

procedure TkwPopRadioGroupGetItemIdex.DoWithRadioGroup(const aRadioGroup: TRadioGroup;
  const aCtx: TtfwContext);
//#UC START# *5034B42D0210_5034B498032F_var*
//#UC END# *5034B42D0210_5034B498032F_var*
begin
//#UC START# *5034B42D0210_5034B498032F_impl*
 aCtx.rEngine.PushInt(aRadioGroup.ItemIndex);
//#UC END# *5034B42D0210_5034B498032F_impl*
end;//TkwPopRadioGroupGetItemIdex.DoWithRadioGroup

class function TkwPopRadioGroupGetItemIdex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:RadioGroup:GetItemIdex';
end;//TkwPopRadioGroupGetItemIdex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwRadioGroupFromStack.imp.pas}
{$IfEnd} //not NoScripts

end.