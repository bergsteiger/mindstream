unit kwStringFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStringFactory.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::PrimitiveWords::TkwStringFactory
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
  kwString,
  kwStringList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStringFactory = class(TkwStringList)
 protected
 // overridden protected methods
   procedure InitFields; override;
 public
 // public methods
   function MakeKW(const aValue: Il3CString): TkwString;
 public
 // singleton factory method
   class function Instance: TkwStringFactory;
    {- возвращает экземпляр синглетона. }
 end;//TkwStringFactory
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a},
  SysUtils,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TkwStringFactory

var g_TkwStringFactory : TkwStringFactory = nil;

procedure TkwStringFactoryFree;
begin
 l3Free(g_TkwStringFactory);
end;

class function TkwStringFactory.Instance: TkwStringFactory;
begin
 if (g_TkwStringFactory = nil) then
 begin
  l3System.AddExitProc(TkwStringFactoryFree);
  g_TkwStringFactory := Create;
 end;
 Result := g_TkwStringFactory;
end;


function TkwStringFactory.MakeKW(const aValue: Il3CString): TkwString;
//#UC START# *4F3E41C603BC_4F3E416701E8_var*
const
 cLimit = 300;
var
 l_Len : Integer;
 l_Index : Integer;
 l_KW : TkwString;
//#UC END# *4F3E41C603BC_4F3E416701E8_var*
begin
//#UC START# *4F3E41C603BC_4F3E416701E8_impl*
 l_Len := l3Len(aValue);
 if (l_Len < cLimit) then
 begin
  if FindData(aValue, l_Index) then
   Result := Self.Items[l_Index].Use
  else
  begin
   l_KW := TkwString.Create(aValue);
   Result := l_KW;
   Self.DirectInsert(l_Index, l_KW);
  end;//FindData(aValue, l_Index)
 end//l_Len < cLimit
 else
  Result := TkwString.Create(aValue);
//#UC END# *4F3E41C603BC_4F3E416701E8_impl*
end;//TkwStringFactory.MakeKW

procedure TkwStringFactory.InitFields;
//#UC START# *47A042E100E2_4F3E416701E8_var*
//#UC END# *47A042E100E2_4F3E416701E8_var*
begin
//#UC START# *47A042E100E2_4F3E416701E8_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_4F3E416701E8_impl*
end;//TkwStringFactory.InitFields

{$IfEnd} //not NoScripts

end.