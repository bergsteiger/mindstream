unit kwNodeIsFirst;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNodeIsFirst.pas"
// Начат: 21.12.2011 21:35
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::TkwNodeIsFirst
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
 TkwNodeIsFirst = class(_kwNodeFromStackWord_)
 protected
 // realized methods
   procedure DoNode(const aNode: Il3SimpleNode;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNodeIsFirst
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

type _Instance_R_ = TkwNodeIsFirst;

{$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}

// start class TkwNodeIsFirst

procedure TkwNodeIsFirst.DoNode(const aNode: Il3SimpleNode;
  const aCtx: TtfwContext);
//#UC START# *4EB2A5D802DE_4EF218BD0185_var*
//#UC END# *4EB2A5D802DE_4EF218BD0185_var*
begin
//#UC START# *4EB2A5D802DE_4EF218BD0185_impl*
 aCtx.rEngine.PushBool(aNode.IsFirst);
//#UC END# *4EB2A5D802DE_4EF218BD0185_impl*
end;//TkwNodeIsFirst.DoNode

class function TkwNodeIsFirst.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EF218BD0185_var*
//#UC END# *4DB0614603C8_4EF218BD0185_var*
begin
//#UC START# *4DB0614603C8_4EF218BD0185_impl*
 Result := 'Node:IsFirst';
//#UC END# *4DB0614603C8_4EF218BD0185_impl*
end;//TkwNodeIsFirst.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.