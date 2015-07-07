unit kwGetMember;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGetMember.pas"
// Начат: 15.02.2012 19:15
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MembersWorking::MembersWorkingPack::GetMember
//
// Добирается до вложенного слова
// Пример:
// {code}
// : WithTest
// 
// : A
// : B
// : C
// 'Hello' .
// ;
// 20 .
// ;
// 10 .
// ;
// 
// :: A  B ; DO
// :: A  B  C ; DO
// 
// ;
// 
// WithTest
// {code}
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
  l3Interfaces,
  l3ParserInterfaces,
  kwCompiledWordPrim,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}
 TkwGetMember = {final} class(_tfwAnonimousWord_)
  {* Добирается до вложенного слова
Пример:
[code]
: WithTest

 : A
  : B
   : C
    'Hello' .
   ;
   20 .
  ;
  10 .
 ;
 
 :: A  B ; DO
 :: A  B  C ; DO
 
;

WithTest
[code] }
 private
 // private fields
   f_PrevWord : TtfwWord;
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure BeforeCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext); override;
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   procedure UnknownWord(var aContext: TtfwContext); override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function SupressNextImmediate: TtfwSuppressNextImmediate; override;
   procedure AfterCodePartAdded(aWord: TtfwWord;
     var aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGetMember
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledMembersPath,
  tfwWordRefList,
  kwStandardProcedureCloseBracket,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  SysUtils,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGetMember;

{$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}

// start class TkwGetMember

function TkwGetMember.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F3BCBF303D6_var*
//#UC END# *4DB6C99F026E_4F3BCBF303D6_var*
begin
//#UC START# *4DB6C99F026E_4F3BCBF303D6_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F3BCBF303D6_impl*
end;//TkwGetMember.EndBracket

procedure TkwGetMember.Cleanup;
//#UC START# *479731C50290_4F3BCBF303D6_var*
//#UC END# *479731C50290_4F3BCBF303D6_var*
begin
//#UC START# *479731C50290_4F3BCBF303D6_impl*
 f_PrevWord := nil;
 inherited;
//#UC END# *479731C50290_4F3BCBF303D6_impl*
end;//TkwGetMember.Cleanup

class function TkwGetMember.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '::';
end;//TkwGetMember.GetWordNameForRegister

procedure TkwGetMember.BeforeCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext);
//#UC START# *4DB6CDDA038B_4F3BCBF303D6_var*
//#UC END# *4DB6CDDA038B_4F3BCBF303D6_var*
begin
//#UC START# *4DB6CDDA038B_4F3BCBF303D6_impl*
 inherited;
 f_PrevWord := nil;
//#UC END# *4DB6CDDA038B_4F3BCBF303D6_impl*
end;//TkwGetMember.BeforeCompile

procedure TkwGetMember.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4F3BCBF303D6_var*
var
 l_L : TtfwWordRefList;
 l_Index : Integer;
 l_W : TtfwWord;
 l_C : TtfwWord;
//#UC END# *4DB6CE2302C9_4F3BCBF303D6_var*
begin
//#UC START# *4DB6CE2302C9_4F3BCBF303D6_impl*
 l_L := aCompiled.GetCode(aPrevContext);
 CompilerAssert((l_L <> nil) AND
                (l_L.Count > 0{1}),
                'Пустой путь к элементу',
                aPrevContext
               );
 l_W := nil;
 for l_Index := 0 to Pred(l_L.Count) do
 begin
  l_C := l_L.Items[l_Index];
  CompilerAssert((l_C Is TkwCompiledWordPrim),
                 Format('Элемент %s не является компилированным словом',
                        [l_C.Key.AsString]),
                 aPrevContext
                );
  if (l_W <> nil) then
  begin
   CompilerAssert(l_C.ParentWord = l_W,
                  Format('Элемент %s не является дочерним к %s',
                         [
                          l_C.Key.AsString,
                          l_W.Key.AsString
                         ]),
                  aPrevContext
                 );
  end;//l_W <> nil
  l_W := l_C; 
 end;//for l_Index
 DoCompiledWord(l_L.Last, aPrevContext);
(* while (aCompiled.Code.Count > 1) do
  aCompiled.Code.Delete(0);*)
 // - оставляем только последний элемент
 inherited; 
//#UC END# *4DB6CE2302C9_4F3BCBF303D6_impl*
end;//TkwGetMember.AfterCompile

procedure TkwGetMember.UnknownWord(var aContext: TtfwContext);
//#UC START# *4DB6F2760023_4F3BCBF303D6_var*
(*var
 l_KW : TtfwKeyWord;
 l_W : TtfwWord;*)
//#UC END# *4DB6F2760023_4F3BCBF303D6_var*
begin
//#UC START# *4DB6F2760023_4F3BCBF303D6_impl*
(* Assert(f_PrevWord <> nil);
 l_KW := (f_PrevWord.LocalDictionary.Keywords.DRbyName[aContext.rParser.TokenLongString]);
 Assert(l_KW <> nil);
 l_W := l_KW.Word;
 if (l_W <> nil) then
 begin
  theCompiled.DoAddCodePart(l_W, false, aContext);
  AfterCodePartAdded(l_W, aContext);
 end//l_W <> nil
 else*)
// есресь <<LibSupport>> - СТЕРЕОТИП 
  inherited;
//#UC END# *4DB6F2760023_4F3BCBF303D6_impl*
end;//TkwGetMember.UnknownWord

function TkwGetMember.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F3BCBF303D6_var*
//#UC END# *4DBAEE0D028D_4F3BCBF303D6_var*
begin
//#UC START# *4DBAEE0D028D_4F3BCBF303D6_impl*
 Result := TkwCompiledMembersPath;
//#UC END# *4DBAEE0D028D_4F3BCBF303D6_impl*
end;//TkwGetMember.CompiledWordClass

function TkwGetMember.SupressNextImmediate: TtfwSuppressNextImmediate;
//#UC START# *4F3AB3B101FC_4F3BCBF303D6_var*
//#UC END# *4F3AB3B101FC_4F3BCBF303D6_var*
begin
//#UC START# *4F3AB3B101FC_4F3BCBF303D6_impl*
 Result := tfw_sniYes;
//#UC END# *4F3AB3B101FC_4F3BCBF303D6_impl*
end;//TkwGetMember.SupressNextImmediate

procedure TkwGetMember.AfterCodePartAdded(aWord: TtfwWord;
  var aCtx: TtfwContext);
//#UC START# *4F3BCE1501F0_4F3BCBF303D6_var*
//#UC END# *4F3BCE1501F0_4F3BCBF303D6_var*
begin
//#UC START# *4F3BCE1501F0_4F3BCBF303D6_impl*
 f_PrevWord := aWord;
 aCtx.rParser.KeyWords := f_PrevWord.GetCompiler(aCtx).KeywordFinder;
 // - чтобы можно было искать ВНУТРИ aWord 
//#UC END# *4F3BCE1501F0_4F3BCBF303D6_impl*
end;//TkwGetMember.AfterCodePartAdded

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}
{$IfEnd} //not NoScripts

end.