unit kwScreenShot2FileWithCheck;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwScreenShot2FileWithCheck.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::ScreenShot2FileWithCheck
//
// Описание: снимает скриншот с передаваемого контрола и сохраняет его в файл bmp. После окончания
// теста производится сравнение с эталоном.
// Формат:
// {code}
// aFileName aHeight aWidth aTop aLeft aHandle ScreenShot2FileWithCheck
// {code}
// где aFileName - имя файла с расширением bmp, в который сохранять скриншот
// aHandle - хендл контрола, с которого снимаем скриншот (0 - для снятия скриншота с десктопа).
// aLeft, aTop, aWidth, aHeight - начальные координаты и размеры прямоугольной области, с которой
// снимаем скриншот.
// Пример:
// {code}
// INTEGER VAR l_Handle
// "Контрол в фокусе" pop:control:GetHandle >>> l_Handle
// STRING VAR l_FileName
// script:FileName '.bmp' sysutils:ChangeFileExt
// sysutils:ExtractFileName >>> l_FileName
// l_FileName 200 200 0 0 l_Handle ScreenShot2FileWithCheck
// {code}
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
  tfwScriptingInterfaces,
  Windows,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\ScreenShotCommon.imp.pas}
 TkwScreenShot2FileWithCheck = {final} class(_ScreenShotCommon_)
  {* Описание: снимает скриншот с передаваемого контрола и сохраняет его в файл bmp. После окончания теста производится сравнение с эталоном.
Формат:
[code]
aFileName aHeight aWidth aTop aLeft aHandle ScreenShot2FileWithCheck
[code]
где aFileName - имя файла с расширением bmp, в который сохранять скриншот
aHandle - хендл контрола, с которого снимаем скриншот (0 - для снятия скриншота с десктопа).
aLeft, aTop, aWidth, aHeight - начальные координаты и размеры прямоугольной области, с которой снимаем скриншот.
Пример:
[code]
  INTEGER VAR l_Handle
  "Контрол в фокусе" pop:control:GetHandle >>> l_Handle
  STRING VAR l_FileName
  script:FileName '.bmp' sysutils:ChangeFileExt
  sysutils:ExtractFileName >>> l_FileName  
  l_FileName 200 200 0 0 l_Handle ScreenShot2FileWithCheck
[code] }
 protected
 // realized methods
   procedure DoAfterSave(const aFileName: AnsiString;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwScreenShot2FileWithCheck
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  ddPicturePathListner,
  Graphics,
  SysUtils,
  l3ImageUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwScreenShot2FileWithCheck;

{$Include ..\ScriptEngine\ScreenShotCommon.imp.pas}

// start class TkwScreenShot2FileWithCheck

procedure TkwScreenShot2FileWithCheck.DoAfterSave(const aFileName: AnsiString;
  const aCtx: TtfwContext);
//#UC START# *5369FDE50394_5369FD7A00E8_var*
//#UC END# *5369FDE50394_5369FD7A00E8_var*
begin
//#UC START# *5369FDE50394_5369FD7A00E8_impl*
 with TddPicturePathListner.Instance do
 begin
  AddPicturePath(aFileName);
  TestName := '';
 end; // with TddPicturePathListner.Instance do
 aCtx.rCaller.CheckPictureOnly;
//#UC END# *5369FDE50394_5369FD7A00E8_impl*
end;//TkwScreenShot2FileWithCheck.DoAfterSave

class function TkwScreenShot2FileWithCheck.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ScreenShot2FileWithCheck';
end;//TkwScreenShot2FileWithCheck.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\ScreenShotCommon.imp.pas}
{$IfEnd} //not NoScripts

end.