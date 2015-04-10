unit kwPopControlScrollInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlScrollInfo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_ScrollInfo
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
  Windows,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwScrollInfoWord.imp.pas}
 TkwPopControlScrollInfo = {final} class(_kwScrollInfoWord_)
 protected
 // realized methods
   procedure DoScrollInfo(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlScrollInfo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopControlScrollInfo;

{$Include ..\ScriptEngine\kwScrollInfoWord.imp.pas}

// start class TkwPopControlScrollInfo

procedure TkwPopControlScrollInfo.DoScrollInfo(const aCtx: TtfwContext);
//#UC START# *51793A950073_51793AE70134_var*
//#UC END# *51793A950073_51793AE70134_var*
begin
//#UC START# *51793A950073_51793AE70134_impl*
 aCtx.rEngine.PushInt(ScrollInfo.nPos);
 aCtx.rEngine.PushInt(ScrollInfo.nPage);
 aCtx.rEngine.PushInt(ScrollInfo.nMin);
 aCtx.rEngine.PushInt(ScrollInfo.nMax);
//#UC END# *51793A950073_51793AE70134_impl*
end;//TkwPopControlScrollInfo.DoScrollInfo

class function TkwPopControlScrollInfo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:ScrollInfo';
end;//TkwPopControlScrollInfo.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwScrollInfoWord.imp.pas}
{$IfEnd} //not NoScripts

end.