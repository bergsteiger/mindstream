unit l3DwmApi;
(* Функции для работы с Desktwop Window Manager *)

{$ALIGN 1}
{$MINENUMSIZE 4}

interface

uses Windows, UxTheme;

const
  // DWM Messages
  {$EXTERNALSYM WM_DWMCOMPOSITIONCHANGED}
  WM_DWMCOMPOSITIONCHANGED        = $031E;
  {$EXTERNALSYM WM_DWMNCRENDERINGCHANGED}
  WM_DWMNCRENDERINGCHANGED        = $031F;
  {$EXTERNALSYM WM_DWMCOLORIZATIONCOLORCHANGED}
  WM_DWMCOLORIZATIONCOLORCHANGED  = $0320;
  {$EXTERNALSYM WM_DWMWINDOWMAXIMIZEDCHANGE}
  WM_DWMWINDOWMAXIMIZEDCHANGE     = $0321;
  {$EXTERNALSYM WM_DWMSENDICONICTHUMBNAIL}
  WM_DWMSENDICONICTHUMBNAIL       = $0323;
  {$EXTERNALSYM WM_DWMSENDICONICLIVEPREVIEWBITMAP}
  WM_DWMSENDICONICLIVEPREVIEWBITMAP = $0326;

  // Blur behind data structures
  DWM_BB_ENABLE                    = $00000001; // fEnable has been specified
  {$EXTERNALSYM DWM_BB_ENABLE}
  DWM_BB_BLURREGION                = $00000002; // hRgnBlur has been specified
  {$EXTERNALSYM DWM_BB_BLURREGION}
  DWM_BB_TRANSITIONONMAXIMIZED     = $00000004; // fTransitionOnMaximized has been specified
  {$EXTERNALSYM DWM_BB_TRANSITIONONMAXIMIZED}

type
  TElementMargins = UxTheme.TMargins;

  PDWM_BLURBEHIND = ^DWM_BLURBEHIND;
  DWM_BLURBEHIND = record
    dwFlags: DWORD;
    fEnable: BOOL;
    hRgnBlur: HRGN;
    fTransitionOnMaximized: BOOL;
  end;
  _DWM_BLURBEHIND = DWM_BLURBEHIND;
  TDwmBlurBehind = DWM_BLURBEHIND;
  PDwmBlurBehind = ^TDwmBlurbehind;
  {$EXTERNALSYM DWM_BLURBEHIND}
  {$EXTERNALSYM PDWM_BLURBEHIND}

// Window attributes
  DWMWINDOWATTRIBUTE = type Integer; 
  {$EXTERNALSYM DWMWINDOWATTRIBUTE}
const
  DWMWA_NCRENDERING_ENABLED         = 1; // [get] Is non-client rendering enabled/disabled
  {$EXTERNALSYM DWMWA_NCRENDERING_ENABLED}
  DWMWA_NCRENDERING_POLICY          = 2; // [set] Non-client rendering policy
  {$EXTERNALSYM DWMWA_NCRENDERING_POLICY}
  DWMWA_TRANSITIONS_FORCEDISABLED   = 3; // [set] Potentially enable/forcibly disable transitions
  {$EXTERNALSYM DWMWA_TRANSITIONS_FORCEDISABLED}
  DWMWA_ALLOW_NCPAINT               = 4; // [set] Allow contents rendered in the non-client area to be visible on the DWM-drawn frame.
  {$EXTERNALSYM DWMWA_ALLOW_NCPAINT}
  DWMWA_CAPTION_BUTTON_BOUNDS       = 5; // [get] Bounds of the caption button area in window-relative space.
  {$EXTERNALSYM DWMWA_CAPTION_BUTTON_BOUNDS}
  DWMWA_NONCLIENT_RTL_LAYOUT        = 6; // [set] Is non-client content RTL mirrored
  {$EXTERNALSYM DWMWA_NONCLIENT_RTL_LAYOUT}
  DWMWA_FORCE_ICONIC_REPRESENTATION = 7; // [set] Force this window to display iconic thumbnails.
  {$EXTERNALSYM DWMWA_FORCE_ICONIC_REPRESENTATION}
  DWMWA_FLIP3D_POLICY               = 8; // [set] Designates how Flip3D will treat the window.
  {$EXTERNALSYM DWMWA_FLIP3D_POLICY}
  DWMWA_EXTENDED_FRAME_BOUNDS       = 9; // [get] Gets the extended frame bounds rectangle in screen space
  {$EXTERNALSYM DWMWA_EXTENDED_FRAME_BOUNDS}
  DWMWA_HAS_ICONIC_BITMAP           = 10; // [set] Indicates an available bitmap when there is no better thumbnail representation.
  {$EXTERNALSYM DWMWA_HAS_ICONIC_BITMAP}
  DWMWA_DISALLOW_PEEK               = 11; // [set] Don't invoke Peek on the window.
  {$EXTERNALSYM DWMWA_DISALLOW_PEEK}
  DWMWA_EXCLUDED_FROM_PEEK          = 12; // [set] LivePreview exclusion information
  {$EXTERNALSYM DWMWA_EXCLUDED_FROM_PEEK}
  DWMWA_LAST                        = 13; 
  {$EXTERNALSYM DWMWA_LAST}

  // Non-client rendering policy attribute values
  {$EXTERNALSYM DWMNCRP_USEWINDOWSTYLE}
  DWMNCRP_USEWINDOWSTYLE          = 0; // Enable/disable non-client rendering based on window style
  {$EXTERNALSYM DWMNCRP_DISABLED}
  DWMNCRP_DISABLED                = 1; // Disabled non-client rendering; window style is ignored
  {$EXTERNALSYM DWMNCRP_ENABLED}
  DWMNCRP_ENABLED                 = 2; // Enabled non-client rendering; window style is ignored
  {$EXTERNALSYM DWMNCRP_LAST}
  DWMNCRP_LAST                    = 3;

  // Values designating how Flip3D treats a given window.

  {$EXTERNALSYM DWMFLIP3D_DEFAULT}
  DWMFLIP3D_DEFAULT                     = 0; // Hide or include the window in Flip3D based on window style and visibility.
  {$EXTERNALSYM DWMFLIP3D_EXCLUDEBELOW}
  DWMFLIP3D_EXCLUDEBELOW                = 1; // Display the window under Flip3D and disabled.
  {$EXTERNALSYM DWMFLIP3D_EXCLUDEABOVE}
  DWMFLIP3D_EXCLUDEABOVE                = 2; // Display the window above Flip3D and enabled.
  {$EXTERNALSYM DWMFLIP3D_LAST}
  DWMFLIP3D_LAST                        = 3;


