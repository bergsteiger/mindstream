unit kwMain;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwMain.pas"
// Начат: 10.05.2011 13:49
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwMain
//
// Поддержка основного кода скрипта.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwScriptEnginePrim,
  tfwAxiomaticsResNameGetter,
  kwCompiledWordPrim,
  tfwStreamFactory
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwMain = class(TtfwScriptEnginePrim)
  {* Поддержка основного кода скрипта. }
 private
 // private methods
   class procedure CompileScriptToAxiomatics(const aContext: TtfwContext;
     const aScriptCode: array of AnsiString);
     {* Компилируем скипт в аксиоматику }
   class procedure CompileScriptToAxiomaticsIfDefined(const aContext: TtfwContext;
     const aDefined: array of AnsiString;
     const aScriptCode: array of AnsiString);
   class procedure CompileResScriptToAxiomatics(const aContext: TtfwContext;
     const aResName: AnsiString);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
   procedure BeforeCompile(var theNewContext: TtfwContext); override;
   procedure AfterCompile(var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function AcceptsEOF: Boolean; override;
   class function ReallyNeedRegister: Boolean; override;
 public
 // overridden public methods
   procedure RunCompiled(const aContext: TtfwContext); override;
   procedure Script(aStream: TtfwStreamFactory;
     const aCaller: ItfwScriptCaller); override;
 end;//TkwMain
{$IfEnd} //not NoScripts

  {$If not defined(NoScripts)}
var
   g_ScriptEngine : TkwMain;
  {$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwSystemIncluded,
  l3Memory,
  l3_String,
  SysUtils,
  l3String,
  l3Chars,
  l3Base,
  l3Stream,
  l3Types,
  kwCompiledMain,
  seThreadSupport,
  tfwFileStreamFactory,
  tfwCOMStreamFactory,
  tfwStringStreamFactory,
  l3EtalonsService,
  tfwResourceStreamFactory,
  tfwAutoregisteredDiction,
  tfwAxiomaticsResNameGetters,
  tfwCompiledAxiomaticsRes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type
//#UC START# *5F598AAE50EEci*
//#UC END# *5F598AAE50EEci*
  TkwMainResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
   {* Регистрация скриптованой аксиоматики }
  public
  // realized methods
   class function ResName: AnsiString; override;
//#UC START# *5F598AAE50EEpubl*
//#UC END# *5F598AAE50EEpubl*
  end;//TkwMainResNameGetter

// start class TkwMainResNameGetter

class function TkwMainResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'kwMain';
end;//TkwMainResNameGetter.ResName

 {$R kwMain.res}

class procedure TkwMain.CompileScriptToAxiomatics(const aContext: TtfwContext;
  const aScriptCode: array of AnsiString);
//#UC START# *5282326A0233_4DC90A1E03C2_var*
var
 l_String : Tl3_String;
 l_Index : Integer;
 l_Stream : TtfwStringStreamFactory;
 l_SI : TkwSystemIncluded;
//#UC END# *5282326A0233_4DC90A1E03C2_var*
begin
//#UC START# *5282326A0233_4DC90A1E03C2_impl*
 l_String := Tl3_String.Create;
 try
  for l_Index := Low(aScriptCode) to High(aScriptCode) do
  begin
   l_String.Append(l3PCharLen(aScriptCode[l_Index]));
   l_String.Append(cc_EOLStr);
  end;//for l_Index
  l_Stream := TtfwStringStreamFactory.Create(l_String.AsString);
  try
   l_SI := TkwSystemIncluded.Create(l_Stream);
   try
    l_SI.DoIt(aContext);
   finally
    FreeAndNil(l_SI);
   end;//try..finally
  finally
   FreeAndNil(l_Stream);
  end;//try..finally
 finally
  FreeAndNil(l_String);
 end;//try..finally
//#UC END# *5282326A0233_4DC90A1E03C2_impl*
end;//TkwMain.CompileScriptToAxiomatics

class procedure TkwMain.CompileScriptToAxiomaticsIfDefined(const aContext: TtfwContext;
  const aDefined: array of AnsiString;
  const aScriptCode: array of AnsiString);
//#UC START# *5293232E0291_4DC90A1E03C2_var*
var
 l_Index : Integer;
//#UC END# *5293232E0291_4DC90A1E03C2_var*
begin
//#UC START# *5293232E0291_4DC90A1E03C2_impl*
 for l_Index := Low(aDefined) to High(aDefined) do
  if not TtfwAutoregisteredDiction.Instance.CheckDictionaryByWordAndUse(TtfwCStringFactory.C(aDefined[l_Index])) then
  //if (aContext.rEngine.KeywordByName(TtfwCStringFactory.C(aDefined[l_Index])) = nil) then
   // - одно из слов не определено - ничего компилировать нельзя
   Exit;
 CompileScriptToAxiomatics(aContext, aScriptCode);
//#UC END# *5293232E0291_4DC90A1E03C2_impl*
end;//TkwMain.CompileScriptToAxiomaticsIfDefined

class procedure TkwMain.CompileResScriptToAxiomatics(const aContext: TtfwContext;
  const aResName: AnsiString);
//#UC START# *55795E7700D1_4DC90A1E03C2_var*
var
 l_Stream : TtfwResourceStreamFactory;
 l_SI : TkwSystemIncluded;
 l_Index : Integer;
//#UC END# *55795E7700D1_4DC90A1E03C2_var*
begin
//#UC START# *55795E7700D1_4DC90A1E03C2_impl*
 with TtfwCompiledAxiomaticsRes.Instance do
 begin
  if FindData(aResName, l_Index) then
   Exit
  else
   Add(aResName); 
 end;//with TtfwCompiledAxiomaticsRes.Instance
 l_Stream := TtfwResourceStreamFactory.Create(aResName);
 try
  l_SI := TkwSystemIncluded.Create(l_Stream);
  try
   l_SI.DoIt(aContext);
  finally
   FreeAndNil(l_SI);
  end;//try..finally
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
//#UC END# *55795E7700D1_4DC90A1E03C2_impl*
end;//TkwMain.CompileResScriptToAxiomatics

procedure TkwMain.Cleanup;
//#UC START# *479731C50290_4DC90A1E03C2_var*
//#UC END# *479731C50290_4DC90A1E03C2_var*
begin
//#UC START# *479731C50290_4DC90A1E03C2_impl*
 inherited;
//#UC END# *479731C50290_4DC90A1E03C2_impl*
end;//TkwMain.Cleanup

function TkwMain.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DC90A1E03C2_var*
//#UC END# *4DB6C99F026E_4DC90A1E03C2_var*
begin
//#UC START# *4DB6C99F026E_4DC90A1E03C2_impl*
 Result := nil;
//#UC END# *4DB6C99F026E_4DC90A1E03C2_impl*
end;//TkwMain.EndBracket

procedure TkwMain.BeforeCompile(var theNewContext: TtfwContext);
//#UC START# *4DB6CDDA038B_4DC90A1E03C2_var*
var
 l_S  : IStream;
 l_SI : TkwSystemIncluded;
 l_SystemFilename : AnsiString;
 l_NS             : TtfwFileStreamFactory;
 l_Index : Integer;
 l_Name : AnsiString;
//#UC END# *4DB6CDDA038B_4DC90A1E03C2_var*
begin
//#UC START# *4DB6CDDA038B_4DC90A1E03C2_impl*
 inherited;
 if not TtfwAutoregisteredDiction.Instance.AllAxiomaticsDefined then
 try

  CompileResScriptToAxiomatics(theNewContext.rPrev^, 'res:kwMain');

  CompileScriptToAxiomatics(theNewContext.rPrev^, [
   {$IfNDef NoVCM}
   'CONST ANYUSERTYPE 31',
   {$EndIf  NoVCM}

   {$IfDef Nemesis}
   {$IfNDef Admin}
   // http://mdp.garant.ru/pages/viewpage.action?pageId=284164589
   'CONST LLO_AND 1',
   'CONST LLO_OR 2',
   'CONST LLO_AND_NOT 3',
   'CONST LLO_NONE 4',
   // http://mdp.garant.ru/pages/viewpage.action?pageId=284164589
   {$EndIf  Admin}

   'PROCEDURE "Задержка имени Жени Кусакина"',
   ' 3 LOOP OnTest',
   ' 200 SLEEP',
   ' 3 LOOP OnTest',
   ' // - это шаманство из-за таймера Жени Кусакина',
   ' // http://mdp.garant.ru/pages/viewpage.action?pageId=296627734',
   ';',

   'WordAlias "Дождаться переключения вкладок" "Задержка имени Жени Кусакина"',

   'CONST fsNormal 0',
   'CONST fsMDIChild 1',
   'CONST fsMDIForm 2',
   'CONST fsStayOnTop 3'
   {$EndIf Nemesis}
  ]);
  
  {$IfNDef NoVCM}
  CompileScriptToAxiomaticsIfDefined(theNewContext.rPrev^,
  ['vcm:History:DeleteBackItem'],
  [
   'WordAlias history:DeleteBackItem vcm:History:DeleteBackItem'
  ]);

  CompileScriptToAxiomaticsIfDefined(theNewContext.rPrev^,
  ['vcm:History:DeleteForwardItem'],
  [
   'WordAlias history:DeleteForwardItem vcm:History:DeleteForwardItem'
  ]);


  CompileScriptToAxiomaticsIfDefined(theNewContext.rPrev^,
  ['моп::Поиск_Поиск_лекарственных_средств', 'Ok', 'history:DeleteBackItem'],
  [
   'PROCEDURE RunInpharmSearch OBJECT IN aProc',
   ' // - запускает поиск по КЗ Инфарма',
   ' моп::Поиск_Поиск_лекарственных_средств',
   ' aProc DO',
   ' Ok',
   ' OnTest',
   ' history:DeleteBackItem',
   ' // - удаляем предыдущий элемент истории (КЗ)',
   '; // RunInpharmSearch'

  ]);

  CompileScriptToAxiomaticsIfDefined(theNewContext.rPrev^,
  ['ППР_Prim'],
  [
   'PROCEDURE ППР',
   ' ППР_Prim',
   ' OnTest',
   '; // ППР'
  ]);

  CompileScriptToAxiomaticsIfDefined(theNewContext.rPrev^,
  ['ППС_Стандартная_Prim'],
  [
   'PROCEDURE "ППС Стандартная"',
   ' ППС_Стандартная_Prim',
   ' OnTest',
   '; // "ППС Стандартная"'
  ]);

  CompileScriptToAxiomaticsIfDefined(theNewContext.rPrev^,
  ['ППС_Преемственная_Prim'],
  [
   'PROCEDURE "ППС Преемственная"',
   ' ППС_Преемственная_Prim',
   ' OnTest',
   '; // "ППС Преемственная"'
  ]);

  CompileScriptToAxiomaticsIfDefined(theNewContext.rPrev^,
  ['ППР', 'Ok', 'history:DeleteBackItem', 'class::TevQueryCardEditor', 'focused:control:push'],
  [
   'PROCEDURE RunSearch OBJECT IN aProc',
   ' // - запускает поиск по КЗ ППР',
   ' vcm:Dispatcher:Lock',
   ' TRY',
   '  ППР',
   '  OBJECT VAR l_QC',
   '  focused:control:push >>> l_QC',
   '  l_QC IS class::TevQueryCardEditor',
   '   ?ASSURE ''Фокус не в КЗ''',
   '  aProc DO',
   '  Ok',
   '  OnTest',
   '  history:DeleteBackItem',
   '  // - удаляем предыдущий элемент истории (КЗ)',
   ' FINALLY',
   '  vcm:Dispatcher:Unlock',
   ' END',
   '; // RunSearch'
  ]);

  CompileScriptToAxiomaticsIfDefined(theNewContext.rPrev^,
  ['моп::Мониторинги_Обзор_изменений_законодательства', 'моп::Инфарм_Основное_меню_ИнФарм', 'Ok',
   'history:DeleteBackItem', 'history:DeleteForwardItem',
   'class::TevQueryCardEditor', 'focused:control:push',
   'wait:Choice', 'waited:?',
   'оп::История_Назад'],
  [
   'PROCEDURE RunLegislationReviewSearch OBJECT IN aProc',
   ' // - запускает поиск по КЗ ОИЗ',
   ' vcm:Dispatcher:Lock',
   ' TRY',
   '  моп::Мониторинги_Обзор_изменений_законодательства',
   '  OBJECT VAR l_QC',
   '  BOOLEAN VAR l_NotFound',
   '  l_NotFound := false',
   '  focused:control:push >>> l_QC',
   '  l_QC IS class::TevQueryCardEditor ?ASSURE ''Фокус не в КЗ''',
   '  aProc DO',
   '  2 wait:Choice',
   '  TRY',
   '   Ok',
   '   OnTest',
   '  FINALLY',
   '   TRY',
   '    waited:? ?ASSURE ''Не дождались выбора''',
   '    true >>> l_NotFound',
   '   EXCEPT',
   '    DROP',
   '    false >>> l_NotFound',
   '   END',
   '   if l_NotFound then (',
   '    оп::История_Назад',
   '    OnTest',
   '    history:DeleteForwardItem',
   '   )',
   '   else',
   '    history:DeleteBackItem',
   '  END',         
   ' FINALLY',
   '  vcm:Dispatcher:Unlock',
   ' END',
   '; // RunLegislationReviewSearch'
  ]);

  {$EndIf  NoVCM}

  CompileScriptToAxiomatics(theNewContext.rPrev^, [
   {$IfDef Nemesis}

   ' CONST defNemesis 0'

   {$IfDef Admin}
   ,
   ' CONST defAdmin 1'
   {$EndIf Admin}

   {$IfDef Monitorings}
   ,
   ' CONST defPrime 2'
   {$EndIf Monitorings}

   {$IfDef Shell}
   ,
   ' CONST defF1 3'
   {$EndIf Shell}

   {$Else  Nemesis}

   {$IfDef Archi}
   ' CONST defArchi 4'
   {$Else  Archi}
   {$IfDef EverestLite}
   ' CONST defEverestLite 4'
   {$EndIf EverestLite}
   {$EndIf Archi}

   {$EndIf Nemesis}
  ]);

  with TtfwAxiomaticsResNameGetters.Instance do
   for l_Index := 0 to Pred(Count) do
   begin
    l_Name := Items[l_Index].ResName;
    CompileResScriptToAxiomatics(theNewContext.rPrev^, 'res:' + l_Name);
   end;//for l_Index
 finally
  TtfwAutoregisteredDiction.Instance.AllAxiomaticsDefined := true;
 end;//try..finally

 l_SystemFilename := theNewContext.rPrev^.ResolveIncludedFilePath('Exports.script');
 if FileExists(l_SystemFilename) then
 begin
  l_NS := TtfwFileStreamFactory.Create(l_SystemFilename);
  try
   l_SI := TkwSystemIncluded.Create(l_NS);
   try
    l_SI.DoIt(theNewContext.rPrev^);
   finally
    FreeAndNil(l_SI);
   end;//try..finally
  finally
   FreeAndNil(l_NS);
  end;//try..finally
 end;//FileExists(l_SystemFilename);

 l_SystemFilename := theNewContext.rPrev^.ResolveIncludedFilePath('Exports.ms.dict');
 if FileExists(l_SystemFilename) then
 begin
  l_NS := TtfwFileStreamFactory.Create(l_SystemFilename);
  try
   l_SI := TkwSystemIncluded.Create(l_NS);
   try
    l_SI.DoIt(theNewContext.rPrev^);
   finally
    FreeAndNil(l_SI);
   end;//try..finally
  finally
   FreeAndNil(l_NS);
  end;//try..finally
 end;//FileExists(l_SystemFilename);
//#UC END# *4DB6CDDA038B_4DC90A1E03C2_impl*
end;//TkwMain.BeforeCompile

procedure TkwMain.AfterCompile(var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4DC90A1E03C2_var*
//#UC END# *4DB6CE2302C9_4DC90A1E03C2_var*
begin
//#UC START# *4DB6CE2302C9_4DC90A1E03C2_impl*
 inherited;
//#UC END# *4DB6CE2302C9_4DC90A1E03C2_impl*
end;//TkwMain.AfterCompile

function TkwMain.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4DC90A1E03C2_var*
//#UC END# *4DBAEE0D028D_4DC90A1E03C2_var*
begin
//#UC START# *4DBAEE0D028D_4DC90A1E03C2_impl*
 Result := TkwCompiledMain;
//#UC END# *4DBAEE0D028D_4DC90A1E03C2_impl*
end;//TkwMain.CompiledWordClass

function TkwMain.AcceptsEOF: Boolean;
//#UC START# *4DC2DEE70178_4DC90A1E03C2_var*
//#UC END# *4DC2DEE70178_4DC90A1E03C2_var*
begin
//#UC START# *4DC2DEE70178_4DC90A1E03C2_impl*
 Result := true;
//#UC END# *4DC2DEE70178_4DC90A1E03C2_impl*
end;//TkwMain.AcceptsEOF

class function TkwMain.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_4DC90A1E03C2_var*
//#UC END# *4DC2E05B03DD_4DC90A1E03C2_var*
begin
//#UC START# *4DC2E05B03DD_4DC90A1E03C2_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_4DC90A1E03C2_impl*
end;//TkwMain.ReallyNeedRegister

procedure TkwMain.RunCompiled(const aContext: TtfwContext);
//#UC START# *4DC90A79006D_4DC90A1E03C2_var*
//#UC END# *4DC90A79006D_4DC90A1E03C2_var*
begin
//#UC START# *4DC90A79006D_4DC90A1E03C2_impl*
 Tl3EtalonsService.Instance.EtalonNeedsComputerName := false;
 Tl3EtalonsService.Instance.EtalonNeedsOSName := false;
 {$IfDef XE}
 Tl3EtalonsService.Instance.EtalonNeedsXE := false;
 {$EndIf XE}
 Tl3EtalonsService.Instance.EtalonNeeds64 := false;
 inherited;
//#UC END# *4DC90A79006D_4DC90A1E03C2_impl*
end;//TkwMain.RunCompiled

procedure TkwMain.Script(aStream: TtfwStreamFactory;
  const aCaller: ItfwScriptCaller);
//#UC START# *4F733B9C0064_4DC90A1E03C2_var*
var
 l_PrevScriptEngine : TkwMain;
//#UC END# *4F733B9C0064_4DC90A1E03C2_var*
begin
//#UC START# *4F733B9C0064_4DC90A1E03C2_impl*
 l_PrevScriptEngine := g_ScriptEngine;
 try
  g_ScriptEngine := Self;
  inherited Script(aStream, aCaller);
 finally
  g_ScriptEngine := l_PrevScriptEngine;
 end;//try..finally
//#UC END# *4F733B9C0064_4DC90A1E03C2_impl*
end;//TkwMain.Script

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwMain
 TkwMain.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TkwMainResNameGetter.Register;
{$IfEnd} //not NoScripts

end.