unit l3CustomOtherListView;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoObject,
  l3CustomSortIntegerList
  ;

type
//#UC START# *4DEFAF2300F9ci*
 Tl3CustomOtherListView = class;
//#UC END# *4DEFAF2300F9ci*
 Tl3OtherListSorter = class(Tl3CustomSortIntegerList)
 private
 // private fields
   f_View : Tl3CustomOtherListView;
 protected
 // realized methods
   function CompareItems(A: Integer;
    B: Integer): Integer; override;
     {* Функция сравнения элементов }
 public
 // public methods
   constructor Create(aView: Tl3CustomOtherListView); reintroduce;
//#UC START# *4DEFAF2300F9publ*
//#UC END# *4DEFAF2300F9publ*
 end;//Tl3OtherListSorter

 Tl3CustomOtherListView = {abstract} class(Tl3ProtoObject)
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 protected
 // protected fields
   f_Sorter : Tl3OtherListSorter;
 protected
 // protected methods
   function CompareItems(anIndex1: Integer;
     anIndex2: Integer): Integer; virtual; abstract;
   function OtherListCount: Integer; virtual; abstract;
 public
 // public methods
   procedure Sort;
 end;//Tl3CustomOtherListView

implementation

uses
  SysUtils
  ;

// start class Tl3CustomOtherListView

procedure Tl3CustomOtherListView.Sort;
//#UC START# *4DEFB88B038D_4DEFAF740194_var*
var
 l_Index : Integer;
//#UC END# *4DEFB88B038D_4DEFAF740194_var*
begin
//#UC START# *4DEFB88B038D_4DEFAF740194_impl*
 if (f_Sorter = nil) then
  f_Sorter := Tl3OtherListSorter.Create(Self)
 else
  f_Sorter.Clear;
 for l_Index := 0 to Pred(OtherListCount) do
  f_Sorter.Add(l_Index);
  // - добавляем индексы и в итоге получаем их в нужном порядке
//#UC END# *4DEFB88B038D_4DEFAF740194_impl*
end;//Tl3CustomOtherListView.Sort
// start class Tl3OtherListSorter

constructor Tl3OtherListSorter.Create(aView: Tl3CustomOtherListView);
//#UC START# *4DEFB06A0296_4DEFAF2300F9_var*
//#UC END# *4DEFB06A0296_4DEFAF2300F9_var*
begin
//#UC START# *4DEFB06A0296_4DEFAF2300F9_impl*
 inherited Create;
 f_View := aView;
//#UC END# *4DEFB06A0296_4DEFAF2300F9_impl*
end;//Tl3OtherListSorter.Create

function Tl3OtherListSorter.CompareItems(A: Integer;
  B: Integer): Integer;
//#UC START# *4DEFACE1002D_4DEFAF2300F9_var*
//#UC END# *4DEFACE1002D_4DEFAF2300F9_var*
begin
//#UC START# *4DEFACE1002D_4DEFAF2300F9_impl*
 Result := f_View.CompareItems(A, B);
//#UC END# *4DEFACE1002D_4DEFAF2300F9_impl*
end;//Tl3OtherListSorter.CompareItems

//#UC START# *4DEFAF2300F9impl*
//#UC END# *4DEFAF2300F9impl*

procedure Tl3CustomOtherListView.Cleanup;
//#UC START# *479731C50290_4DEFAF740194_var*
//#UC END# *479731C50290_4DEFAF740194_var*
begin
//#UC START# *479731C50290_4DEFAF740194_impl*
 if (f_Sorter <> nil) then
  f_Sorter.f_View := nil;
 FreeAndNil(f_Sorter);
 inherited;
//#UC END# *479731C50290_4DEFAF740194_impl*
end;//Tl3CustomOtherListView.Cleanup

procedure Tl3CustomOtherListView.InitFields;
//#UC START# *47A042E100E2_4DEFAF740194_var*
//#UC END# *47A042E100E2_4DEFAF740194_var*
begin
//#UC START# *47A042E100E2_4DEFAF740194_impl*
 inherited;
 Sort;
//#UC END# *47A042E100E2_4DEFAF740194_impl*
end;//Tl3CustomOtherListView.InitFields

end.