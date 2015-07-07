{$IfNDef ScreenShotCommon_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/ScreenShotCommon.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::ScreenShotCommon
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define ScreenShotCommon_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
 _ScreenShotCommon_ = {mixin} class(_kwHandleWord_)
 protected
 // realized methods
   procedure DoWithHandle(aHandle: THandle;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoAfterSave(const aFileName: AnsiString;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_ScreenShotCommon_
{$IfEnd} //not NoScripts

{$Else ScreenShotCommon_imp}

{$IfNDef ScreenShotCommon_imp_impl}
{$Define ScreenShotCommon_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwHandleWord.imp.pas}

// start class _ScreenShotCommon_

procedure _ScreenShotCommon_.DoWithHandle(aHandle: THandle;
  const aCtx: TtfwContext);
//#UC START# *510AA0900333_5369FDB5020D_var*
var
 l_Top     : Integer;
 l_Left    : Integer;
 l_Width   : Integer;
 l_Height  : Integer;
 l_Bitmap  : TBitmap;
 l_FileName: AnsiString;
//#UC END# *510AA0900333_5369FDB5020D_var*
begin
//#UC START# *510AA0900333_5369FDB5020D_impl*
 l_Bitmap := TBitmap.Create;
 try
  l_Left := aCtx.rEngine.PopInt;
  l_Top := aCtx.rEngine.PopInt;
  l_Width := aCtx.rEngine.PopInt;
  l_Height := aCtx.rEngine.PopInt;
  RunnerAssert(l_Height > 0, 'Высота скриншота меньше или равна 0.', aCtx);
  RunnerAssert(l_Width > 0, 'Ширина скриншота меньше или равна 0.', aCtx);
  l3MakeScreenShot(l_Bitmap, l_Left, l_Top, l_Width, l_Height, aHandle);
  l_FileName := aCtx.rEngine.PopDelphiString;
  l_FileName := aCtx.rCaller.ResolveOutputFilePath(l_FileName);
  l_Bitmap.SaveToFile(l_FileName);
  DoAfterSave(l_FileName, aCtx);
 finally
  FreeAndNil(l_Bitmap);
 end;
//#UC END# *510AA0900333_5369FDB5020D_impl*
end;//_ScreenShotCommon_.DoWithHandle

{$IfEnd} //not NoScripts

{$Else  ScreenShotCommon_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf ScreenShotCommon_imp_impl}
{$EndIf ScreenShotCommon_imp}