// Thumbnails
type
  HTHUMBNAIL = THandle; 
  {$EXTERNALSYM HTHUMBNAIL}
  PHTHUMBNAIL = ^HTHUMBNAIL; 
  {$EXTERNALSYM PHTHUMBNAIL}

const
  DWM_TNP_RECTDESTINATION                     = $00000001;
  {$EXTERNALSYM DWM_TNP_RECTDESTINATION}
  DWM_TNP_RECTSOURCE                          = $00000002;
  {$EXTERNALSYM DWM_TNP_RECTSOURCE}
  DWM_TNP_OPACITY                             = $00000004;
  {$EXTERNALSYM DWM_TNP_OPACITY}
  DWM_TNP_VISIBLE                             = $00000008;
  {$EXTERNALSYM DWM_TNP_VISIBLE}
  DWM_TNP_SOURCECLIENTAREAONLY                = $00000010;
  {$EXTERNALSYM DWM_TNP_SOURCECLIENTAREAONLY}

type
  PDWM_THUMBNAIL_PROPERTIES = ^DWM_THUMBNAIL_PROPERTIES;
  DWM_THUMBNAIL_PROPERTIES = record
    dwFlags: DWORD;
    rcDestination: TRect;
    rcSource: TRect;
    opacity: Byte;
    fVisible: BOOL;
    fSourceClientAreaOnly: BOOL;
  end;
  _DWM_THUMBNAIL_PROPERTIES = DWM_THUMBNAIL_PROPERTIES;
  TDwmThumbnailProperties = DWM_THUMBNAIL_PROPERTIES;
  PDwmThumbnailProperties = ^TDwmThumbnailProperties;
  {$EXTERNALSYM DWM_THUMBNAIL_PROPERTIES}
  {$EXTERNALSYM PDWM_THUMBNAIL_PROPERTIES}

