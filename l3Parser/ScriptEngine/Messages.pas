unit Messages;

interface

type
 TMessage = record
  {* Сообщение Windows. }
 end;//TMessage

 TWMKeyDown = record
 end;//TWMKeyDown

const
  { Msg Codes }
 WM_USER = $0400;
 WM_LBUTTONDBLCLK = $0203;

type
 TWMEraseBkGnd = record
 end;//TWMEraseBkGnd

 TWMPaint = record
 end;//TWMPaint

 TWMGetDlgCode = record
 end;//TWMGetDlgCode

 TWMChar = record
 end;//TWMChar

 TWMKey = record
 end;//TWMKey

 TWMNCPaint = record
 end;//TWMNCPaint

 TWMDestroy = record
 end;//TWMDestroy

 TWMKillFocus = record
 end;//TWMKillFocus

 TWMSetFocus = record
 end;//TWMSetFocus

 TWMMouseWheel = record
 end;//TWMMouseWheel

 TWMActivate = record
 end;//TWMActivate

 TWMWindowPosChanged = record
 end;//TWMWindowPosChanged

 TWMNCHitMessage = record
 end;//TWMNCHitMessage

 TWMNCMouseMove = TWMNCHitMessage;

 TWMMouseActivate = record
 end;//TWMMouseActivate

 TWMSize = record
 end;//TWMSize

 TWMEraseBkgnd = record
 end;//TWMEraseBkgnd

 TWMActivateApp = record
 end;//TWMActivateApp

 TWMCopyData = record
 end;//TWMCopyData

 TWMDisplayChange = record
 end;//TWMDisplayChange

 TWMWindowPosChanging = record
 end;//TWMWindowPosChanging

 TWMScroll = record
 end;//TWMScroll

 TWMHScroll = TWMScroll;

 TWMVScroll = TWMScroll;

 TWMNCCalcSize = record
 end;//TWMNCCalcSize

 TWMNCHitTest = record
 end;//TWMNCHitTest

 TWMGetText = record
 end;//TWMGetText

 TWMGetTextLength = record
 end;//TWMGetTextLength

 TWMMouse = record
 end;//TWMMouse

 TWMMouseMove = TWMMouse;

 TWMSysKeyDown = TWMKey;

 TWMLButtonDblClk = TWMMouse;

 TWMLButtonDown = TWMMouse;

 TWMLButtonUp = TWMMouse;

 TWMMButtonDblClk = TWMMouse;

 TWMMButtonDown = TWMMouse;

 TWMMButtonUp = TWMMouse;

 TWMRButtonDblClk = TWMMouse;

 TWMRButtonDown = TWMMouse;

 TWMRButtonUp = TWMMouse;

 TWMSetCursor = packed record
 end;//TWMSetCursor

 TWMSysCommand = record
 end;//TWMSysCommand

 TWMNCLButtonDown = ;

 TWMNCLButtonUp = ;

 TWMNCActivate = record
 end;//TWMNCActivate

 TWMClose = record
 end;//TWMClose

 TWMEnable = record
 end;//TWMEnable

 TWMShowWindow = ;

implementation

end.