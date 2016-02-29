unit tfwAxiomaticsResNameGetter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwAxiomaticsResNameGetter.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptedAxiomatics::TtfwAxiomaticsResNameGetter
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
type
 RtfwAxiomaticsResNameGetter = class of TtfwAxiomaticsResNameGetter;

 TtfwAxiomaticsResNameGetter = class
 public
 // public methods
   class function ResName: AnsiString; virtual; abstract;
   class procedure Register;
 end;//TtfwAxiomaticsResNameGetter
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAxiomaticsResNameGetters
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwAxiomaticsResNameGetter

class procedure TtfwAxiomaticsResNameGetter.Register;
//#UC START# *55B8C6800184_55B7A33101AF_var*
//#UC END# *55B8C6800184_55B7A33101AF_var*
begin
//#UC START# *55B8C6800184_55B7A33101AF_impl*
 if (TtfwAxiomaticsResNameGetters.Instance.IndexOf(Self) < 0) then
  TtfwAxiomaticsResNameGetters.Instance.Add(Self);
//#UC END# *55B8C6800184_55B7A33101AF_impl*
end;//TtfwAxiomaticsResNameGetter.Register

{$IfEnd} //not NoScripts

end.