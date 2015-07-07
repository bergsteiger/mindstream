unit tfwCStringArraySing;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwCStringArraySing.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CString::TtfwCStringArraySing
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
  tfwCStringArray
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwCStringArraySing = class(TtfwCStringArray)
 public
 // singleton factory method
   class function Instance: TtfwCStringArraySing;
    {- возвращает экземпляр синглетона. }
 end;//TtfwCStringArraySing
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoScripts


{$If not defined(NoScripts)}

// start class TtfwCStringArraySing

var g_TtfwCStringArraySing : TtfwCStringArraySing = nil;

procedure TtfwCStringArraySingFree;
begin
 l3Free(g_TtfwCStringArraySing);
end;

class function TtfwCStringArraySing.Instance: TtfwCStringArraySing;
begin
 if (g_TtfwCStringArraySing = nil) then
 begin
  l3System.AddExitProc(TtfwCStringArraySingFree);
  g_TtfwCStringArraySing := Create;
 end;
 Result := g_TtfwCStringArraySing;
end;

{$IfEnd} //not NoScripts


end.