unit kwEditorFromStackNextParaWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwEditorFromStackNextParaWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::TkwEditorFromStackNextParaWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  kwEditorFromStackTextParaWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwEditorFromStackNextParaWord = {abstract} class(TkwEditorFromStackTextParaWord)
 protected
 // realized methods
   procedure DoPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 protected
 // protected methods
   procedure DoNextPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); virtual; abstract;
 end;//TkwEditorFromStackNextParaWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evOp,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwEditorFromStackNextParaWord

procedure TkwEditorFromStackNextParaWord.DoPara(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPara: InevPara);
//#UC START# *50BA0BBD01BF_50BA0C4E001B_var*
//#UC END# *50BA0BBD01BF_50BA0C4E001B_var*
begin
//#UC START# *50BA0BBD01BF_50BA0C4E001B_impl*
 DoNextPara(aCtx, anEditor, aPara.Next);
//#UC END# *50BA0BBD01BF_50BA0C4E001B_impl*
end;//TkwEditorFromStackNextParaWord.DoPara

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwEditorFromStackNextParaWord
 TkwEditorFromStackNextParaWord.RegisterClass;
{$IfEnd} //not NoScripts

end.