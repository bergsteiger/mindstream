unit l3_Base;

{$Include l3Define.inc}

interface

uses
  l3SimpleObject,
  l3PureMixIns
  ;

type
 _l3Changing_Parent_ = Tl3SimpleObject;
 {$Include l3Changing.imp.pas}
 Tl3_Base = class(_l3Changing_)
  {* ! Базовый класс объектов библиотеки L3. Рекомендуется для наследования от него остальных разрабатываемых объектов. Поддерживает контроль за распределением памяти и освобождением объектов. }
 public
 // public methods
   function OCompare(anObject: Tl3_Base): Integer; virtual;
     {* функция сравнения объекта с другим объектом. }
   constructor Create; reintroduce; virtual;
     {* конструктор объекта. Возвращает объект, со счетчиком ссылок равным 1. }
 end;//Tl3_Base

implementation

uses
  l3Base
  ;

{$Include l3Changing.imp.pas}

// start class Tl3_Base

function Tl3_Base.OCompare(anObject: Tl3_Base): Integer;
//#UC START# *478CEE670214_47879856035F_var*
//#UC END# *478CEE670214_47879856035F_var*
begin
//#UC START# *478CEE670214_47879856035F_impl*
 Assert(false);
 Result := -1;
//#UC END# *478CEE670214_47879856035F_impl*
end;//Tl3_Base.OCompare

constructor Tl3_Base.Create;
//#UC START# *47914F960008_47879856035F_var*
//#UC END# *47914F960008_47879856035F_var*
begin
//#UC START# *47914F960008_47879856035F_impl*
 inherited Create;
//#UC END# *47914F960008_47879856035F_impl*
end;//Tl3_Base.Create

end.