// Video enabling apis

  ULONGLONG = UInt64;

  DWM_FRAME_COUNT = ULONGLONG; 
  {$EXTERNALSYM DWM_FRAME_COUNT}
  QPC_TIME        = ULONGLONG; 
  {$EXTERNALSYM QPC_TIME}

  UNSIGNED_RATIO = record 
    uiNumerator: Cardinal;
    uiDenominator: Cardinal;
  end;
  _UNSIGNED_RATIO = UNSIGNED_RATIO;
  TUnsignedRatio = UNSIGNED_RATIO;
  PUnsignedRatio = ^TUnsignedRatio;
  {$EXTERNALSYM UNSIGNED_RATIO}

  DWM_TIMING_INFO = record
    cbSize: Cardinal;

    // Data on DWM composition overall

    // Monitor refresh rate
    rateRefresh: TUnsignedRatio;

    // Actual period
    qpcRefreshPeriod: QPC_TIME;

    // composition rate    
    rateCompose: TUnsignedRatio;

    // QPC time at a VSync interupt
    qpcVBlank: QPC_TIME;

    // DWM refresh count of the last vsync
    // DWM refresh count is a 64bit number where zero is
    // the first refresh the DWM woke up to process
    cRefresh: DWM_FRAME_COUNT;

    // DX refresh count at the last Vsync Interupt
    // DX refresh count is a 32bit number with zero
    // being the first refresh after the card was initialized
    // DX increments a counter when ever a VSync ISR is processed
    // It is possible for DX to miss VSyncs
    // 
    // There is not a fixed mapping between DX and DWM refresh counts
    // because the DX will rollover and may miss VSync interupts
    cDXRefresh: UINT;

    // QPC time at a compose time.
    qpcCompose: QPC_TIME;

    // Frame number that was composed at qpcCompose
    cFrame: DWM_FRAME_COUNT;

    // The present number DX uses to identify renderer frames
    cDXPresent: UINT;

    // Refresh count of the frame that was composed at qpcCompose
    cRefreshFrame: DWM_FRAME_COUNT;


    // DWM frame number that was last submitted
    cFrameSubmitted: DWM_FRAME_COUNT;

    // DX Present number that was last submitted
    cDXPresentSubmitted: UINT;

    // DWM frame number that was last confirmed presented
    cFrameConfirmed: DWM_FRAME_COUNT;

    // DX Present number that was last confirmed presented
    cDXPresentConfirmed: UINT;

    // The target refresh count of the last
    // frame confirmed completed by the GPU
    cRefreshConfirmed: DWM_FRAME_COUNT;

    // DX refresh count when the frame was confirmed presented
    cDXRefreshConfirmed: UINT;

    // Number of frames the DWM presented late
    // AKA Glitches
    cFramesLate: DWM_FRAME_COUNT;

    // the number of composition frames that
    // have been issued but not confirmed completed
    cFramesOutstanding: UINT;


    // Following fields are only relavent when an HWND is specified
    // Display frame


    // Last frame displayed
    cFrameDisplayed: DWM_FRAME_COUNT;

    // QPC time of the composition pass when the frame was displayed
    qpcFrameDisplayed: QPC_TIME;

    // Count of the VSync when the frame should have become visible
    cRefreshFrameDisplayed: DWM_FRAME_COUNT;

    // Complete frames: DX has notified the DWM that the frame is done rendering

    // ID of the the last frame marked complete (starts at 0)
    cFrameComplete: DWM_FRAME_COUNT;

    // QPC time when the last frame was marked complete
    qpcFrameComplete: QPC_TIME;

    // Pending frames:
    // The application has been submitted to DX but not completed by the GPU

    // ID of the the last frame marked pending (starts at 0)
    cFramePending: DWM_FRAME_COUNT;

    // QPC time when the last frame was marked pending
    qpcFramePending: QPC_TIME;

    // number of unique frames displayed
    cFramesDisplayed: DWM_FRAME_COUNT;

    // number of new completed frames that have been received
    cFramesComplete: DWM_FRAME_COUNT;

     // number of new frames submitted to DX but not yet complete
    cFramesPending: DWM_FRAME_COUNT;

    // number of frames available but not displayed, used or dropped
    cFramesAvailable: DWM_FRAME_COUNT;

    // number of rendered frames that were never
    // displayed because composition occured too late
    cFramesDropped: DWM_FRAME_COUNT;

    // number of times an old frame was composed
    // when a new frame should have been used
    // but was not available
    cFramesMissed: DWM_FRAME_COUNT;

    // the refresh at which the next frame is
    // scheduled to be displayed
    cRefreshNextDisplayed: DWM_FRAME_COUNT;

    // the refresh at which the next DX present is
    // scheduled to be displayed
    cRefreshNextPresented: DWM_FRAME_COUNT;

    // The total number of refreshes worth of content
    // for this HWND that have been displayed by the DWM
    // since DwmSetPresentParameters was called
    cRefreshesDisplayed: DWM_FRAME_COUNT;

    // The total number of refreshes worth of content
    // that have been presented by the application
    // since DwmSetPresentParameters was called
    cRefreshesPresented: DWM_FRAME_COUNT;


    // The actual refresh # when content for this
    // window started to be displayed
    // it may be different than that requested
    // DwmSetPresentParameters
    cRefreshStarted: DWM_FRAME_COUNT;

    // Total number of pixels DX redirected
    // to the DWM.
    // If Queueing is used the full buffer
    // is transfered on each present.
    // If not queuing it is possible only
    // a dirty region is updated
    cPixelsReceived: ULONGLONG;

    // Total number of pixels drawn.
    // Does not take into account if
    // if the window is only partial drawn
    // do to clipping or dirty rect management
    cPixelsDrawn: ULONGLONG;

    // The number of buffers in the flipchain
    // that are empty.   An application can
    // present that number of times and guarantee
    // it won't be blocked waiting for a buffer to
    // become empty to present to
    cBuffersEmpty: DWM_FRAME_COUNT;

  end;
  _DWM_TIMING_INFO = DWM_TIMING_INFO;
  TDwmTimingInfo = DWM_TIMING_INFO;
  PDwmTimingInfo = ^TDwmTimingInfo;
  {$EXTERNALSYM DWM_TIMING_INFO}

  DWM_SOURCE_FRAME_SAMPLING = type Integer;
  {$EXTERNALSYM DWM_SOURCE_FRAME_SAMPLING}
const
    // includes the first refresh of the output frame
  DWM_SOURCE_FRAME_SAMPLING_POINT    = 0;
  {$EXTERNALSYM DWM_SOURCE_FRAME_SAMPLING_POINT}

    // use the source frame that includes the most
    // refreshes of out the output frame
    // in case of multiple source frames with the
    // same coverage the last will be used
  DWM_SOURCE_FRAME_SAMPLING_COVERAGE = 1;
  {$EXTERNALSYM DWM_SOURCE_FRAME_SAMPLING_COVERAGE}

       // Sentinel value
  DWM_SOURCE_FRAME_SAMPLING_LAST     = 2;
  {$EXTERNALSYM DWM_SOURCE_FRAME_SAMPLING_LAST}

const
  c_DwmMaxQueuedBuffers = 8;
  c_DwmMaxMonitors = 16;
  c_DwmMaxAdapters = 16;

type
  DWM_PRESENT_PARAMETERS = record
    cbSize: Cardinal;
    fQueue: BOOL;
    cRefreshStart: DWM_FRAME_COUNT;
    cBuffer: UINT;
    fUseSourceRate: BOOL;
    rateSource: TUnsignedRatio;
    cRefreshesPerFrame: UINT;
    eSampling: DWM_SOURCE_FRAME_SAMPLING;
  end;
  _DWM_PRESENT_PARAMETERS = DWM_PRESENT_PARAMETERS;
  TDwmPresentParameters = DWM_PRESENT_PARAMETERS;
  PDwmPresentParameters = ^TDwmPresentParameters;
  {$EXTERNALSYM DWM_PRESENT_PARAMETERS}



