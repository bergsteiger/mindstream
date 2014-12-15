unit msDiagrammsListeners;

interface

uses
 Generics.Collections,
 msInterfaces
 ;

type
 TmsDiagrammsListenersList = TList<Pointer>;
 // - подписчики - ВСЕГДА - СЛАБЫЕ (https://ru.wikipedia.org/wiki/%D0%A1%D0%BB%D0%B0%D0%B1%D0%B0%D1%8F_%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B0) ссылки
 // https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D0%B1%D0%BB%D1%8E%D0%B4%D0%B0%D1%82%D0%B5%D0%BB%D1%8C_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
 (*
  Наблюдатель (англ. Observer) — поведенческий шаблон проектирования. Также известен как «подчинённые» (Dependents), «издатель-подписчик» (Publisher-Subscriber). Создает механизм у класса, который позволяет получать экземпляру объекта этого класса оповещения от других объектов об изменении их состояния, тем самым наблюдая за ними[2].
 *)

 TmsDiagrammsListeners = class
 strict private
  class var f_Subscribers : TmsDiagrammsListenersList;
 public
  class destructor Destroy;
 public
  class procedure DiargammAdded(const aDiagramm: ImsDiagramm);
  class procedure Subscribe(const anInvalidator: ImsIvalidator);
  // - подписываемся
  class procedure UnSubscribe(const anInvalidator: ImsIvalidator);
  // - отписываемся
 end;//TmsDiagrammsListeners

implementation

uses
 SysUtils
 ;

// TmsDiagrammsListeners

class destructor TmsDiagrammsListeners.Destroy;
begin
 FreeAndNil(f_Subscribers);
end;

class procedure TmsDiagrammsListeners.DiargammAdded(const aDiagramm: ImsDiagramm);
var
 l_Subscriber : Pointer;
begin
 if (f_Subscribers <> nil) then
  for l_Subscriber in f_Subscribers do
   ImsDiagrammsListener(l_Subscriber).DiargammAdded(aDiagramm);
end;

class procedure TmsDiagrammsListeners.Subscribe(const anInvalidator: ImsIvalidator);
// - подписываемся
begin
 if (f_Subscribers = nil) then
  f_Subscribers := TmsDiagrammsListenersList.Create;
 f_Subscribers.Add(Pointer(anInvalidator));
end;

class procedure TmsDiagrammsListeners.UnSubscribe(const anInvalidator: ImsIvalidator);
// - отписываемся
begin
 if (f_Subscribers <> nil) then
  f_Subscribers.Remove(Pointer(anInvalidator));
end;

end.
