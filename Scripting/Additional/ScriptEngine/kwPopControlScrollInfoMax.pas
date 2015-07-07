unit kwPopControlScrollInfoMax;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlScrollInfoMax.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_ScrollInfo_Max
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
 TkwPopControlScrollInfoMax = {final} class(_kwScrollInfoWord_)
 protected
 // realized methods
   procedure DoScrollInfo(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlScrollInfoMax
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

type _Instance_R_ = TkwPopControlScrollInfoMax;

{$Include ..\ScriptEngine\kwScrollInfoWord.imp.pas}

// start class TkwPopControlScrollInfoMax

procedure TkwPopControlScrollInfoMax.DoScrollInfo(const aCtx: TtfwContext);
//#UC START# *51793A950073_51793B0D02BB_var*
//#UC END# *51793A950073_51793B0D02BB_var*
begin
//#UC START# *51793A950073_51793B0D02BB_impl*
 aCtx.rEngine.PushInt(ScrollInfo.nMax);
//#UC END# *51793A950073_51793B0D02BB_impl*
end;//TkwPopControlScrollInfoMax.DoScrollInfo

class function TkwPopControlScrollInfoMax.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:ScrollInfo:Max';
end;//TkwPopControlScrollInfoMax.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwScrollInfoWord.imp.pas}
{$IfEnd} //not NoScripts

end.