const
  DWM_FRAME_DURATION_DEFAULT = -1;
  {$EXTERNALSYM DWM_FRAME_DURATION_DEFAULT}

 function DwmDefWindowProc(hWnd: HWND; msg: UINT; wParam: WPARAM; lParam: LPARAM;
  var plResult: LRESULT): BOOL;

 function DwmEnableBlurBehindWindow(hWnd: HWND;
  var pBlurBehind: TDwmBlurbehind): HResult;

const
 DWM_EC_DISABLECOMPOSITION = 0;
 {$EXTERNALSYM DWM_EC_DISABLECOMPOSITION}
 DWM_EC_ENABLECOMPOSITION = 1;
 {$EXTERNALSYM DWM_EC_ENABLECOMPOSITION}

 function DwmEnableComposition(uCompositionAction: UINT): HResult;
 function DwmEnableMMCSS(fEnableMMCSS: BOOL): HResult;
 function DwmExtendFrameIntoClientArea(hWnd: HWND; const pMarInset: TMargins): HResult;
 function DwmGetColorizationColor(var pcrColorization: DWORD;
  var pfOpaqueBlend: BOOL): HResult;
 function DwmGetCompositionTimingInfo(hwnd: HWND;
  var pTimingInfo: TDwmTimingInfo): HResult;
 function DwmGetWindowAttribute(hwnd: HWND; dwAttribute: DWORD;
  pvAttribute: Pointer; cbAttribute: DWORD): HResult;
 function DwmIsCompositionEnabled(var pfEnabled: BOOL): HResult;
 function DwmModifyPreviousDxFrameDuration(hwnd: HWND; cRefreshes: Integer;
  fRelative: BOOL): HResult;
 function DwmQueryThumbnailSourceSize(hThumbnail: HTHUMBNAIL;
  pSize: PSIZE): HResult;
 function DwmRegisterThumbnail(hwndDestination: HWND; hwndSource: HWND;
  phThumbnailId: PHTHUMBNAIL): HResult;
 function DwmSetDxFrameDuration(hwnd: HWND; cRefreshes: Integer): HResult;
 function DwmSetPresentParameters(hwnd: HWND;
  var pPresentParams: TDwmPresentParameters): HResult;
 function DwmSetWindowAttribute(hwnd: HWND; dwAttribute: DWORD;
  pvAttribute: Pointer; cbAttribute: DWORD): HResult;
 function DwmUnregisterThumbnail(hThumbnailId: HTHUMBNAIL): HResult;
 function DwmUpdateThumbnailProperties(hThumbnailId: HTHUMBNAIL;
  var ptnProperties: TDwmThumbnailProperties): HResult;

const
  DWM_SIT_DISPLAYFRAME = $00000001;     // Display a window frame around the provided bitmap
  {$EXTERNALSYM DWM_SIT_DISPLAYFRAME}

 function DwmSetIconicThumbnail(hwnd: HWND; hbmp: HBITMAP;
  dwSITFlags: DWORD): HResult;
 function DwmSetIconicLivePreviewBitmap(hwnd: HWND; hbmp: HBITMAP;
  var pptClient: TPoint; dwSITFlags: DWORD): HResult; overload;
 function DwmInvalidateIconicBitmaps(hwnd: HWND): HResult;
 function DwmAttachMilContent(hwnd: HWND): HResult;
 function DwmDetachMilContent(hwnd: HWND): HResult;
 function DwmFlush: HResult;

type
  MilMatrix3x2D = record
    S_11: Double;
    S_12: Double;
    S_21: Double;
    S_22: Double;
    DX: Double;
    DY: Double;
  end;
  _MilMatrix3x2D = MilMatrix3x2D;
  TMilMatrix3x2D = MilMatrix3x2D;
  PMilMatrix3x2D = ^TMilMatrix3x2D;
  {$EXTERNALSYM MilMatrix3x2D}

// Compatibility for Vista dwm api.
  MIL_MATRIX3X2D = MilMatrix3x2D;
  {$EXTERNALSYM MIL_MATRIX3X2D}

function DwmGetGraphicsStreamTransformHint(uIndex: UINT;
  var pTransform: TMilMatrix3x2D): HResult;
function DwmGetGraphicsStreamClient(uIndex: UINT;
  var pClientUuid: TGUID): HResult;
function DwmGetTransportAttributes(var pfIsRemoting: BOOL;
  var pfIsConnected: BOOL; var pDwGeneration: DWORD): HResult;
function DwmCompositionEnabled: Boolean;

implementation

uses
  SysUtils;

