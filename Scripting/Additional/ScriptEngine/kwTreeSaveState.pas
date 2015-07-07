unit kwTreeSaveState;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeSaveState.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::TreeSaveState
//
// Сохранить состояние дерева в файл.
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
  tfwScriptingInterfaces,
  vtOutliner,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
 TkwTreeSaveState = class(_kwTreeControlWord_)
  {* Сохранить состояние дерева в файл. }
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeSaveState
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3TreeInterfaces,
  l3Filer,
  l3Nodes,
  l3String,
  l3Types,
  l3Tree_TLB,
  l3Interfaces,
  l3Base,
  l3Chars,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTreeSaveState;

{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

// start class TkwTreeSaveState

procedure TkwTreeSaveState.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_4E0B2EC30052_var*
var
 l_F : Tl3CustomDosFiler;
 
 function lp_IterateNode(const aCurNode : Il3Node) : Boolean;
 var
  i       : Integer;
  l_CStr  : Il3CString;
  l_Name  : AnsiString;
  l_Level : Integer;
 begin
  Result := True;
  l_Name  := '';
  with aTreeControl.CTree do
  begin
   if not aTreeControl.CTree.IsExpanded(aCurNode.ParentNode) then Exit;
   l_Level := GetLevel(aCurNode);
   if ShowRoot then Dec(l_Level);
  end; // with aTreeControl.CTree do
  for i := l_Level downto 2 do
   l_Name := l_Name + '  ';
  l_CStr := l3CStr(aCurNode.Text);
  l3DeleteChars(l_CStr, [cc_SoftEnter, cc_HardEnter, cc_SoftSpace]);
  l_Name := Format('%s%s - Flags: %d', [l_Name, l3Str(l_CStr), aCurNode.Flags]);
  l_F.WriteLn(l_Name);
 end;

var
 l_S : AnsiString;
//#UC END# *4E01B8F1008E_4E0B2EC30052_var*
begin
//#UC START# *4E01B8F1008E_4E0B2EC30052_impl*
 l_S := aCtx.rCaller.ResolveOutputFilePath(aCtx.rEngine.PopDelphiString);
 l_S := ChangeFileExt(l_S, '.tree');
 l_F := Tl3CustomDosFiler.Make(l_S, l3_fmWrite, false);
 try
  l_F.Open;
  aTreeControl.CTree.CRootNode.IterateF(l3L2NA(@lp_IterateNode), imExpandOnly);
  l_F.Close;
 finally
  FreeAndNil(l_F);
 end;//try..finally
//#UC END# *4E01B8F1008E_4E0B2EC30052_impl*
end;//TkwTreeSaveState.DoTreeContol

class function TkwTreeSaveState.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:SaveState2File';
end;//TkwTreeSaveState.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.