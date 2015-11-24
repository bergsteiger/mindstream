unit afwLongProcessVisualizer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "AFW"
// Модуль: "w:/common/components/gui/Garant/AFW/implementation/Visual/afwLongProcessVisualizer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::AFW::Visual::TafwLongProcessVisualizer
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwInterfaces,
  l3AsincMessageWindow,
  l3ProtoObject
  ;

type
 TafwLongProcessVisualizer = class(Tl3ProtoObject, IafwLongProcessVisualizer)
 private
 // private fields
   f_Wnd : Tl3AsincMessageWindow;
    {* Собственно окно с сообщением.}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(const aCaption: IafwCString;
    anAttachWnd: THandle = 0;
    anInitialTimeout: Cardinal = afw_lpwTimeout;
    anImageList: TafwCustomImageList = nil;
    anImageIndex: Integer = -1); reintroduce;
     {* Создает экземпляр класса. }
   class function Make(const aCaption: IafwCString;
    anAttachWnd: THandle = 0;
    anInitialTimeout: Cardinal = afw_lpwTimeout;
    anImageList: TafwCustomImageList = nil;
    anImageIndex: Integer = -1): IafwLongProcessVisualizer; reintroduce;
     {* Создает экземпляр класса в виде интерфейса IafwLongProcessVisualizer. }
 end;//TafwLongProcessVisualizer

implementation

uses
  SysUtils
  ;

// start class TafwLongProcessVisualizer

constructor TafwLongProcessVisualizer.Create(const aCaption: IafwCString;
  anAttachWnd: THandle = 0;
  anInitialTimeout: Cardinal = afw_lpwTimeout;
  anImageList: TafwCustomImageList = nil;
  anImageIndex: Integer = -1);
//#UC START# *4787FEFF02E5_47877AB8026C_var*
//#UC END# *4787FEFF02E5_47877AB8026C_var*
begin
//#UC START# *4787FEFF02E5_47877AB8026C_impl*
 inherited Create;
 f_Wnd := Tl3AsincMessageWindow.Create(aCaption, anImageList, anImageIndex,
                                       anAttachWnd, anInitialTimeout);
//#UC END# *4787FEFF02E5_47877AB8026C_impl*
end;//TafwLongProcessVisualizer.Create

class function TafwLongProcessVisualizer.Make(const aCaption: IafwCString;
  anAttachWnd: THandle = 0;
  anInitialTimeout: Cardinal = afw_lpwTimeout;
  anImageList: TafwCustomImageList = nil;
  anImageIndex: Integer = -1): IafwLongProcessVisualizer;
var
 l_Inst : TafwLongProcessVisualizer;
begin
 l_Inst := Create(aCaption, anAttachWnd, anInitialTimeout, anImageList, anImageIndex);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TafwLongProcessVisualizer.Cleanup;
//#UC START# *479731C50290_47877AB8026C_var*
//#UC END# *479731C50290_47877AB8026C_var*
begin
//#UC START# *479731C50290_47877AB8026C_impl*
 FreeAndNil(f_Wnd);
 inherited;
//#UC END# *479731C50290_47877AB8026C_impl*
end;//TafwLongProcessVisualizer.Cleanup

end.