unit AFWTest;

 
{$Include w:\common\components\l3Define.inc}

interface

implementation

{$If not defined(XE)}
uses
  MenuItem_p,
  Menu_p,
  Control_p,
  WinControl_p,
  Component_p,
  tc5OpenApp {a},
  tc6OpenApp {a}
  ;
{$IfEnd} //not XE

end.