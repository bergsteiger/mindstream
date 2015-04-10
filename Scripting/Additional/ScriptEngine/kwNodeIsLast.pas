unit kwNodeIsLast;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNodeIsLast.pas"
// Начат: 21.12.2011 21:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::TkwNodeIsLast
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
  l3TreeInterfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}
 TkwNodeIsLast = class(_kwNodeFromStackWord_)
 protected
 // realized methods
   procedure DoNode(const aNode: Il3SimpleNode;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNodeIsLast
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwNodeIsLast;

{$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}

// start class TkwNodeIsLast

procedure TkwNodeIsLast.DoNode(const aNode: Il3SimpleNode;
  const aCtx: TtfwContext);
//#UC START# *4EB2A5D802DE_4EF218FA01EE_var*
//#UC END# *4EB2A5D802DE_4EF218FA01EE_var*
begin
//#UC START# *4EB2A5D802DE_4EF218FA01EE_impl*
 aCtx.rEngine.PushBool(aNode.IsLast);
//#UC END# *4EB2A5D802DE_4EF218FA01EE_impl*
end;//TkwNodeIsLast.DoNode

class function TkwNodeIsLast.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EF218FA01EE_var*
//#UC END# *4DB0614603C8_4EF218FA01EE_var*
begin
//#UC START# *4DB0614603C8_4EF218FA01EE_impl*
 Result := 'Node:IsLast';
//#UC END# *4DB0614603C8_4EF218FA01EE_impl*
end;//TkwNodeIsLast.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.