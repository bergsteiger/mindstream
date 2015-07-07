unit kwPopEditorUpdateCursorFromHotSpotEx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorUpdateCursorFromHotSpotEx.pas"
// Начат: 08.09.2011 19:20
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_UpdateCursorFromHotSpotEx
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
 TkwPopEditorUpdateCursorFromHotSpotEx = class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorUpdateCursorFromHotSpotEx
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

type _Instance_R_ = TkwPopEditorUpdateCursorFromHotSpotEx;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

type
  TevCustomEditorWindowHack = class(TevCustomEditorWindow)
  end;//TevCustomEditorWindowHack

// start class TkwPopEditorUpdateCursorFromHotSpotEx

procedure TkwPopEditorUpdateCursorFromHotSpotEx.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E68DD3B01A2_var*
var
 l_X, l_Y : Integer;
//#UC END# *4F4CB81200CA_4E68DD3B01A2_var*
begin
//#UC START# *4F4CB81200CA_4E68DD3B01A2_impl*
 l_Y := aCtx.rEngine.PopInt;
 l_X := aCtx.rEngine.PopInt;
 TevCustomEditorWindowHack(anEditor).UpdateCursorFromHotSpotEx(l_X, l_Y);
//#UC END# *4F4CB81200CA_4E68DD3B01A2_impl*
end;//TkwPopEditorUpdateCursorFromHotSpotEx.DoWithEditor

class function TkwPopEditorUpdateCursorFromHotSpotEx.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:UpdateCursorFromHotSpotEx';
end;//TkwPopEditorUpdateCursorFromHotSpotEx.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.