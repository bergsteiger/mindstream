unit tfwArrayView;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwArrayView.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwArrayView
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3ProtoObject,
  tfwScriptingInterfaces,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwArrayView = class(Tl3ProtoObject, ItfwValueList)
 protected
 // realized methods
   function pm_GetFirst: TtfwStackValue;
   function pm_GetLast: TtfwStackValue;
   function pm_GetItems(anIndex: Integer): TtfwStackValue;
   function pm_GetEmpty: Boolean;
   function pm_GetCount: Integer;
 public
 // realized methods
   function IndexOf(const anItem: TtfwStackValue): Integer;
   function Add(const anItem: TtfwStackValue): Integer;
   procedure Clear;
   procedure ForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
   procedure ForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 protected
 // protected fields
   f_Other : ItfwValueList;
 protected
 // protected methods
   function Reverted: Boolean; virtual;
     {* Определяет тот факт, что исходный массив надо перебирать в обратном порядке }
 public
 // public methods
   constructor Create(const anOther: ItfwValueList); reintroduce;
   class function Make(const anOther: ItfwValueList): ItfwValueList; reintroduce;
     {* Сигнатура фабрики TtfwArrayView.Make }
   procedure DoForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext); virtual;
   procedure DoForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext); virtual;
 end;//TtfwArrayView
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwArrayView

constructor TtfwArrayView.Create(const anOther: ItfwValueList);
//#UC START# *52E2710E03D9_52E270AE02EA_var*
//#UC END# *52E2710E03D9_52E270AE02EA_var*
begin
//#UC START# *52E2710E03D9_52E270AE02EA_impl*
 inherited Create;
 f_Other := anOther;
//#UC END# *52E2710E03D9_52E270AE02EA_impl*
end;//TtfwArrayView.Create

function TtfwArrayView.Reverted: Boolean;
//#UC START# *52E271570101_52E270AE02EA_var*
//#UC END# *52E271570101_52E270AE02EA_var*
begin
//#UC START# *52E271570101_52E270AE02EA_impl*
 Result := false;
//#UC END# *52E271570101_52E270AE02EA_impl*
end;//TtfwArrayView.Reverted

class function TtfwArrayView.Make(const anOther: ItfwValueList): ItfwValueList;
var
 l_Inst : TtfwArrayView;
begin
 l_Inst := Create(anOther);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TtfwArrayView.DoForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E666F6036E_52E270AE02EA_var*
//#UC END# *52E666F6036E_52E270AE02EA_var*
begin
//#UC START# *52E666F6036E_52E270AE02EA_impl*
 f_Other.ForEachBack(aLambda, aCtx);
//#UC END# *52E666F6036E_52E270AE02EA_impl*
end;//TtfwArrayView.DoForEachBack

procedure TtfwArrayView.DoForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E666E80335_52E270AE02EA_var*
//#UC END# *52E666E80335_52E270AE02EA_var*
begin
//#UC START# *52E666E80335_52E270AE02EA_impl*
 f_Other.ForEach(aLambda, aCtx);
//#UC END# *52E666E80335_52E270AE02EA_impl*
end;//TtfwArrayView.DoForEach

function TtfwArrayView.pm_GetFirst: TtfwStackValue;
//#UC START# *47D8233603DD_52E270AE02EAget_var*
//#UC END# *47D8233603DD_52E270AE02EAget_var*
begin
//#UC START# *47D8233603DD_52E270AE02EAget_impl*
 Result := f_Other.First;
//#UC END# *47D8233603DD_52E270AE02EAget_impl*
end;//TtfwArrayView.pm_GetFirst

function TtfwArrayView.pm_GetLast: TtfwStackValue;
//#UC START# *47D823570315_52E270AE02EAget_var*
//#UC END# *47D823570315_52E270AE02EAget_var*
begin
//#UC START# *47D823570315_52E270AE02EAget_impl*
 Result := f_Other.Last;
//#UC END# *47D823570315_52E270AE02EAget_impl*
end;//TtfwArrayView.pm_GetLast

