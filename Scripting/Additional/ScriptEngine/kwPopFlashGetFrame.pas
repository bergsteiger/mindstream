unit kwPopFlashGetFrame;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopFlashGetFrame.pas"
// Начат: 21.10.2011 19:32
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_flash_GetFrame
//
// Кладёт на стек номер текущего кадра
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoFlash) AND not defined(NoScripts)}
uses
  vtShockwaveFlashEx,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoFlash AND not NoScripts

{$If not defined(NoFlash) AND not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwFlashFromStackWord.imp.pas}
 TkwPopFlashGetFrame = class(_kwFlashFromStackWord_)
  {* Кладёт на стек номер текущего кадра }
 protected
 // realized methods
   procedure DoFlash(aControl: TvtShockwaveFlashEx;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFlashGetFrame
{$IfEnd} //not NoFlash AND not NoScripts

implementation

{$If not defined(NoFlash) AND not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoFlash AND not NoScripts

{$If not defined(NoFlash) AND not defined(NoScripts)}

type _Instance_R_ = TkwPopFlashGetFrame;

{$Include ..\ScriptEngine\kwFlashFromStackWord.imp.pas}

// start class TkwPopFlashGetFrame

procedure TkwPopFlashGetFrame.DoFlash(aControl: TvtShockwaveFlashEx;
  const aCtx: TtfwContext);
//#UC START# *4EA1903D033E_4EA1905E003D_var*
//#UC END# *4EA1903D033E_4EA1905E003D_var*
begin
//#UC START# *4EA1903D033E_4EA1905E003D_impl*
 aCtx.rEngine.PushInt(aControl.FrameNum);
//#UC END# *4EA1903D033E_4EA1905E003D_impl*
end;//TkwPopFlashGetFrame.DoFlash

class function TkwPopFlashGetFrame.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:flash:GetFrame';
end;//TkwPopFlashGetFrame.GetWordNameForRegister

{$IfEnd} //not NoFlash AND not NoScripts

initialization
{$If not defined(NoFlash) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwFlashFromStackWord.imp.pas}
{$IfEnd} //not NoFlash AND not NoScripts

end.