{$IfNDef LinesDrawOutput_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "LinesDrawOutput.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi::ScriptEngine$Everest::MixIns::LinesDrawOutput
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define LinesDrawOutput_imp}
{$If not defined(NoScripts)}
 _LinesDrawOutput_ = {mixin} class(_LinesDrawOutput_Parent_, Il3FrameLinesLogger)
 private
 // private fields
   f_ObjID : Integer;
 protected
 // realized methods
   function OpenLinesLog(const aCanvas: Il3InfoCanvas;
     aObjID: Integer): AnsiString;
   procedure CloseLinesLog(const aLogName: AnsiString);
   function GetPrecision: Integer;
 protected
 // protected fields
   f_OutputFileName : AnsiString;
   f_Precision : Integer;
 protected
 // protected methods
   procedure DoCloseLog(const aLogName: AnsiString); virtual; abstract;
   procedure SaveDrawing(anEditor: TevCustomEditorWindow;
     aPrinting: Boolean);
 end;//_LinesDrawOutput_
{$Else}

 _LinesDrawOutput_ = _LinesDrawOutput_Parent_;

{$IfEnd} //not NoScripts

{$Else LinesDrawOutput_imp}

{$If not defined(NoScripts)}

// start class _LinesDrawOutput_

procedure _LinesDrawOutput_.SaveDrawing(anEditor: TevCustomEditorWindow;
  aPrinting: Boolean);
//#UC START# *4FA3CBA503D7_4FA3BB1500BA_var*
//#UC END# *4FA3CBA503D7_4FA3BB1500BA_var*
begin
//#UC START# *4FA3CBA503D7_4FA3BB1500BA_impl*
 Tl3FrameLinesSpy.Instance.SetLogger(Self, aPrinting);
 try
  Tl3FrameLinesSpy.Instance.NeedClear := True;
  anEditor.Repaint;
  Tl3FrameLinesSpy.Instance.NeedClear := False;
  anEditor.Repaint;
 finally
  Tl3FrameLinesSpy.Instance.RemoveLogger(Self);
 end;
//#UC END# *4FA3CBA503D7_4FA3BB1500BA_impl*
end;//_LinesDrawOutput_.SaveDrawing

function _LinesDrawOutput_.OpenLinesLog(const aCanvas: Il3InfoCanvas;
  aObjID: Integer): AnsiString;
//#UC START# *4D00C91B03B2_4FA3BB1500BA_var*
//#UC END# *4D00C91B03B2_4FA3BB1500BA_var*
begin
//#UC START# *4D00C91B03B2_4FA3BB1500BA_impl*
 Result := f_OutputFileName + '_' + IntToStr(aObjID) + '.lines';
//#UC END# *4D00C91B03B2_4FA3BB1500BA_impl*
end;//_LinesDrawOutput_.OpenLinesLog

procedure _LinesDrawOutput_.CloseLinesLog(const aLogName: AnsiString);
//#UC START# *4D00C9410153_4FA3BB1500BA_var*
//#UC END# *4D00C9410153_4FA3BB1500BA_var*
begin
//#UC START# *4D00C9410153_4FA3BB1500BA_impl*
 DoCloseLog(aLogName);
//#UC END# *4D00C9410153_4FA3BB1500BA_impl*
end;//_LinesDrawOutput_.CloseLinesLog

function _LinesDrawOutput_.GetPrecision: Integer;
//#UC START# *4FA3D5A500A9_4FA3BB1500BA_var*
//#UC END# *4FA3D5A500A9_4FA3BB1500BA_var*
begin
//#UC START# *4FA3D5A500A9_4FA3BB1500BA_impl*
 Result := f_Precision;
//#UC END# *4FA3D5A500A9_4FA3BB1500BA_impl*
end;//_LinesDrawOutput_.GetPrecision

{$IfEnd} //not NoScripts

{$EndIf LinesDrawOutput_imp}
