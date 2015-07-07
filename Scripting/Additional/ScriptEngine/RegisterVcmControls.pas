unit RegisterVcmControls;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/RegisterVcmControls.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::RegisterVcmControls
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVCM)}
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  vcmMenuManager,
  TB97Tlbr,
  vcmToolbar
  {$If defined(Nemesis)}
  ,
  nscTasksPanelView
  {$IfEnd} //Nemesis
  ,
  tfwClassRef,
  elCustomButtonEdit,
  ComCtrls,
  vtNavigator
  {$If not defined(NoVGScene)}
  ,
  vgRemindersLineForm
  {$IfEnd} //not NoVGScene
  
  {$If defined(Nemesis)}
  ,
  nscNavigator
  {$IfEnd} //Nemesis
  
  ;

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
//#UC START# *52B16BBF00B4*
 {$If not defined(NoVGScene)}
 TtfwClassRef.Register(TvgRemindersLineForm);
 {$IfEnd} //not NoVGScene
 //TtfwClassRef.Register(Ttb97MoreButton);    http://mdp.garant.ru/pages/viewpage.action?pageId=534064480&focusedCommentId=536186046#comment-536186046
 TtfwClassRef.Register(TvcmSeparatorDef);
 TtfwClassRef.Register(TCustomUpDown);
 TtfwClassRef.Register(TnscTasksPanelHideField);
 TtfwClassRef.Register(TnpSplitter);

 TtfwClassRef.Register(TvcmComboBox);
 TtfwClassRef.Register(TvcmDockPanel);
 TtfwClassRef.Register(TvcmToolButtonDef);
 TtfwClassRef.Register(TvcmDockDef);
 TtfwClassRef.Register(TvcmToolbar);
 TtfwClassRef.Register(Ttb97MoreButton);
 TtfwClassRef.Register(TelCustomButtonEdit);
 TtfwClassRef.Register(TnscNavigatorPageControl);
 {$If (not Defined(nsTest) OR Defined(InsiderTest)) AND not Defined(nsTool) AND Defined(Nemesis) AND not Defined(NewGen)}
 TtfwClassRef.Register(TnscTasksPanelTreeView);
 {$IfEnd}
//#UC END# *52B16BBF00B4*
{$IfEnd} //not NoScripts AND not NoVCM

end.