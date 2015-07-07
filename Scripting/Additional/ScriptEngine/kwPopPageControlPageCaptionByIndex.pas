unit kwPopPageControlPageCaptionByIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopPageControlPageCaptionByIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_PageControl_PageCaptionByIndex
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
 TkwPopPageControlPageCaptionByIndex = {final} class(_kwPageControlFromStackWord_)
 protected
 // realized methods
   procedure DoPageControl(aControl: TElCustomPageControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopPageControlPageCaptionByIndex
{$IfEnd} //Nemesis AND not NoScripts

implementation

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}

type _Instance_R_ = TkwPopPageControlPageCaptionByIndex;

{$Include ..\ScriptEngine\kwPageControlFromStackWord.imp.pas}

// start class TkwPopPageControlPageCaptionByIndex

procedure TkwPopPageControlPageCaptionByIndex.DoPageControl(aControl: TElCustomPageControl;
  const aCtx: TtfwContext);
//#UC START# *500014A6023D_5000160D00F8_var*
var
 l_Captions: AnsiString;
 I, l_PageNum: Integer;
//#UC END# *500014A6023D_5000160D00F8_var*
begin
//#UC START# *500014A6023D_5000160D00F8_impl*
 l_PageNum := aCtx.rEngine.PopInt;
 RunnerAssert(l_PageNum >= 0, 'Давай положительное число!', aCtx);
 RunnerAssert(l_PageNum < aControl.PageCount, 'На PageControl меньше вкладок!', aCtx);
 for I := 0 to aControl.PageCount - 1 do
  if aControl.Pages[I].TabVisible then
  begin
   if l_PageNum = 0 then
   begin
    aCtx.rEngine.PushString(aControl.Pages[I].Caption);
    Break;
   end;
   Dec(l_PageNum);
  end;
//#UC END# *500014A6023D_5000160D00F8_impl*
end;//TkwPopPageControlPageCaptionByIndex.DoPageControl

class function TkwPopPageControlPageCaptionByIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:PageControl:PageCaptionByIndex';
end;//TkwPopPageControlPageCaptionByIndex.GetWordNameForRegister

{$IfEnd} //Nemesis AND not NoScripts

initialization
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwPageControlFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

end.