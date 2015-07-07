unit IterateWindowsUtils;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/IterateWindowsUtils.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::IterateWindowsUtils
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
  Windows,
  tfwScriptingInterfaces
  ;

type
 TIterateWindowsRec = record
   rCtx : PtfwContext;
   rEnumMethod : TtfwWord;
 end;//TIterateWindowsRec

 PIterateWindowsRec = ^TIterateWindowsRec;
function IterateWindowsMethod(hWindow: THandle;
  aData: PIterateWindowsRec): Boolean; stdcall;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
// unit methods

function IterateWindowsMethod(hWindow: THandle;
  aData: PIterateWindowsRec): Boolean;
//#UC START# *510AB608018E_510AB5AF0278_var*
//#UC END# *510AB608018E_510AB5AF0278_var*
begin
//#UC START# *510AB608018E_510AB5AF0278_impl*
 Result := True;
 try
  aData.rCtx.rEngine.PushInt(Integer(hWindow));
  aData.rEnumMethod.DoIt(aData.rCtx^);
 except
  on EtfwBreakIterator do
   Result := False;
 end;//try..except
//#UC END# *510AB608018E_510AB5AF0278_impl*
end;//IterateWindowsMethod
{$IfEnd} //not NoScripts

end.