unit kwPopEditorGetParaByID;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorGetParaByID.pas"
// Начат: 03.11.2011 15:47
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetParaByID
//
// Получает от редактора параграф по его ID.
// 
// Пример:
// {code}
// 12 editor:GetParaByID
// IF
// Para:Text .
// ELSE
// 'Параграф не найден' .
// ENDIF
// {code}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackWord,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorGetParaByID = {scriptword} class(TkwEditorFromStackWord)
  {* Получает от редактора параграф по его ID.

Пример:
[code]
 12 editor:GetParaByID
 IF
  Para:Text .
 ELSE
 'Параграф не найден' .
 ENDIF
[code] }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetParaByID
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  nevTools
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorGetParaByID

procedure TkwPopEditorGetParaByID.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4EB27F0E00CF_var*
var
 l_O : InevObject;
 l_P : InevPara;
//#UC END# *4F4CB81200CA_4EB27F0E00CF_var*
begin
//#UC START# *4F4CB81200CA_4EB27F0E00CF_impl*
 if anEditor.TextSource.DocumentContainer.FindObjByID(aCtx.rEngine.PopInt, l_O) then
 begin
  if not l_O.AsObject.QT(InevPara, l_P) then
   RunnerError('', aCtx);
  aCtx.rEngine.PushIntf(l_P);
  aCtx.rEngine.PushBool(true);
 end//anEditor.TextSource.DocumentContainer.FindObjByID(anID, l_O)
 else
  aCtx.rEngine.PushBool(false);
//#UC END# *4F4CB81200CA_4EB27F0E00CF_impl*
end;//TkwPopEditorGetParaByID.DoWithEditor

class function TkwPopEditorGetParaByID.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetParaByID';
end;//TkwPopEditorGetParaByID.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetParaByID
 TkwPopEditorGetParaByID.RegisterInEngine;
{$IfEnd} //not NoScripts

end.