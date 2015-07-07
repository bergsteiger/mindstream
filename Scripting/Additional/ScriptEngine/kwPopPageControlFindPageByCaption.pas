unit kwPopPageControlFindPageByCaption;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopPageControlFindPageByCaption.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_PageControl_FindPageByCaption
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  ElPgCtl,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwPageControlFromStackWord.imp.pas}
 TkwPopPageControlFindPageByCaption = {final} class(_kwPageControlFromStackWord_)
 protected
 // realized methods
   procedure DoPageControl(aControl: TElCustomPageControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopPageControlFindPageByCaption
{$IfEnd} //Nemesis AND not NoScripts

implementation

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  l3Interfaces,
  l3String,
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}

type _Instance_R_ = TkwPopPageControlFindPageByCaption;

{$Include ..\ScriptEngine\kwPageControlFromStackWord.imp.pas}

// start class TkwPopPageControlFindPageByCaption

procedure TkwPopPageControlFindPageByCaption.DoPageControl(aControl: TElCustomPageControl;
  const aCtx: TtfwContext);
//#UC START# *500014A6023D_500016A8036E_var*
var
 l_Caption: Il3CString;
 I, l_PageNum: Integer;
//#UC END# *500014A6023D_500016A8036E_var*
begin
//#UC START# *500014A6023D_500016A8036E_impl*
 l_Caption := aCtx.rEngine.PopString;
 l_PageNum := 0;
 for I := 0 to aControl.PageCount - 1 do
  if aControl.Pages[I].TabVisible then
  begin
   if l3Same(aControl.Pages[I].Caption, l_Caption) then
   begin
    aCtx.rEngine.PushInt(l_PageNum);
    Exit;
   end;
   Inc(l_PageNum);
  end;
 RunnerAssert(False, 'Вкладка не найдена!', aCtx);
//#UC END# *500014A6023D_500016A8036E_impl*
end;//TkwPopPageControlFindPageByCaption.DoPageControl

class function TkwPopPageControlFindPageByCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:PageControl:FindPageByCaption';
end;//TkwPopPageControlFindPageByCaption.GetWordNameForRegister

{$IfEnd} //Nemesis AND not NoScripts

initialization
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwPageControlFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

end.