const
  ModName = 'DWMAPI.DLL';
  cDwmDefWindowProcName = 'DwmDefWindowProc';
  cDwmEnableBlurBehindWindowName = 'DwmEnableBlurBehindWindow';
  cDwmEnableCompositionName = 'DwmEnableComposition';
  cDwmEnableMMCSSName = 'DwmEnableMMCSS';
  cDwmExtendFrameIntoClientAreaName = 'DwmExtendFrameIntoClientArea';
  cDwmGetColorizationColorName = 'DwmGetColorizationColor';
  cDwmGetCompositionTimingInfoName = 'DwmGetCompositionTimingInfo';
  cDwmGetWindowAttributeName = 'DwmGetWindowAttribute';
  cDwmIsCompositionEnabledName = 'DwmIsCompositionEnabled';
  cDwmModifyPreviousDxFrameDurationName = 'DwmModifyPreviousDxFrameDuration';
  cDwmQueryThumbnailSourceSizeName = 'DwmQueryThumbnailSourceSize';
  cDwmRegisterThumbnailName = 'DwmRegisterThumbnail';
  cDwmSetDxFrameDurationName = 'DwmSetDxFrameDuration';
  cDwmSetPresentParametersName = 'DwmSetPresentParameters';
  cDwmSetWindowAttributeName = 'DwmSetWindowAttribute';
  cDwmUnregisterThumbnailName = 'DwmUnregisterThumbnail';
  cDwmUpdateThumbnailPropertiesName = 'DwmUpdateThumbnailProperties';
  cDwmSetIconicThumbnailName = 'DwmSetIconicThumbnail';
  cDwmSetIconicLivePreviewBitmapName = 'DwmSetIconicLivePreviewBitmap';
  cDwmInvalidateIconicBitmapsName = 'DwmInvalidateIconicBitmaps';
  cDwmAttachMilContentName = 'DwmAttachMilContent';
  cDwmDetachMilContentName = 'DwmDetachMilContent';
  cDwmFlushName = 'DwmFlush';
  cDwmGetGraphicsStreamTransformHintName = 'DwmGetGraphicsStreamTransformHint';
  cDwmGetGraphicsStreamClientName = 'DwmGetGraphicsStreamClient';
  cDwmGetTransportAttributesName = 'DwmGetTransportAttributes';

type
 // Прототипы функций
  PDwmDefWindowProc = ^TDwmDefWindowProc;
  TDwmDefWindowProc = function(hWnd: HWND; msg: UINT; wParam: WPARAM; lParam: LPARAM;
    var plResult: LRESULT): BOOL; stdcall;

  PDwmEnableBlurBehindWindow = ^TDwmEnableBlurBehindWindow;
  TDwmEnableBlurBehindWindow = function(hWnd: HWND;
    var pBlurBehind: TDwmBlurbehind): HResult; stdcall;

  PDwmEnableComposition = ^TDwmEnableComposition;
  TDwmEnableComposition = function(uCompositionAction: UINT): HResult; stdcall;

  PDwmEnableMMCSS = ^TDwmEnableMMCSS;
  TDwmEnableMMCSS = function(fEnableMMCSS: BOOL): HResult; stdcall;

  PDwmExtendFrameIntoClientArea = ^TDwmExtendFrameIntoClientArea;
  TDwmExtendFrameIntoClientArea = function(hWnd: HWND; const pMarInset: TMargins): HResult; stdcall;

  PDwmGetColorizationColor = ^TDwmGetColorizationColor;
  TDwmGetColorizationColor = function(var pcrColorization: DWORD;
    var pfOpaqueBlend: BOOL): HResult; stdcall;

  PDwmGetCompositionTimingInfo = ^TDwmGetCompositionTimingInfo;
  TDwmGetCompositionTimingInfo = function(hwnd: HWND;
    var pTimingInfo: TDwmTimingInfo): HResult; stdcall;

  PDwmGetWindowAttribute = ^TDwmGetWindowAttribute;
  TDwmGetWindowAttribute = function(hwnd: HWND; dwAttribute: DWORD;
    pvAttribute: Pointer; cbAttribute: DWORD): HResult; stdcall;

  PDwmIsCompositionEnabled = ^TDwmIsCompositionEnabled;
  TDwmIsCompositionEnabled = function(var pfEnabled: BOOL): HResult; stdcall;

  PDwmModifyPreviousDxFrameDuration = ^TDwmModifyPreviousDxFrameDuration;
  TDwmModifyPreviousDxFrameDuration = function(hwnd: HWND; cRefreshes: Integer;
    fRelative: BOOL): HResult; stdcall;

  PDwmQueryThumbnailSourceSize = ^TDwmQueryThumbnailSourceSize;
  TDwmQueryThumbnailSourceSize = function(hThumbnail: HTHUMBNAIL;
    pSize: PSIZE): HResult; stdcall;

  PDwmRegisterThumbnail = ^TDwmRegisterThumbnail;
  TDwmRegisterThumbnail = function(hwndDestination: HWND; hwndSource: HWND;
    phThumbnailId: PHTHUMBNAIL): HResult; stdcall;

  PDwmSetDxFrameDuration = ^TDwmSetDxFrameDuration;
  TDwmSetDxFrameDuration = function(hwnd: HWND; cRefreshes: Integer): HResult; stdcall;

  PDwmSetPresentParameters = ^TDwmSetPresentParameters;
  TDwmSetPresentParameters = function(hwnd: HWND;
    var pPresentParams: TDwmPresentParameters): HResult; stdcall;

  PDwmSetWindowAttribute = ^TDwmSetWindowAttribute;
  TDwmSetWindowAttribute = function(hwnd: HWND; dwAttribute: DWORD;
    pvAttribute: Pointer; cbAttribute: DWORD): HResult; stdcall;

  PDwmUnregisterThumbnail = ^TDwmUnregisterThumbnail;
  TDwmUnregisterThumbnail = function(hThumbnailId: HTHUMBNAIL): HResult; stdcall;

  PDwmUpdateThumbnailProperties = ^TDwmUpdateThumbnailProperties;
  TDwmUpdateThumbnailProperties = function(hThumbnailId: HTHUMBNAIL;
    var ptnProperties: TDwmThumbnailProperties): HResult; stdcall;

  PDwmSetIconicThumbnail = ^TDwmSetIconicThumbnail;
  TDwmSetIconicThumbnail = function(hwnd: HWND; hbmp: HBITMAP;
    dwSITFlags: DWORD): HResult; stdcall;

  PDwmSetIconicLivePreviewBitmap = ^TDwmSetIconicLivePreviewBitmap;
  TDwmSetIconicLivePreviewBitmap = function(hwnd: HWND; hbmp: HBITMAP;
    var pptClient: TPoint; dwSITFlags: DWORD): HResult; stdcall;

  PDwmInvalidateIconicBitmaps = ^TDwmInvalidateIconicBitmaps;
  TDwmInvalidateIconicBitmaps = function(hwnd: HWND): HResult; stdcall;

  PDwmAttachMilContent = ^TDwmAttachMilContent;
  TDwmAttachMilContent = function(hwnd: HWND): HResult; stdcall;

  PDwmDetachMilContent = ^TDwmDetachMilContent;
  TDwmDetachMilContent = function(hwnd: HWND): HResult; stdcall;

  PDwmFlush = ^TDwmFlush;
  TDwmFlush = function: HResult; stdcall;

  PDwmGetGraphicsStreamTransformHint = ^TDwmGetGraphicsStreamTransformHint;
  TDwmGetGraphicsStreamTransformHint = function(uIndex: UINT;
    var pTransform: TMilMatrix3x2D): HResult;

  PDwmGetGraphicsStreamClient = ^TDwmGetGraphicsStreamClient;
  TDwmGetGraphicsStreamClient = function(uIndex: UINT;
    var pClientUuid: TGUID): HResult;

  PDwmGetTransportAttributes = ^TDwmGetTransportAttributes;
  TDwmGetTransportAttributes = function(var pfIsRemoting: BOOL;
    var pfIsConnected: BOOL; var pDwGeneration: DWORD): HResult;

