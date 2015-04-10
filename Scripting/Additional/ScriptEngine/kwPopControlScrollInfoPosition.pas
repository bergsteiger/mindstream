unit kwPopControlScrollInfoPosition;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlScrollInfoPosition.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_ScrollInfo_Position
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
 TkwPopControlScrollInfoPosition = {final} class(_kwScrollInfoWord_)
 protected
 // realized methods
   procedure DoScrollInfo(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlScrollInfoPosition
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

type _Instance_R_ = TkwPopControlScrollInfoPosition;

{$Include ..\ScriptEngine\kwScrollInfoWord.imp.pas}

// start class TkwPopControlScrollInfoPosition

procedure TkwPopControlScrollInfoPosition.DoScrollInfo(const aCtx: TtfwContext);
//#UC START# *51793A950073_51793B1F01AA_var*
//#UC END# *51793A950073_51793B1F01AA_var*
begin
//#UC START# *51793A950073_51793B1F01AA_impl*
 aCtx.rEngine.PushInt(ScrollInfo.nPos);
//#UC END# *51793A950073_51793B1F01AA_impl*
end;//TkwPopControlScrollInfoPosition.DoScrollInfo

class function TkwPopControlScrollInfoPosition.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:ScrollInfo:Position';
end;//TkwPopControlScrollInfoPosition.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwScrollInfoWord.imp.pas}
{$IfEnd} //not NoScripts

end.