unit msInterfacedRefcounted;

interface

uses
 {$Include msWatchedObject.mixin.pas}
;

type
 TmsWatchedObjectParent = TInterfacedObject;
 {$Include msWatchedObject.mixin.pas}
 TmsInterfacedRefcounted = class abstract(TmsWatchedObject)
  // Реализация объектов, реализующих интерфейсы. С ПОДСЧЁТОМ ссылок.
  //
  // НЕ САМАЯ хорошая реализация, лучше реализация тут - http://18delphi.blogspot.ru/2013/04/iunknown.html
  // но в учётом ARC - пользуемся пока "нативной реализаией"
  //
  // Таже ещё есть вот что "почитать":
  // - http://18delphi.blogspot.ru/2013/07/blog-post_3683.html
  // - http://18delphi.blogspot.ru/2013/07/1.html
  // - http://18delphi.blogspot.ru/2013/07/2.html
  // - http://18delphi.blogspot.ru/2013/07/2_18.html
  // - http://18delphi.blogspot.ru/2013/07/blog-post_8789.html
 protected
  function IsClassTypeNamedAs(const aClassName: String): Boolean; virtual;
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
 end;//TmsInterfacedRefcounted

implementation

uses
 {$Include msWatchedObject.mixin.pas}
 ;

{$Include msWatchedObject.mixin.pas}

// TmsInterfacedRefcounted

class function TmsInterfacedRefcounted.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 TmsInterfacedRefcounted(Result).FRefCount := 1;
end;

function TmsInterfacedRefcounted.IsClassTypeNamedAs(const aClassName: String): Boolean;
begin
 Result := (ClassName = aClassName);
end;

end.
