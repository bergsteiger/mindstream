unit tfwIncludeLike;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "tfwIncludeLike.pas"
// Начат: 06.05.2011 11:22
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::IncludesAndUses::TtfwIncludeLike
//
// Поддержка Include-совместимых слов.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwCompilingWord,
  kwIncluded,
  kwCompiledWordPrim,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwIncludeLike = {abstract} class(TtfwCompilingWord)
  {* Поддержка Include-совместимых слов. }
 protected
 // overridden protected methods
   procedure AfterCompile(var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function AcceptsKeyWordAfter(const aContext: TtfwContext;
     aWordNumber: Integer): Boolean; override;
   procedure DoStringToken(const aContext: TtfwContext;
     aCompiled: TtfwWord;
     const aString: Il3CString); override;
 protected
 // protected methods
   procedure DoIncluded(const aContext: TtfwContext;
     const aFileName: AnsiString);
   function GetIncludedClass: RkwIncluded; virtual;
   function MakeIncluded(const aFileName: AnsiString;
     const aContext: TtfwContext): TkwIncluded; virtual;
 end;//TtfwIncludeLike
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwIncludeLike

procedure TtfwIncludeLike.DoIncluded(const aContext: TtfwContext;
  const aFileName: AnsiString);
//#UC START# *4DC3A24D0330_4DC3A1A30235_var*
var
 l_I : TkwIncluded;
 l_S : AnsiString;
//#UC END# *4DC3A24D0330_4DC3A1A30235_var*
begin
//#UC START# *4DC3A24D0330_4DC3A1A30235_impl*
 l_S := aContext.ResolveIncludedFilePath(aFileName);
 l_I := MakeIncluded(l_S, aContext);
 try
  l_I.DoIt(aContext);
 finally
  FreeAndNil(l_I);
 end;//try..finally
//#UC END# *4DC3A24D0330_4DC3A1A30235_impl*
end;//TtfwIncludeLike.DoIncluded

function TtfwIncludeLike.GetIncludedClass: RkwIncluded;
//#UC START# *4F3AA4E10327_4DC3A1A30235_var*
//#UC END# *4F3AA4E10327_4DC3A1A30235_var*
begin
//#UC START# *4F3AA4E10327_4DC3A1A30235_impl*
 Result := TkwIncluded;
//#UC END# *4F3AA4E10327_4DC3A1A30235_impl*
end;//TtfwIncludeLike.GetIncludedClass

function TtfwIncludeLike.MakeIncluded(const aFileName: AnsiString;
  const aContext: TtfwContext): TkwIncluded;
//#UC START# *4F47673F03B0_4DC3A1A30235_var*
//#UC END# *4F47673F03B0_4DC3A1A30235_var*
begin
//#UC START# *4F47673F03B0_4DC3A1A30235_impl*
 Result := GetIncludedClass.Create(aFileName)
//#UC END# *4F47673F03B0_4DC3A1A30235_impl*
end;//TtfwIncludeLike.MakeIncluded

procedure TtfwIncludeLike.AfterCompile(var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4DC3A1A30235_var*
//#UC END# *4DB6CE2302C9_4DC3A1A30235_var*
begin
//#UC START# *4DB6CE2302C9_4DC3A1A30235_impl*
 CompilerAssert(not aCompiled.HasCode,
                'Внутри секции INCLUDE/USES нельзя определять слова',
                theNewContext.rPrev^);
 CompilerAssert(not aCompiled.HasLocalDictionary,
                'Внутри секции INCLUDE/USES нельзя определять слова',
                theNewContext.rPrev^);
 inherited;
//#UC END# *4DB6CE2302C9_4DC3A1A30235_impl*
end;//TtfwIncludeLike.AfterCompile

function TtfwIncludeLike.AcceptsKeyWordAfter(const aContext: TtfwContext;
  aWordNumber: Integer): Boolean;
//#UC START# *4DB9B502013D_4DC3A1A30235_var*
//#UC END# *4DB9B502013D_4DC3A1A30235_var*
begin
//#UC START# *4DB9B502013D_4DC3A1A30235_impl*
 Result := false;
//#UC END# *4DB9B502013D_4DC3A1A30235_impl*
end;//TtfwIncludeLike.AcceptsKeyWordAfter

procedure TtfwIncludeLike.DoStringToken(const aContext: TtfwContext;
  aCompiled: TtfwWord;
  const aString: Il3CString);
//#UC START# *4DC19432023E_4DC3A1A30235_var*
//#UC END# *4DC19432023E_4DC3A1A30235_var*
begin
//#UC START# *4DC19432023E_4DC3A1A30235_impl*
 DoIncluded(aContext, l3Str(aString));
//#UC END# *4DC19432023E_4DC3A1A30235_impl*
end;//TtfwIncludeLike.DoStringToken

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwIncludeLike
 TtfwIncludeLike.RegisterClass;
{$IfEnd} //not NoScripts

end.