var
  g_LockCS: TRTLCriticalSection;
  g_Lib: HMODULE = 0;
  g_ReferenceCount: Integer = 0;

  g_DwmDefWindowProc: TDwmDefWindowProc = nil;
  g_DwmEnableBlurBehindWindow: TDwmEnableBlurBehindWindow = nil;
  g_DwmEnableComposition: TDwmEnableComposition = nil;
  g_DwmEnableMMCSS: TDwmEnableMMCSS = nil;
  g_DwmExtendFrameIntoClientArea: TDwmExtendFrameIntoClientArea = nil;
  g_DwmGetColorizationColor: TDwmGetColorizationColor = nil;
  g_DwmGetCompositionTimingInfo: TDwmGetCompositionTimingInfo = nil;
  g_DwmGetWindowAttribute: TDwmGetWindowAttribute = nil;
  g_DwmIsCompositionEnabled: TDwmIsCompositionEnabled = nil;
  g_DwmModifyPreviousDxFrameDuration: TDwmModifyPreviousDxFrameDuration = nil;
  g_DwmQueryThumbnailSourceSize: TDwmQueryThumbnailSourceSize = nil;
  g_DwmRegisterThumbnail: TDwmRegisterThumbnail = nil;
  g_DwmSetDxFrameDuration: TDwmSetDxFrameDuration = nil;
  g_DwmSetPresentParameters: TDwmSetPresentParameters = nil;
  g_DwmSetWindowAttribute: TDwmSetWindowAttribute = nil;
  g_DwmUnregisterThumbnail: TDwmUnregisterThumbnail = nil;
  g_DwmUpdateThumbnailProperties: TDwmUpdateThumbnailProperties = nil;
  g_DwmSetIconicThumbnail: TDwmSetIconicThumbnail = nil;
  g_DwmSetIconicLivePreviewBitmap: TDwmSetIconicLivePreviewBitmap = nil;
  g_DwmInvalidateIconicBitmaps: TDwmInvalidateIconicBitmaps = nil;
  g_DwmAttachMilContent: TDwmAttachMilContent = nil;
  g_DwmDetachMilContent: TDwmDetachMilContent = nil;
  g_DwmFlush: TDwmFlush = nil;
  g_DwmGetGraphicsStreamTransformHint: TDwmGetGraphicsStreamTransformHint = nil;
  g_DwmGetGraphicsStreamClient: TDwmGetGraphicsStreamClient = nil;
  g_DwmGetTransportAttributes: TDwmGetTransportAttributes = nil;

function DwmDefWindowProc(hWnd: HWND; msg: UINT; wParam: WPARAM; lParam: LPARAM;
  var plResult: LRESULT): BOOL;
begin
 if (not Assigned(g_DwmDefWindowProc)) then
  Result := False
 else
  Result := g_DwmDefWindowProc(hWnd, msg, wParam, lParam, plResult);
end;

function DwmEnableBlurBehindWindow(hWnd: HWND;
  var pBlurBehind: TDwmBlurbehind): HResult;
begin
 Result := g_DwmEnableBlurBehindWindow(hWnd, pBlurBehind);
end;

function DwmEnableComposition(uCompositionAction: UINT): HResult;
begin
 Result := g_DwmEnableComposition(uCompositionAction);
end;

function DwmEnableMMCSS(fEnableMMCSS: BOOL): HResult;
begin
 Result := g_DwmEnableMMCSS(fEnableMMCSS);
end;

