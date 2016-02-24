unit l3TreeFilters;

 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3CacheableBase,
  l3TreeInterfaces
  ;

type
 Tl3TreeFilters = class(Tl3CacheableBase, Il3TreeFilters)
  {* Содержит фильтры дерева. [$96481887] }
 private
 // private fields
   f_Context : Il3CString;
 protected
 // realized methods
   function SetContext(const aValue: Il3CString): Il3TreeFilters;
   function Clone: Il3TreeFilters;
   function pm_GetContext: Il3CString;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(const aSource: Il3TreeFilters); reintroduce; virtual;
   class function Make(const aSource: Il3TreeFilters = nil): Il3TreeFilters; reintroduce;
 end;//Tl3TreeFilters

implementation

// start class Tl3TreeFilters

constructor Tl3TreeFilters.Create(const aSource: Il3TreeFilters);
//#UC START# *48FF4F47010F_48FF4EC501F6_var*
//#UC END# *48FF4F47010F_48FF4EC501F6_var*
begin
//#UC START# *48FF4F47010F_48FF4EC501F6_impl*
 inherited Create;
 if Assigned(aSource) then
  f_Context := aSource.Context;
//#UC END# *48FF4F47010F_48FF4EC501F6_impl*
end;//Tl3TreeFilters.Create

class function Tl3TreeFilters.Make(const aSource: Il3TreeFilters = nil): Il3TreeFilters;
var
 l_Inst : Tl3TreeFilters;
begin
 l_Inst := Create(aSource);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3TreeFilters.SetContext(const aValue: Il3CString): Il3TreeFilters;
//#UC START# *47724B790382_48FF4EC501F6_var*
//#UC END# *47724B790382_48FF4EC501F6_var*
begin
//#UC START# *47724B790382_48FF4EC501F6_impl*
 f_Context := aValue;
 Result := Self;
//#UC END# *47724B790382_48FF4EC501F6_impl*
end;//Tl3TreeFilters.SetContext

function Tl3TreeFilters.Clone: Il3TreeFilters;
//#UC START# *47724B87036B_48FF4EC501F6_var*
//#UC END# *47724B87036B_48FF4EC501F6_var*
begin
//#UC START# *47724B87036B_48FF4EC501F6_impl*
 Result := Make(Self);
//#UC END# *47724B87036B_48FF4EC501F6_impl*
end;//Tl3TreeFilters.Clone

function Tl3TreeFilters.pm_GetContext: Il3CString;
//#UC START# *47724B9402ED_48FF4EC501F6get_var*
//#UC END# *47724B9402ED_48FF4EC501F6get_var*
begin
//#UC START# *47724B9402ED_48FF4EC501F6get_impl*
 Result := f_Context;
//#UC END# *47724B9402ED_48FF4EC501F6get_impl*
end;//Tl3TreeFilters.pm_GetContext

procedure Tl3TreeFilters.Cleanup;
//#UC START# *479731C50290_48FF4EC501F6_var*
//#UC END# *479731C50290_48FF4EC501F6_var*
begin
//#UC START# *479731C50290_48FF4EC501F6_impl*
 f_Context := nil;
 inherited;
//#UC END# *479731C50290_48FF4EC501F6_impl*
end;//Tl3TreeFilters.Cleanup

end.