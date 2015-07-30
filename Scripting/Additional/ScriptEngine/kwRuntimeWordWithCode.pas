unit kwRuntimeWordWithCode;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwRuntimeWordWithCode.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwRuntimeWordWithCode
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwWordRefList,
  kwCompiledWordPrim,
  tfwParserInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwRuntimeWordWithCode = {abstract} class(TkwCompiledWordPrim, ItfwCompiler)
 private
 // private fields
   f_Code : TtfwWordRefList;
    {* Поле для свойства Code}
 protected
 // realized methods
   procedure AddCodePart(aWord: TtfwWord;
    AtStartOfCode: Boolean;
    const aCtx: TtfwContext);
     {* Добавляет скомпилированный код к текущему компилируемуму слову }
   function GetWordCompilingNow: TtfwWord;
     {* Возвращает слово, которое в данный момент компилируется }
   procedure CompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord);
     {* Компилирует код извлечения входного параметра в код компилируемого слова }
   function Get_NewWordDefinitor: ItfwNewWordDefinitor;
   function Get_KeywordFinder: ItfwKeywordFinder;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // overridden public methods
   procedure DoAddCodePart(aWord: TtfwWord;
     AtStartOfCode: Boolean;
     const aCtx: TtfwContext); override;
   procedure ClearCode(const aCtx: TtfwContext); override;
   function HasCode: Boolean; override;
     {* Есть ли у слова компилированный код }
   function CodeCount: Integer; override;
     {* Число элементов скомпилированного кода }
   function GetCode(const aCtx: TtfwContext): TtfwWordRefList; override;
   function GetCompiler(const aCtx: TtfwContext): ItfwCompiler; override;
 protected
 // protected methods
   function GetNewWordDefinitor: ItfwNewWordDefinitor; virtual;
   function GetKeywordFinder: ItfwKeywordFinder; virtual;
   procedure DoCompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord); virtual;
 public
 // public properties
   property Code: TtfwWordRefList
     read f_Code;
 end;//TkwRuntimeWordWithCode
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  kwForwardDeclarationHolder
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwRuntimeWordWithCode

function TkwRuntimeWordWithCode.GetNewWordDefinitor: ItfwNewWordDefinitor;
//#UC START# *52D56341033B_52D55D7B0178_var*
//#UC END# *52D56341033B_52D55D7B0178_var*
begin
//#UC START# *52D56341033B_52D55D7B0178_impl*
 Supports(ItfwKeywordFinder(f_PrevFinder), ItfwNewWordDefinitor, Result);
//#UC END# *52D56341033B_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.GetNewWordDefinitor

function TkwRuntimeWordWithCode.GetKeywordFinder: ItfwKeywordFinder;
//#UC START# *52D5637A031E_52D55D7B0178_var*
//#UC END# *52D5637A031E_52D55D7B0178_var*
begin
//#UC START# *52D5637A031E_52D55D7B0178_impl*
 Result := ItfwKeywordFinder(f_PrevFinder);
//#UC END# *52D5637A031E_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.GetKeywordFinder

procedure TkwRuntimeWordWithCode.DoCompileInParameterPopCode(const aContext: TtfwContext;
  aParameterToPop: TtfwWord);
//#UC START# *52D56A980103_52D55D7B0178_var*
//#UC END# *52D56A980103_52D55D7B0178_var*
begin
//#UC START# *52D56A980103_52D55D7B0178_impl*
 CompilerAssert(false, 'Слово не может иметь входные параметры', aContext);
//#UC END# *52D56A980103_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.DoCompileInParameterPopCode

procedure TkwRuntimeWordWithCode.AddCodePart(aWord: TtfwWord;
  AtStartOfCode: Boolean;
  const aCtx: TtfwContext);
//#UC START# *4DB6E3090290_52D55D7B0178_var*
//#UC END# *4DB6E3090290_52D55D7B0178_var*
begin
//#UC START# *4DB6E3090290_52D55D7B0178_impl*
 DoAddCodePart(aWord, AtStartOfCode, aCtx);
//#UC END# *4DB6E3090290_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.AddCodePart

function TkwRuntimeWordWithCode.GetWordCompilingNow: TtfwWord;
//#UC START# *4F37AFC700E7_52D55D7B0178_var*
//#UC END# *4F37AFC700E7_52D55D7B0178_var*
begin
//#UC START# *4F37AFC700E7_52D55D7B0178_impl*
 Result := Self;
//#UC END# *4F37AFC700E7_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.GetWordCompilingNow

procedure TkwRuntimeWordWithCode.CompileInParameterPopCode(const aContext: TtfwContext;
  aParameterToPop: TtfwWord);
//#UC START# *4F416F900048_52D55D7B0178_var*
//#UC END# *4F416F900048_52D55D7B0178_var*
begin
//#UC START# *4F416F900048_52D55D7B0178_impl*
 DoCompileInParameterPopCode(aContext, aParameterToPop);
//#UC END# *4F416F900048_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.CompileInParameterPopCode

