unit kwPopSpinEditGetValue;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopSpinEditGetValue.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_SpinEdit_GetValue
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
  vtSpinEdit,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwSpintEditFromStackWord.imp.pas}
 TkwPopSpinEditGetValue = {final} class(_kwSpintEditFromStackWord_)
 protected
 // realized methods
   procedure DoSpinEdit(aControl: TvtSpinEdit;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopSpinEditGetValue
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

type _Instance_R_ = TkwPopSpinEditGetValue;

{$Include ..\ScriptEngine\kwSpintEditFromStackWord.imp.pas}

// start class TkwPopSpinEditGetValue

procedure TkwPopSpinEditGetValue.DoSpinEdit(aControl: TvtSpinEdit;
  const aCtx: TtfwContext);
//#UC START# *4F609622016F_4F6096BD0093_var*
//#UC END# *4F609622016F_4F6096BD0093_var*
begin
//#UC START# *4F609622016F_4F6096BD0093_impl*
 aCtx.rEngine.PushInt(aControl.AsInteger);
//#UC END# *4F609622016F_4F6096BD0093_impl*
end;//TkwPopSpinEditGetValue.DoSpinEdit

class function TkwPopSpinEditGetValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:SpinEdit:GetValue';
end;//TkwPopSpinEditGetValue.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwSpintEditFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.