function TtfwArrayView.pm_GetItems(anIndex: Integer): TtfwStackValue;
//#UC START# *47D8248802AD_52E270AE02EAget_var*
//#UC END# *47D8248802AD_52E270AE02EAget_var*
begin
//#UC START# *47D8248802AD_52E270AE02EAget_impl*
 Result := f_Other.Items[anIndex];
//#UC END# *47D8248802AD_52E270AE02EAget_impl*
end;//TtfwArrayView.pm_GetItems

function TtfwArrayView.pm_GetEmpty: Boolean;
//#UC START# *47E381E203D2_52E270AE02EAget_var*
//#UC END# *47E381E203D2_52E270AE02EAget_var*
begin
//#UC START# *47E381E203D2_52E270AE02EAget_impl*
 Result := f_Other.Empty;
//#UC END# *47E381E203D2_52E270AE02EAget_impl*
end;//TtfwArrayView.pm_GetEmpty

function TtfwArrayView.IndexOf(const anItem: TtfwStackValue): Integer;
//#UC START# *482955910076_52E270AE02EA_var*
//#UC END# *482955910076_52E270AE02EA_var*
begin
//#UC START# *482955910076_52E270AE02EA_impl*
 Result := f_Other.IndexOf(anItem);
//#UC END# *482955910076_52E270AE02EA_impl*
end;//TtfwArrayView.IndexOf

function TtfwArrayView.Add(const anItem: TtfwStackValue): Integer;
//#UC START# *482958A203D0_52E270AE02EA_var*
//#UC END# *482958A203D0_52E270AE02EA_var*
begin
//#UC START# *482958A203D0_52E270AE02EA_impl*
 Result := f_Other.Add(anItem);
//#UC END# *482958A203D0_52E270AE02EA_impl*
end;//TtfwArrayView.Add

function TtfwArrayView.pm_GetCount: Integer;
//#UC START# *4BB08B8902F2_52E270AE02EAget_var*
//#UC END# *4BB08B8902F2_52E270AE02EAget_var*
begin
//#UC START# *4BB08B8902F2_52E270AE02EAget_impl*
 Result := f_Other.Count;
//#UC END# *4BB08B8902F2_52E270AE02EAget_impl*
end;//TtfwArrayView.pm_GetCount

procedure TtfwArrayView.Clear;
//#UC START# *4F62FF5D0327_52E270AE02EA_var*
//#UC END# *4F62FF5D0327_52E270AE02EA_var*
begin
//#UC START# *4F62FF5D0327_52E270AE02EA_impl*
 f_Other.Clear;
//#UC END# *4F62FF5D0327_52E270AE02EA_impl*
end;//TtfwArrayView.Clear

procedure TtfwArrayView.ForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23B7A00EC_52E270AE02EA_var*
//#UC END# *52E23B7A00EC_52E270AE02EA_var*
begin
//#UC START# *52E23B7A00EC_52E270AE02EA_impl*
 DoForEach(aLambda, aCtx);
//#UC END# *52E23B7A00EC_52E270AE02EA_impl*
end;//TtfwArrayView.ForEach

procedure TtfwArrayView.ForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23BB102FA_52E270AE02EA_var*
//#UC END# *52E23BB102FA_52E270AE02EA_var*
begin
//#UC START# *52E23BB102FA_52E270AE02EA_impl*
 DoForEachBack(aLambda, aCtx);
//#UC END# *52E23BB102FA_52E270AE02EA_impl*
end;//TtfwArrayView.ForEachBack

{$If not defined(DesignTimeLibrary)}
class function TtfwArrayView.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_52E270AE02EA_var*
//#UC END# *47A6FEE600FC_52E270AE02EA_var*
begin
//#UC START# *47A6FEE600FC_52E270AE02EA_impl*
 Result := true;
//#UC END# *47A6FEE600FC_52E270AE02EA_impl*
end;//TtfwArrayView.IsCacheable
{$IfEnd} //not DesignTimeLibrary

procedure TtfwArrayView.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_Other := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TtfwArrayView.ClearFields

{$IfEnd} //not NoScripts

end.