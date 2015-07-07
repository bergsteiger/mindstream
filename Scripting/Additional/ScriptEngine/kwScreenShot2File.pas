unit kwScreenShot2File;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwScreenShot2File.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::ScreenShot2File
//
// Описание: снимает скриншот с передаваемого контрола и сохраняет его в файл bmp. Формат:
// {code}
// aFileName aHeight aWidth aTop aLeft aHandle ScreenShot2File
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
// l_FileName 200 200 0 0 l_Handle ScreenShot2File
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
 TkwScreenShot2File = {final} class(_ScreenShotCommon_)
  {* Описание: снимает скриншот с передаваемого контрола и сохраняет его в файл bmp. Формат:
[code]
aFileName aHeight aWidth aTop aLeft aHandle ScreenShot2File
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
  l_FileName 200 200 0 0 l_Handle ScreenShot2File
[code] }
 protected
 // realized methods
   procedure DoAfterSave(const aFileName: AnsiString;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwScreenShot2File
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Graphics,
  SysUtils,
  l3ImageUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwScreenShot2File;

{$Include ..\ScriptEngine\ScreenShotCommon.imp.pas}

// start class TkwScreenShot2File

procedure TkwScreenShot2File.DoAfterSave(const aFileName: AnsiString;
  const aCtx: TtfwContext);
//#UC START# *5369FDE50394_5369E170038B_var*
//#UC END# *5369FDE50394_5369E170038B_var*
begin
//#UC START# *5369FDE50394_5369E170038B_impl*
//#UC END# *5369FDE50394_5369E170038B_impl*
end;//TkwScreenShot2File.DoAfterSave

class function TkwScreenShot2File.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ScreenShot2File';
end;//TkwScreenShot2File.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\ScreenShotCommon.imp.pas}
{$IfEnd} //not NoScripts

end.