unit afwControl;

 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwBaseControl
  ;

type
 TafwControl = class(TafwBaseControl)
  {* Ѕазовый класс дл€ управл€ющих элементов }
 end;//TafwControl

implementation

uses
  Classes
  {$If not defined(NoScripts)}
  ,
  tfwClassRef
  {$IfEnd} //not NoScripts
  
  ;


initialization
{$If not defined(NoScripts)}
// –егистраци€ TafwControl
 TtfwClassRef.Register(TafwControl);
{$IfEnd} //not NoScripts

end.