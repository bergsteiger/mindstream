unit msInterfacedRefcounted;

interface

type
 TmsInterfacedRefcounted = class abstract(TInterfacedObject)
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
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
 end;//TmsInterfacedRefcounted

implementation

uses
 msCoreObjects
 ;

//TmsInterfacedRefcounted

class function TmsInterfacedRefcounted.NewInstance: TObject;
begin
 TmsObjectsWatcher.CreateObject(Self, Result);
 TmsInterfacedRefcounted(Result).FRefCount := 1;
end;

procedure TmsInterfacedRefcounted.FreeInstance;
begin
 TmsObjectsWatcher.DestroyObject(Self);
end;

end.
