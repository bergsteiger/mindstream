{$IfNDef DrawOutputSupport_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/DrawOutputSupport.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::MixIns::DrawOutputSupport
//
// Поддержка сохранения информации об отрисованном в файл для последующего сравнение с эталоном.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define DrawOutputSupport_imp}
{$If not defined(NoScripts)}
 _DrawOutputSupport_ = {mixin} class(_DrawOutputSupport_Parent_, InevShapesLogger)
  {* Поддержка сохранения информации об отрисованном в файл для последующего сравнение с эталоном. }
 private
 // private fields
   f_Editor : TevCustomEditorWindow;
 protected
 // realized methods
   function OpenLog(const aView: InevView): AnsiString;
   procedure CloseLog(const aLogName: AnsiString);
   function LogScreen(const aView: InevView): Boolean;
 protected
 // protected methods
   procedure SaveDrawing(const aText: TevCustomEditorWindow);
     {* Сохранить информацию об отрисованном. }
   procedure DoRepaint(aText: TevCustomEditorWindow); virtual;
   function DoOpenLog(const aView: InevView): AnsiString; virtual; abstract;
   procedure DoCloseLog(const aLogName: AnsiString); virtual; abstract;
 end;//_DrawOutputSupport_
{$IfEnd} //not NoScripts

{$Else DrawOutputSupport_imp}

{$If not defined(NoScripts)}

// start class _DrawOutputSupport_

procedure _DrawOutputSupport_.SaveDrawing(const aText: TevCustomEditorWindow);
//#UC START# *4E1C02500330_4E1C016B0011_var*
//#UC END# *4E1C02500330_4E1C016B0011_var*
begin
//#UC START# *4E1C02500330_4E1C016B0011_impl*
 f_Editor := aText;
 DoRepaint(f_Editor);
 try
  TnevShapesPaintedSpy.Instance.SetLogger(Self);
  try
   aText.View.ClearShapes;
  finally
   TnevShapesPaintedSpy.Instance.RemoveLogger(Self);
  end;//try..finally
 finally
  f_Editor := nil;
 end;//try..finally
//#UC END# *4E1C02500330_4E1C016B0011_impl*
end;//_DrawOutputSupport_.SaveDrawing

procedure _DrawOutputSupport_.DoRepaint(aText: TevCustomEditorWindow);
//#UC START# *4EB100CE0160_4E1C016B0011_var*
//#UC END# *4EB100CE0160_4E1C016B0011_var*
begin
//#UC START# *4EB100CE0160_4E1C016B0011_impl*
 aText.Repaint;
//#UC END# *4EB100CE0160_4E1C016B0011_impl*
end;//_DrawOutputSupport_.DoRepaint

function _DrawOutputSupport_.OpenLog(const aView: InevView): AnsiString;
//#UC START# *4CA5D0430096_4E1C016B0011_var*
//#UC END# *4CA5D0430096_4E1C016B0011_var*
begin
//#UC START# *4CA5D0430096_4E1C016B0011_impl*
 Result := DoOpenLog(aView);
//#UC END# *4CA5D0430096_4E1C016B0011_impl*
end;//_DrawOutputSupport_.OpenLog

procedure _DrawOutputSupport_.CloseLog(const aLogName: AnsiString);
//#UC START# *4CA5D0540033_4E1C016B0011_var*
//#UC END# *4CA5D0540033_4E1C016B0011_var*
begin
//#UC START# *4CA5D0540033_4E1C016B0011_impl*
 DoCloseLog(aLogName);
//#UC END# *4CA5D0540033_4E1C016B0011_impl*
end;//_DrawOutputSupport_.CloseLog

function _DrawOutputSupport_.LogScreen(const aView: InevView): Boolean;
//#UC START# *4CACAF4F008D_4E1C016B0011_var*
var
 l_CV : InevControlView;
 l_C : InevControl;
//#UC END# *4CACAF4F008D_4E1C016B0011_var*
begin
//#UC START# *4CACAF4F008D_4E1C016B0011_impl*
 Result := false;
 if (f_Editor <> nil) then
  if Supports(aView, InevControlView, l_CV) then
   try
    l_C := l_CV.Control;
    Result := (l_CV.Control <> nil) AND l_C.IsA(f_Editor);
   finally
    l_CV := nil;
   end;//try..finally
//#UC END# *4CACAF4F008D_4E1C016B0011_impl*
end;//_DrawOutputSupport_.LogScreen

{$IfEnd} //not NoScripts

{$EndIf DrawOutputSupport_imp}
