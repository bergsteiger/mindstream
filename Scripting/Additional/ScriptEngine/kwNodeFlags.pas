unit kwNodeFlags;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNodeFlags.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::TkwNodeFlags
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
 TkwNodeFlags = class(_kwNodeFromStackWord_)
 protected
 // realized methods
   procedure DoNode(const aNode: Il3SimpleNode;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNodeFlags
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

type _Instance_R_ = TkwNodeFlags;

{$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}

// start class TkwNodeFlags

procedure TkwNodeFlags.DoNode(const aNode: Il3SimpleNode;
  const aCtx: TtfwContext);
//#UC START# *4EB2A5D802DE_4F27F96703C2_var*
//#UC END# *4EB2A5D802DE_4F27F96703C2_var*
begin
//#UC START# *4EB2A5D802DE_4F27F96703C2_impl*
 aCtx.rEngine.PushInt(aNode.Flags);
//#UC END# *4EB2A5D802DE_4F27F96703C2_impl*
end;//TkwNodeFlags.DoNode

class function TkwNodeFlags.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F27F96703C2_var*
//#UC END# *4DB0614603C8_4F27F96703C2_var*
begin
//#UC START# *4DB0614603C8_4F27F96703C2_impl*
 Result := 'Node:Flags';
//#UC END# *4DB0614603C8_4F27F96703C2_impl*
end;//TkwNodeFlags.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.