unit kwPopControlFindVGControlByName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlFindVGControlByName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_FindVGControlByName
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  Controls,
  tfwScriptingInterfaces,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}
type
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
 TkwPopControlFindVGControlByName = {final} class(_kwWinControlFromStackWord_)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlFindVGControlByName
{$IfEnd} //not NoScripts AND not NoVGScene

implementation

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  vg_controls,
  vg_extctrls,
  vg_objects,
  vg_scene,
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}

type _Instance_R_ = TkwPopControlFindVGControlByName;

{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class TkwPopControlFindVGControlByName

procedure TkwPopControlFindVGControlByName.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_506AC8220119_var*
 {$If not defined(NoVGScene)}
 function DoFindVGObject(aVgControl: TvgObject; const aName: AnsiString): TvgObject;
 var
  I: Integer;
 begin
  if SameText(aVgControl.Name, aName) or
     ((aVgControl is TvgTextControl) and
      SameText((aVgControl as TvgTextControl).Text, aName)) then
  begin
   Result := aVgControl;
   Exit;
  end else
   Result := nil;
  for I := 0 to aVgControl.ChildrenCount - 1 do
  begin
   Result := DoFindVGObject(aVgControl.Children[I], aName);
   if Assigned(Result) then
    Exit;
  end;
 end;

 function DoFindWinControl(aControl: TWinControl; const aName: AnsiString): TvgObject;
 var
  I: Integer;
 begin
  for I := 0 to aControl.ControlCount - 1 do
   if aControl.Controls[I] is TWinControl then
   begin
    Result := DoFindWinControl(aControl.Controls[I] as TWinControl, aName);
    if Assigned(Result) then
     Exit;
   end;
   
  for I := 0 to aControl.ComponentCount - 1 do
   if aControl.Components[I] is TvgObject then
   begin
    Result := DoFindVGObject(aControl.Components[I] as TvgObject, aName);
    if Assigned(Result) then
     Exit;
   end else
   if aControl.Components[I] is TWinControl then
   begin
    Result := DoFindWinControl(aControl.Components[I] as TWinControl, aName);
    if Assigned(Result) then
     Exit;
   end;
  Result := nil;
 end;
var
 l_VgObj: TvgObject;
 l_Name: AnsiString;
 {$IfEnd}
//#UC END# *4F212C930149_506AC8220119_var*
begin
//#UC START# *4F212C930149_506AC8220119_impl*
 {$If not defined(NoVGScene)}
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задано имя Vg-контрола', aCtx);
 l_Name := aCtx.rEngine.PopDelphiString;
 l_VgObj := DoFindWinControl(aControl, l_Name);
 aCtx.rEngine.PushObj(l_VgObj);
 {$IfEnd}
//#UC END# *4F212C930149_506AC8220119_impl*
end;//TkwPopControlFindVGControlByName.DoWinControl

class function TkwPopControlFindVGControlByName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:FindVGControlByName';
end;//TkwPopControlFindVGControlByName.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.