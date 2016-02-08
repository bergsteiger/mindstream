unit afwTextControl;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwInterfaces
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  ,
  afwTextControlPrim
  ;

type
//#UC START# *48BBF1470238ci*
//#UC END# *48BBF1470238ci*
 TafwTextControl = class(TafwTextControlPrim, IafwTextControl)
 private
 // private methods
   function CaptionStored: Boolean;
 protected
 // realized methods
   function pm_GetCCaption: IafwCString;
   procedure pm_SetCCaption(const aValue: IafwCString);
//#UC START# *48BBF1470238publ*
    public
    // public properties
      property Caption
        stored CaptionStored;
        {-}
//#UC END# *48BBF1470238publ*
 end;//TafwTextControl

implementation

uses
  l3String
  {$If not defined(NoScripts)}
  ,
  tfwClassRef
  {$IfEnd} //not NoScripts
  
  ;

type
  THackLink = class(TControlActionLink)
  end;//THackLink

// start class TafwTextControl

function TafwTextControl.CaptionStored: Boolean;
//#UC START# *48BBF3DD019D_48BBF1470238_var*
//#UC END# *48BBF3DD019D_48BBF1470238_var*
begin
//#UC START# *48BBF3DD019D_48BBF1470238_impl*
 Result := not l3IsNil(CCaption) AND
           ((ActionLink = nil) or not THackLink(ActionLink).IsCaptionLinked);
//#UC END# *48BBF3DD019D_48BBF1470238_impl*
end;//TafwTextControl.CaptionStored

function TafwTextControl.pm_GetCCaption: IafwCString;
//#UC START# *473DAC05025F_48BBF1470238get_var*
//#UC END# *473DAC05025F_48BBF1470238get_var*
begin
//#UC START# *473DAC05025F_48BBF1470238get_impl*
 Result := CCaption;
//#UC END# *473DAC05025F_48BBF1470238get_impl*
end;//TafwTextControl.pm_GetCCaption

procedure TafwTextControl.pm_SetCCaption(const aValue: IafwCString);
//#UC START# *473DAC05025F_48BBF1470238set_var*
//#UC END# *473DAC05025F_48BBF1470238set_var*
begin
//#UC START# *473DAC05025F_48BBF1470238set_impl*
 CCaption := aValue;
//#UC END# *473DAC05025F_48BBF1470238set_impl*
end;//TafwTextControl.pm_SetCCaption

//#UC START# *48BBF1470238impl*
//#UC END# *48BBF1470238impl*

initialization
{$If not defined(NoScripts)}
// Регистрация TafwTextControl
 TtfwClassRef.Register(TafwTextControl);
{$IfEnd} //not NoScripts

end.