function TkwRuntimeWordWithCode.Get_NewWordDefinitor: ItfwNewWordDefinitor;
//#UC START# *52D5629102BC_52D55D7B0178get_var*
//#UC END# *52D5629102BC_52D55D7B0178get_var*
begin
//#UC START# *52D5629102BC_52D55D7B0178get_impl*
 Result := GetNewWordDefinitor;
//#UC END# *52D5629102BC_52D55D7B0178get_impl*
end;//TkwRuntimeWordWithCode.Get_NewWordDefinitor

function TkwRuntimeWordWithCode.Get_KeywordFinder: ItfwKeywordFinder;
//#UC START# *52D562AF0273_52D55D7B0178get_var*
//#UC END# *52D562AF0273_52D55D7B0178get_var*
begin
//#UC START# *52D562AF0273_52D55D7B0178get_impl*
 Result := GetKeywordFinder;
//#UC END# *52D562AF0273_52D55D7B0178get_impl*
end;//TkwRuntimeWordWithCode.Get_KeywordFinder

procedure TkwRuntimeWordWithCode.Cleanup;
//#UC START# *479731C50290_52D55D7B0178_var*
//#UC END# *479731C50290_52D55D7B0178_var*
begin
//#UC START# *479731C50290_52D55D7B0178_impl*
 FreeAndNil(f_Code);
 inherited;
//#UC END# *479731C50290_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.Cleanup

procedure TkwRuntimeWordWithCode.DoAddCodePart(aWord: TtfwWord;
  AtStartOfCode: Boolean;
  const aCtx: TtfwContext);
//#UC START# *4DB6CB1703AD_52D55D7B0178_var*
var
 l_Holder : TkwForwardDeclarationHolder;
//#UC END# *4DB6CB1703AD_52D55D7B0178_var*
begin
//#UC START# *4DB6CB1703AD_52D55D7B0178_impl*
 CompilerAssert(aWord <> Self, 'Циклическая ссылка', aCtx);
 // - чтобы избежать циклических ссылок
 if (f_Code = nil) then
  f_Code := TtfwWordRefList.Create;
 if aWord.IsForwardDeclaration {AND
    (TkwForwardDeclaration(aWord).RealWord = Self)}
    // - проверка специально убрана, т.к. бывает вложенность
    then
 // - чтобы избежать циклических ссылок
 begin
  l_Holder := TkwForwardDeclarationHolder.Create(aWord);
  try
   if AtStartOfCode then
    f_Code.Insert(0, l_Holder)
   else
    f_Code.Add(l_Holder);
  finally
   FreeAndNil(l_Holder);
  end;//try..finally
 end//aWord.IsForwardDeclaration
 else
 if AtStartOfCode then
  f_Code.Insert(0, aWord)
 else
  f_Code.Add(aWord);
//#UC END# *4DB6CB1703AD_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.DoAddCodePart

procedure TkwRuntimeWordWithCode.ClearCode(const aCtx: TtfwContext);
//#UC START# *4F48E1AB0388_52D55D7B0178_var*
//#UC END# *4F48E1AB0388_52D55D7B0178_var*
begin
//#UC START# *4F48E1AB0388_52D55D7B0178_impl*
 FreeAndNil(f_Code);
//#UC END# *4F48E1AB0388_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.ClearCode

function TkwRuntimeWordWithCode.HasCode: Boolean;
//#UC START# *52D40F640308_52D55D7B0178_var*
//#UC END# *52D40F640308_52D55D7B0178_var*
begin
//#UC START# *52D40F640308_52D55D7B0178_impl*
 Result := (Code <> nil) AND not Code.Empty;
//#UC END# *52D40F640308_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.HasCode

function TkwRuntimeWordWithCode.CodeCount: Integer;
//#UC START# *52D4191402A2_52D55D7B0178_var*
//#UC END# *52D4191402A2_52D55D7B0178_var*
begin
//#UC START# *52D4191402A2_52D55D7B0178_impl*
 if (Code = nil) then
  Result := 0
 else
  Result := Code.Count; 
//#UC END# *52D4191402A2_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.CodeCount

function TkwRuntimeWordWithCode.GetCode(const aCtx: TtfwContext): TtfwWordRefList;
//#UC START# *52D41C7F027B_52D55D7B0178_var*
//#UC END# *52D41C7F027B_52D55D7B0178_var*
begin
//#UC START# *52D41C7F027B_52D55D7B0178_impl*
 Result := Code;
//#UC END# *52D41C7F027B_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.GetCode

function TkwRuntimeWordWithCode.GetCompiler(const aCtx: TtfwContext): ItfwCompiler;
//#UC START# *52D523A40118_52D55D7B0178_var*
//#UC END# *52D523A40118_52D55D7B0178_var*
begin
//#UC START# *52D523A40118_52D55D7B0178_impl*
 Result := Self;
//#UC END# *52D523A40118_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.GetCompiler

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwRuntimeWordWithCode
 TkwRuntimeWordWithCode.RegisterClass;
{$IfEnd} //not NoScripts

end.