unit kwPopControlFindControlByName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlFindControlByName.pas"
// Начат: 03.02.2012 21:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_FindControlByName
//
// Ищет вложенный контрол по имени (рекурсивно)
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
  Controls,
  tfwScriptingInterfaces,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
 TkwPopControlFindControlByName = {final} class(_kwWinControlFromStackWord_)
  {* Ищет вложенный контрол по имени (рекурсивно) }
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlFindControlByName
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

type _Instance_R_ = TkwPopControlFindControlByName;

{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class TkwPopControlFindControlByName

procedure TkwPopControlFindControlByName.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4F2C152F03BA_var*
var
 l_Name : AnsiString;
 
 function DoFindControl(aControl: TWinControl): TComponent{TControl};
 var
  l_Index : Integer;
  l_C : TControl;
  l_Cmp : TComponent;
 begin//DoFindControl
  if (aControl.Name = l_Name) then
   Result := aControl
  else
  begin
   Result := nil;
   for l_Index := 0 to Pred(aControl.ControlCount) do
   begin
    l_C := aControl.Controls[l_Index];
    if (l_C.Name = l_Name) then
    begin
     Result := l_C;
     Exit;
    end//l_C.Name = l_Name
    else
    begin
     if (l_C Is TWinControl) then
     begin
      Result := DoFindControl(TWinControl(l_C));
      if (Result <> nil) then
       Exit;
     end;//l_C Is TWinControl
    end;//l_C.Name = l_Name
   end;//for l_Index
   if (Result = nil) then
    for l_Index := 0 to Pred(aControl.ComponentCount) do
    begin
     l_Cmp := aControl.Components[l_Index];
     if (l_Cmp Is TControl) AND (l_Cmp.Name = l_Name) then
     begin
      Result := {TControl}(l_Cmp);
      Exit;
     end//l_C.Name = l_Name
     else
     if (l_Cmp Is TWinControl) then
     begin
      Result := DoFindControl(TWinControl(l_Cmp));
      if (Result <> nil) then
       Exit;
     end;//l_C Is TWinControl
     Result := l_Cmp.FindComponent(l_Name);
     if (Result <> nil) then
      Exit;
     if (l_Cmp.Name = l_Name) then
     begin
      Result := l_Cmp;
      Exit;
     end;//l_C.Name = l_Name
    end;//for l_Index
  end;//aControl.Name = l_Name
 end;//DoFindControl

//#UC END# *4F212C930149_4F2C152F03BA_var*
begin
//#UC START# *4F212C930149_4F2C152F03BA_impl*
 l_Name := aCtx.rEngine.PopDelphiString;
 aCtx.rEngine.PushObj(DoFindControl(aControl));
//#UC END# *4F212C930149_4F2C152F03BA_impl*
end;//TkwPopControlFindControlByName.DoWinControl

class function TkwPopControlFindControlByName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:FindControlByName';
end;//TkwPopControlFindControlByName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.