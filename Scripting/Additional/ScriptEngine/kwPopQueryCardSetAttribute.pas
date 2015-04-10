unit kwPopQueryCardSetAttribute;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopQueryCardSetAttribute.pas"
// Начат: 26.09.2011 18:38
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::QueryCardProcessing::pop_QueryCard_SetAttribute
//
// Добавляет атрибут к текущей карточке запроса.
// 
// *Пример:*
// {code}
// моп::Поиск_Поиск_лекарственного_средства
// 'AT_PHARM_NAME' 'Аргинин' Search:SetAttribute
// 'AT_PHARM_ATC' 'A. Пищеварительный тракт и обмен веществ' Search:SetAttribute
// 'AT_PHARM_ATC' 'B. Препараты влияющие на кроветворение и кровь' Search:SetAttribute
// Ok
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
  l3Interfaces,
  nevBase,
  evQueryCardInt,
  evQueryCardEditor,
  tfwScriptingInterfaces,
  evCustomEditorWindow,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}
 TkwPopQueryCardSetAttribute = class(_kwQueryCardFromStackWord_)
  {* Добавляет атрибут к текущей карточке запроса.

*Пример:*
[code]
 моп::Поиск_Поиск_лекарственного_средства
 'AT_PHARM_NAME' 'Аргинин' Search:SetAttribute
 'AT_PHARM_ATC' 'A. Пищеварительный тракт и обмен веществ' Search:SetAttribute
 'AT_PHARM_ATC' 'B. Препараты влияющие на кроветворение и кровь' Search:SetAttribute
 Ok
[code] }
 private
 // private methods
   procedure DoModelImpl(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor);
 protected
 // realized methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopQueryCardSetAttribute
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Base,
  evReqIterator,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopQueryCardSetAttribute;

{$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}

// start class TkwPopQueryCardSetAttribute

procedure TkwPopQueryCardSetAttribute.DoModelImpl(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
var
 l_Name : Il3CString;
 l_Value : Il3CString;
 l_Op : InevOp;

 procedure CallIterator;

  function DoIt(const anItem: IevReq): Boolean;
  //#UC START# *6E7B54AC5B25__var*
  var
   l_F : IevEditorControlField;
  //#UC END# *6E7B54AC5B25__var*
  begin
  //#UC START# *6E7B54AC5B25__impl*
   if l3Same(l_Name, anItem.ReqName) then
   begin
    Result := false;
    l_F := anItem.FirstField;
    if not l3IsNil(anItem.FirstField.Text) then
     l_F := anItem.AddField(aCard.View, true);
    if (l_F = nil) then
    // - поле не добавилось, видимо есть ограничение на количество полей,
    //   заполняем по-новой, то что уже заполнено
     l_F := anItem.FirstField;
    l_F.Text := l_Value;
    l_F.SynchronizeSelectedValueWithText{TextChange(aCard.View, l_F.Para, l_Op)};
    Exit;
   end//l3Same(l_Name, anItem.ReqName)
   else
   if l3Starts(l3Str(anItem.ReqName)+'#', l3PCharLen(l_Name)) then
   // http://mdp.garant.ru/pages/viewpage.action?pageId=290953660
   // - костыль для заполнения "второго" поля. Вообще говоря надо это сделать
   //   как-то аккуратнее
   begin
    Result := false;
    l_F := anItem.LastField;
    {if not l3IsNil(anItem.LastField.Text) then
    begin
     l_F := nil;
     //l_F := anItem.AddField(aCard.View, true);
    end;//not l3IsNil(anItem.LastField.Text)
    if (l_F = nil) then
    // - поле не добавилось, видимо есть ограничение на количество полей,
    //   заполняем по-новой, то что уже заполнено
     l_F := anItem.LastField;}
    l_F.Text := l_Value;
    l_F.SynchronizeSelectedValueWithText{TextChange(aCard.View, l_F.Para, l_Op)};
    Exit;
   end//l3Same(l_Name, anItem.ReqName)
   else
    Result := true;
  //#UC END# *6E7B54AC5B25__impl*
  end;//DoIt

 //#UC START# *4E81ADFF02AC__var*
 //#UC END# *4E81ADFF02AC__var*
 begin
  //#UC START# *4E81ADFF02ACiter*
  TevReqIterator.Make(aCard).
  //#UC END# *4E81ADFF02ACiter*
   DoReqF(L2IevReqIteratorDoReqAction(@DoIt));
 end;//CallIterator

//#UC START# *4E81A3090197_4E808E3E026E_var*
//#UC END# *4E81A3090197_4E808E3E026E_var*
begin
//#UC START# *4E81A3090197_4E808E3E026E_impl*
 l_Value := aCtx.rEngine.PopString;
 l_Name := aCtx.rEngine.PopString;
 l_Op := aCard.StartOp;
 try
  CallIterator;
 finally
  l_Op := nil;
 end;//try..finally
//#UC END# *4E81A3090197_4E808E3E026E_impl*
end;//TkwPopQueryCardSetAttribute.DoModelImpl

procedure TkwPopQueryCardSetAttribute.DoCard(const aCtx: TtfwContext;
  aCard: TevQueryCardEditor);
//#UC START# *4E808E8B01BB_4E808E3E026E_var*
//#UC END# *4E808E8B01BB_4E808E3E026E_var*
begin
//#UC START# *4E808E8B01BB_4E808E3E026E_impl*
 DoModelImpl(aCtx, aCard);
//#UC END# *4E808E8B01BB_4E808E3E026E_impl*
end;//TkwPopQueryCardSetAttribute.DoCard

class function TkwPopQueryCardSetAttribute.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:QueryCard:SetAttribute';
end;//TkwPopQueryCardSetAttribute.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwQueryCardFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.