function DwmExtendFrameIntoClientArea(hWnd: HWND; const pMarInset: TMargins): HResult;
begin
 Result := g_DwmExtendFrameIntoClientArea(hWnd, pMarInset);
end;

function DwmGetColorizationColor(var pcrColorization: DWORD;
  var pfOpaqueBlend: BOOL): HResult;
begin
 Result := g_DwmGetColorizationColor(pcrColorization, pfOpaqueBlend);
end;

function DwmGetCompositionTimingInfo(hwnd: HWND;
  var pTimingInfo: TDwmTimingInfo): HResult;
begin
 Result := g_DwmGetCompositionTimingInfo(hwnd, pTimingInfo);
end;

function DwmGetWindowAttribute(hwnd: HWND; dwAttribute: DWORD;
  pvAttribute: Pointer; cbAttribute: DWORD): HResult;
begin
 Result := g_DwmGetWindowAttribute(hwnd, dwAttribute, pvAttribute, cbAttribute);
end;

function DwmIsCompositionEnabled(var pfEnabled: BOOL): HResult;
begin
 Result := S_FALSE;
 if (not Assigned(g_DwmIsCompositionEnabled)) then
  pfEnabled := False
 else
  Result := g_DwmIsCompositionEnabled(pfEnabled);
end;

function DwmModifyPreviousDxFrameDuration(hwnd: HWND; cRefreshes: Integer;
  fRelative: BOOL): HResult;
begin
 Result := g_DwmModifyPreviousDxFrameDuration(hwnd, cRefreshes, fRelative);
end;

function DwmQueryThumbnailSourceSize(hThumbnail: HTHUMBNAIL;
  pSize: PSIZE): HResult;
begin
 Result := g_DwmQueryThumbnailSourceSize(hThumbnail, pSize);
end;

function DwmRegisterThumbnail(hwndDestination: HWND; hwndSource: HWND;
  phThumbnailId: PHTHUMBNAIL): HResult;
begin
 Result := g_DwmRegisterThumbnail(hwndDestination, hwndSource,
  phThumbnailId);
end;

function DwmSetDxFrameDuration(hwnd: HWND; cRefreshes: Integer): HResult;
begin
 Result := g_DwmSetDxFrameDuration(hwnd, cRefreshes);
end;

function DwmSetPresentParameters(hwnd: HWND;
  var pPresentParams: TDwmPresentParameters): HResult;
begin
 Result := g_DwmSetPresentParameters(hwnd, pPresentParams);
end;

function DwmSetWindowAttribute(hwnd: HWND; dwAttribute: DWORD;
  pvAttribute: Pointer; cbAttribute: DWORD): HResult;
begin
 Result := g_DwmSetWindowAttribute(hwnd, dwAttribute, pvAttribute,
  cbAttribute);
end;

function DwmUnregisterThumbnail(hThumbnailId: HTHUMBNAIL): HResult;
begin
 Result := g_DwmUnregisterThumbnail(hThumbnailId);
end;

function DwmUpdateThumbnailProperties(hThumbnailId: HTHUMBNAIL;
  var ptnProperties: TDwmThumbnailProperties): HResult;
begin
 Result := g_DwmUpdateThumbnailProperties(hThumbnailId, ptnProperties);
end;

function DwmSetIconicThumbnail(hwnd: HWND; hbmp: HBITMAP;
  dwSITFlags: DWORD): HResult;
begin
 Result := g_DwmSetIconicThumbnail(hwnd, hbmp, dwSITFlags)
end;

function DwmSetIconicLivePreviewBitmap(hwnd: HWND; hbmp: HBITMAP;
  var pptClient: TPoint; dwSITFlags: DWORD): HResult;
begin
 Result := g_DwmSetIconicLivePreviewBitmap(hwnd, hbmp, pptClient, dwSITFlags);
end;

function DwmInvalidateIconicBitmaps(hwnd: HWND): HResult;
begin
 Result := g_DwmInvalidateIconicBitmaps(hwnd);
end;

function DwmAttachMilContent(hwnd: HWND): HResult;
begin
 Result := g_DwmAttachMilContent(hwnd);
end;

function DwmDetachMilContent(hwnd: HWND): HResult;
begin
 Result := g_DwmDetachMilContent(hwnd);
end;

function DwmFlush: HResult;
begin
 Result := g_DwmFlush;
end;

function DwmGetGraphicsStreamTransformHint(uIndex: UINT;
  var pTransform: TMilMatrix3x2D): HResult;
begin
 Result := g_DwmGetGraphicsStreamTransformHint(uIndex, pTransform);
end;

function DwmGetGraphicsStreamClient(uIndex: UINT;
  var pClientUuid: TGUID): HResult;
begin
 Result := g_DwmGetGraphicsStreamClient(uIndex, pClientUuid);
end;

function DwmGetTransportAttributes(var pfIsRemoting: BOOL;
  var pfIsConnected: BOOL; var pDwGeneration: DWORD): HResult;
begin
 Result := g_DwmGetTransportAttributes(pfIsRemoting, pfIsConnected,
  pDwGeneration);
end;

function DwmCompositionEnabled: Boolean;
var
  LEnabled: BOOL;
begin
  Result := (Win32MajorVersion >= 6) and (DwmIsCompositionEnabled(LEnabled) = S_OK) and LEnabled;
end;

