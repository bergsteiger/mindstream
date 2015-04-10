unit kwNodeText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNodeText.pas"
// Начат: 03.11.2011 18:39
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::TkwNodeText
//
// Кладёт на стек текст ноды
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
 TkwNodeText = class(_kwNodeFromStackWord_)
  {* Кладёт на стек текст ноды }
 protected
 // realized methods
   procedure DoNode(const aNode: Il3SimpleNode;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNodeText
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

type _Instance_R_ = TkwNodeText;

{$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}

// start class TkwNodeText

procedure TkwNodeText.DoNode(const aNode: Il3SimpleNode;
  const aCtx: TtfwContext);
//#UC START# *4EB2A5D802DE_4EB2A63703D6_var*
//#UC END# *4EB2A5D802DE_4EB2A63703D6_var*
begin
//#UC START# *4EB2A5D802DE_4EB2A63703D6_impl*
 aCtx.rEngine.PushString(aNode.Text);
//#UC END# *4EB2A5D802DE_4EB2A63703D6_impl*
end;//TkwNodeText.DoNode

class function TkwNodeText.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EB2A63703D6_var*
//#UC END# *4DB0614603C8_4EB2A63703D6_var*
begin
//#UC START# *4DB0614603C8_4EB2A63703D6_impl*
 Result := 'Node:Text';
//#UC END# *4DB0614603C8_4EB2A63703D6_impl*
end;//TkwNodeText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwNodeFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.