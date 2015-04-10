unit tfwCStringArray;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwCStringArray.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CString::TtfwCStringArray
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
  l3Interfaces,
  tfwCStringList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ItemType_ = Il3CString;
 _l3OpenArray_Parent_ = TtfwCStringList;
 {$Include w:\common\components\rtl\Garant\L3\l3OpenArray.imp.pas}
 TtfwCStringArray = class(_l3OpenArray_)
 end;//TtfwCStringArray
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TtfwCStringArray;

{$Include w:\common\components\rtl\Garant\L3\l3OpenArray.imp.pas}


{$IfEnd} //not NoScripts
end.