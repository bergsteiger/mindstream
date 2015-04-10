unit kwPopEditorUpdateCursorFromHotSpot;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorUpdateCursorFromHotSpot.pas"
// Начат: 08.09.2011 18:57
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_UpdateCursorFromHotSpot
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
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 TkwPopEditorUpdateCursorFromHotSpot = class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorUpdateCursorFromHotSpot
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorUpdateCursorFromHotSpot;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

type
  TevCustomEditorWindowHack = class(TevCustomEditorWindow)
  end;//TevCustomEditorWindowHack

// start class TkwPopEditorUpdateCursorFromHotSpot

procedure TkwPopEditorUpdateCursorFromHotSpot.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E68D7D10110_var*
//#UC END# *4F4CB81200CA_4E68D7D10110_var*
begin
//#UC START# *4F4CB81200CA_4E68D7D10110_impl*
 TevCustomEditorWindowHack(anEditor).UpdateCursorFromHotSpot;
//#UC END# *4F4CB81200CA_4E68D7D10110_impl*
end;//TkwPopEditorUpdateCursorFromHotSpot.DoWithEditor

class function TkwPopEditorUpdateCursorFromHotSpot.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:UpdateCursorFromHotSpot';
end;//TkwPopEditorUpdateCursorFromHotSpot.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.