function InitDwmLibrary: Boolean;
begin
 EnterCriticalSection(g_LockCS);
 Result := False;
 try
  Inc(g_ReferenceCount);
  if (g_Lib = 0) then
   g_Lib := LoadLibrary(ModName);
  if (g_Lib <> 0) then
  begin
   g_DwmDefWindowProc := GetProcAddress(g_Lib, cDwmDefWindowProcName);
   g_DwmEnableBlurBehindWindow := GetProcAddress(g_Lib, cDwmEnableBlurBehindWindowName);
   g_DwmEnableComposition := GetProcAddress(g_Lib, cDwmEnableCompositionName);
   g_DwmEnableMMCSS := GetProcAddress(g_Lib, cDwmEnableMMCSSName);
   g_DwmExtendFrameIntoClientArea := GetProcAddress(g_Lib, cDwmExtendFrameIntoClientAreaName);
   g_DwmGetColorizationColor := GetProcAddress(g_Lib, cDwmGetColorizationColorName);
   g_DwmGetCompositionTimingInfo := GetProcAddress(g_Lib, cDwmGetCompositionTimingInfoName);
   g_DwmGetWindowAttribute := GetProcAddress(g_Lib, cDwmGetWindowAttributeName);
   g_DwmIsCompositionEnabled := GetProcAddress(g_Lib, cDwmIsCompositionEnabledName);
   g_DwmModifyPreviousDxFrameDuration := GetProcAddress(g_Lib, cDwmModifyPreviousDxFrameDurationName);
   g_DwmQueryThumbnailSourceSize := GetProcAddress(g_Lib, cDwmQueryThumbnailSourceSizeName);
   g_DwmRegisterThumbnail := GetProcAddress(g_Lib, cDwmRegisterThumbnailName);
   g_DwmSetDxFrameDuration := GetProcAddress(g_Lib, cDwmSetDxFrameDurationName);
   g_DwmSetPresentParameters := GetProcAddress(g_Lib, cDwmSetPresentParametersName);
   g_DwmSetWindowAttribute := GetProcAddress(g_Lib, cDwmSetWindowAttributeName);
   g_DwmUnregisterThumbnail := GetProcAddress(g_Lib, cDwmUnregisterThumbnailName);
   g_DwmUpdateThumbnailProperties := GetProcAddress(g_Lib, cDwmUpdateThumbnailPropertiesName);
   g_DwmSetIconicThumbnail := GetProcAddress(g_Lib, cDwmSetIconicThumbnailName);
   g_DwmSetIconicLivePreviewBitmap := GetProcAddress(g_Lib, cDwmSetIconicLivePreviewBitmapName);
   g_DwmInvalidateIconicBitmaps := GetProcAddress(g_Lib, cDwmInvalidateIconicBitmapsName);
   g_DwmAttachMilContent := GetProcAddress(g_Lib, cDwmAttachMilContentName);
   g_DwmDetachMilContent := GetProcAddress(g_Lib, cDwmDetachMilContentName);
   g_DwmFlush := GetProcAddress(g_Lib, cDwmFlushName);
   g_DwmGetGraphicsStreamTransformHint := GetProcAddress(g_Lib, cDwmGetGraphicsStreamTransformHintName);
   g_DwmGetGraphicsStreamClient := GetProcAddress(g_Lib, cDwmGetGraphicsStreamClientName);
   g_DwmGetTransportAttributes := GetProcAddress(g_Lib, cDwmGetTransportAttributesName);
  end;
  Result := g_Lib <> 0;
 finally
  LeaveCriticalSection(g_LockCS);
 end;
end;

procedure FreeDwmLibrary;
begin
 EnterCriticalSection(g_LockCS);
 try
  if (g_ReferenceCount > 0) then
   Dec(g_ReferenceCount);

  if (g_Lib <> 0) and (g_ReferenceCount = 0) then
  begin
   FreeLibrary(g_Lib);
   g_Lib := 0;

   g_DwmDefWindowProc := nil;
   g_DwmEnableBlurBehindWindow := nil;
   g_DwmEnableComposition := nil;
   g_DwmEnableMMCSS := nil;
   g_DwmExtendFrameIntoClientArea := nil;
   g_DwmGetColorizationColor := nil;
   g_DwmGetCompositionTimingInfo := nil;
   g_DwmGetWindowAttribute := nil;
   g_DwmIsCompositionEnabled := nil;
   g_DwmModifyPreviousDxFrameDuration := nil;
   g_DwmQueryThumbnailSourceSize := nil;
   g_DwmRegisterThumbnail := nil;
   g_DwmSetDxFrameDuration := nil;
   g_DwmSetPresentParameters := nil;
   g_DwmSetWindowAttribute := nil;
   g_DwmUnregisterThumbnail := nil;
   g_DwmUpdateThumbnailProperties := nil;
   g_DwmSetIconicThumbnail := nil;
   g_DwmSetIconicLivePreviewBitmap := nil;
   g_DwmInvalidateIconicBitmaps := nil;
   g_DwmAttachMilContent := nil;
   g_DwmDetachMilContent := nil;
   g_DwmFlush := nil;
   g_DwmGetGraphicsStreamTransformHint := nil;
   g_DwmGetGraphicsStreamClient := nil;
   g_DwmGetTransportAttributes := nil;
  end;
 finally
  LeaveCriticalSection(g_LockCS);
 end;
end;

initialization
 InitializeCriticalSection(g_LockCS);
 InitDwmLibrary;
finalization
 while (g_ReferenceCount > 0) do
  FreeDwmLibrary;
 DeleteCriticalSection(g_LockCS);

end.
