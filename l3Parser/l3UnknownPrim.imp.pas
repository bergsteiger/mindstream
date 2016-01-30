{$IfNDef l3UnknownPrim}

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3UnknownIntf.inc -         }
{ Начат: 15.09.2004 12:49             }
{ $Id: l3UnknownPrim.imp.pas,v 1.44 2015/06/10 10:32:07 lulin Exp $ }

// $Log: l3UnknownPrim.imp.pas,v $
// Revision 1.44  2015/06/10 10:32:07  lulin
// - пытаемся найти проезд по памяти.
//
// Revision 1.43  2015/06/02 12:10:34  lulin
// - убираем неверную диагностику.
//
// Revision 1.42  2015/06/01 13:40:26  lulin
// - регистрируем слова для строк в другом месте.
//
// Revision 1.41  2015/01/15 15:37:56  lulin
// {RequestLink:585926571}.
//
// Revision 1.40  2015/01/15 13:50:25  lulin
// {RequestLink:585926571}. Используем Interlocked.
//
// Revision 1.39  2014/11/07 16:38:36  lulin
// {RequestLink:571638581}.
//
// Revision 1.38  2014/11/07 13:56:03  lulin
// {RequestLink:571638581}.
//
// Revision 1.37  2014/11/06 11:53:37  lulin
// - перетряхиваем код.
//
// Revision 1.36  2014/07/16 15:56:57  lulin
// - чистим код и упрощаем наследование.
//
// Revision 1.35  2014/06/26 12:39:21  lulin
// - работаем над инфраструктурой заворачивания тегов в таски.
//
// Revision 1.34  2014/05/12 16:06:18  lulin
// - чистим код.
//
// Revision 1.33  2014/05/12 14:59:54  lulin
// - чистим код.
//
// Revision 1.32  2014/05/12 14:56:49  lulin
// - чистим код.
//
// Revision 1.31  2013/08/22 15:35:13  lulin
// {RequestLink:414849897}
// - делаем возможность вкладывать в значения настроек другие настройки.
// - автоматом проставляем связь реализации вложенным настройкам.
//
// Revision 1.30  2013/07/01 08:35:41  lulin
// - пытаемся включить кеш объектов (пока неудачно).
//
// Revision 1.29  2013/07/01 07:18:02  lulin
// - пытаемся включить кеш объектов (пока неудачно).
//
// Revision 1.28  2013/07/01 06:12:21  lulin
// - чистка кода.
//
// Revision 1.27  2013/04/25 14:22:38  lulin
// - портируем.
//
// Revision 1.26  2013/04/09 17:40:34  lulin
// - пытаемся отладиться под _XE.
//
// Revision 1.25  2013/04/08 15:13:46  lulin
// - чистка кода.
//
// Revision 1.24  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.23  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.22  2013/04/03 15:35:16  lulin
// - портируем.
//
// Revision 1.21  2013/04/02 14:41:02  lulin
// - отпиливаем скрипты от тестов.
//
// Revision 1.20  2012/10/26 19:42:24  lulin
// - вычищаем поддержку ветки редактора.
//
// Revision 1.19  2012/07/13 17:37:46  lulin
// {RequestLink:237994598}
//
// Revision 1.18  2011/10/04 10:56:56  lulin
// {RequestLink:289933577}.
//
// Revision 1.17  2011/09/15 16:23:29  lulin
// {RequestLink:278824896}.
//
// Revision 1.16  2011/04/26 18:23:24  lulin
// - добавляем определение слова, условный оператор и целочисленный цикл.
//
// Revision 1.15  2011/02/10 17:29:07  lulin
// {RequestLink:253664112}.
//
// Revision 1.14  2010/01/28 10:11:03  lulin
// [$184615177]. Ещё одна ловушечка.
//
// Revision 1.13  2010/01/28 10:06:15  lulin
// [$184615177]. По любому вызываем деструктор.
//
// Revision 1.12  2010/01/28 09:56:51  lulin
// [$184615177].
//
// Revision 1.11  2009/12/18 15:37:11  lulin
// http://mdp.garant.ru/pages/viewpage.action?pageId=174293699&focusedCommentId=174296385#comment-174296385
//
// Revision 1.10  2009/11/06 17:21:54  lulin
// {RequestLink:168955613}.
//
// Revision 1.9  2009/10/22 14:40:53  lulin
// {RequestLink:167351809}.
//
// Revision 1.8  2009/07/23 06:40:52  lulin
// - проглючило, вернул всё взад.
//
// Revision 1.7  2009/07/23 06:38:07  lulin
// - правим директивы поддержки IUnknown для ветки.
//
// Revision 1.6  2009/07/20 14:52:09  lulin
// - bug fix: не работал Архивариус в ветке.
//
// Revision 1.5  2009/07/20 11:22:19  lulin
// - заставляем работать F1 после - {RequestLink:141264340}. №7, 32, 33.
//
// Revision 1.4  2009/04/07 08:41:11  lulin
// [$140837386]. Коммит для переключения на ветку для [$140281673].
//
// Revision 1.3  2009/01/28 10:17:01  lulin
// - в Design-Time отключаем кеширование объектов.
//
// Revision 1.2  2008/02/15 10:27:41  lulin
// - bug fix: не собиралась библиотека.
//
// Revision 1.1  2008/02/14 19:32:41  lulin
// - изменены имена файлов с примесями.
//
// Revision 1.1  2008/02/14 14:12:25  lulin
// - <K>: 83920106.
//
// Revision 1.28  2008/02/13 20:20:15  lulin
// - <TDN>: 73.
//
// Revision 1.27  2008/01/30 20:31:44  lulin
// - подготавливаемся к штатному использованию классов-примесей на модели.
//
// Revision 1.26  2008/01/25 15:51:36  lulin
// - модуль l3Printer перенесен на модель.
//
// Revision 1.25  2008/01/25 12:06:59  lulin
// - синхронизируем имена с моделью.
//
// Revision 1.24  2008/01/25 11:32:14  lulin
// - синхронизируем имена с моделью.
//
// Revision 1.23  2007/08/28 18:45:53  lulin
// - уменьшаем число передаваемых параметров - чтобы влезали в регистры.
//
// Revision 1.22  2007/08/14 19:45:50  lulin
// - bug fix: не собиралась библиотека.
//
// Revision 1.21  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.20  2007/03/16 14:47:31  lulin
// - _cleanup.
//
// Revision 1.19  2007/01/18 10:49:42  lulin
// - заменяем объект менеджера памяти на интерфейс.
//
// Revision 1.18  2007/01/17 17:12:07  lulin
// - избавляемся от ненужной виртуальности.
//
// Revision 1.17  2007/01/17 16:34:27  lulin
// - вставлено предусловие, о том что нельзя распределять объект в пуле при отсутствии такового.
//
// Revision 1.16  2007/01/17 15:54:47  lulin
// - _cleanup.
//
// Revision 1.15  2007/01/17 11:20:20  lulin
// - _cleanup.
//
// Revision 1.14  2007/01/11 14:57:14  lulin
// - bug fix: не компилировалась библиотека в ветке.
//
// Revision 1.13  2007/01/09 10:02:30  lulin
// - bug fix: были лишние зависимости.
//
// Revision 1.12  2006/12/08 15:03:56  lulin
// - bug fix: не собиралась библиотека.
//
// Revision 1.11  2006/12/08 14:21:08  lulin
// - очищаем кешированные компоненты так, как будто они заново родились.
//
// Revision 1.10  2006/12/08 13:25:54  lulin
// - сделана возможность управлять полной очисткой данных объекта при укладывании их в кеш.
//
// Revision 1.9  2006/12/08 12:52:19  lulin
// - добавлен метод для полной очистки всех данных объектов.
//
// Revision 1.8  2006/11/20 13:52:55  lulin
// - _cleanup.
//
// Revision 1.7  2006/11/20 09:58:44  lulin
// - _cleanup.
//
// Revision 1.6  2006/04/17 10:49:27  lulin
// - bug fix: не компилировалось без отладочной информации.
//
// Revision 1.5  2006/04/17 07:59:15  migel
// - fix: закоментировали (временно) опцию условной компиляции, иначе не собирался `garant.dpr`, если была отключена отладочная информация (как это сделано в релизе).
//
// Revision 1.4  2006/04/14 14:20:40  lulin
// - запрещаем перекрывать и вызывать утилитные методы по созданию/удалению объекта.
//
// Revision 1.3  2006/04/14 13:40:33  lulin
// - запрещаем перекрывать деструктор.
//
// Revision 1.2  2006/04/14 12:38:19  lulin
// - запрещаем перекрывать деструктор.
//
// Revision 1.1  2006/04/14 12:11:25  lulin
// - файлу с шаблоном дано более правильное название.
//
// Revision 1.14  2006/04/14 11:53:13  lulin
// - объединил интерфейс и реализацию __Unknown_ в один файл.
//
// Revision 1.13  2006/03/06 12:02:29  oman
// - new behavior: контроль провисания ресурсов при добавлении объектов в кэш
//
// Revision 1.12  2005/08/03 11:31:54  mmorozov
// - _format code;
//
// Revision 1.11  2005/07/15 08:29:36  lulin
// - bug fix: был AV при хождении по истории (не инициализировался Root оглавления).
//
// Revision 1.10  2005/04/28 15:04:11  lulin
// - переложил ветку B_Tag_Box в HEAD.
//
// Revision 1.9.10.1  2005/04/26 10:22:33  lulin
// - не вызываем ненужный метод.
//
// Revision 1.9  2005/02/03 11:50:07  lulin
// - bug fix: Архивариус не компилировался.
//
// Revision 1.8  2005/02/03 08:30:21  lulin
// - bug fix: после перехода на шаблон __Unknow_ не все операции попадали в буфер Undo.
//
// Revision 1.7  2005/02/02 09:14:45  lulin
// - расширен шаблон Unknown.
//
// Revision 1.6  2004/09/20 12:42:59  lulin
// - оптимизация - путем перемещения части объектов в пул, время загрузки ГК (до показа оглавления) уменьшено с 3.5 сек до 2.6 сек.
//
// Revision 1.5  2004/09/16 11:31:17  lulin
// - навел подобие порядка с регистрацией компонент библиотеки.
//
// Revision 1.4  2004/09/15 13:29:09  lulin
// - TvcmAction и TvcmWinControlActionLink переведен на "шаблон" l3Unknown.
//
// Revision 1.3  2004/09/15 10:16:52  lulin
// - _Tl3InterfacedComponent переведен на "шаблон" l3Unknown.
//
// Revision 1.2  2004/09/15 10:01:44  lulin
// - _cleanup.
//

{$Define l3UnknownPrim}

{$IfDef _UnknownIsBaseComponent}
 {$Define _UnknownIsComponent}
 {$Define _UnknownHasQI}
 {$If Defined(l3Unknown_NoIUnknown)}
  {$Define _UnknownHasAddRef}
 {$IfEnd}
{$Else}
 {$IfDef _UnknownIsComponent}
  {$Define _UnknownHasQI}
  {$Define _UnknownForDesign}
  {$If Defined(l3Unknown_NoIUnknown)}
   {$Define _UnknownHasAddRef}
  {$IfEnd}
 {$EndIf _UnknownIsComponent}
{$EndIf _UnknownIsBaseComponent}

{$IfNDef _UnknownHasQI}
 {$IfNDef _UnknownNeedsQI}
  {$Define _UnknownHasQI}
 {$EndIf  _UnknownNeedsQI}
{$EndIf _UnknownHasQI}

{$If Defined(DesignTimeLibrary) AND Defined(_UnknownForDesign)}
 _l3UnknownPrim_ = _l3UnknownPrim_Parent_;
 {$Define _Unknown_NoImpl}
{$Else}
 {$IfNDef _UnknownNotNeedL3}
  {$Define _UnknownNeedL3}
 {$EndIf  _UnknownNotNeedL3}

 {$IfNDef _UnknownNeedL3}
  {$Undef l3CheckUnfreedResources}
 {$EndIf _UnknownNeedL3}

 {$IfDef _UnknownNeedL3}
  {$I l3Define.inc }
 {$EndIf _UnknownNeedL3}

 {$IfNDef DesignTimeLibrary}
  {$IfOpt D+}
   {$Define _Final_}
  {$EndIf D+}
 {$EndIf  DesignTimeLibrary}

   _l3UnknownPrim_ = class(_l3UnknownPrim_Parent_
                           {$If not Defined(l3Unknown_NoIUnknown)}
                           , IUnknown
                           {$IfEnd})
     private
     // internal fields
       f_RefCount : Integer;
     {$IfDef _UnknownNeedL3}
     {$IfNDef l3NoObjectCache}
     private
     // internal methods
       class function  GetClassCacheEntry: Pointer;
         {-}
       class procedure SetClassCacheEntry(aValue: Pointer);
         {-}
       procedure CacheHeadPlacement;
         virtual;
         {* - место для сохранения головы кеша свободных объектов. }
     {$EndIf  l3NoObjectCache}
     {$EndIf _UnknownNeedL3}
     {$IfDef l3CheckUnfreedResources}
     private
       procedure CheckRecord(p: Pointer; typeInfo: Pointer; aClass: TClass);
        { Проверяет записи на предмет не освобожденных интерфейсов }
       procedure CheckArray(p: Pointer; typeInfo: Pointer; elemCount: Cardinal; aClass: TClass);
        { Проверяет массивы на предмет не освобожденных интерфейсов }
     {$EndIf l3CheckUnfreedResources}
     protected
     // internal methods
       // IUnknown
       {$IfNDef _UnknownHasAddRef}
       function _AddRef: Integer;
         stdcall;
         {* - реализация метода _AddRef интерфейса IUnknown, увеличивает число ссылок на объект. }
       function _Release: Integer;
         stdcall;
         {* - реализация метода _Release интерфейса IUnknown, уменьшает число ссылок на объект и уничтожает его, если число ссылок становится = 0. }
       {$EndIf  _UnknownHasAddRef}  
       // Il3Base
       function CheckStamp(const aGUID: TGUID): Boolean;
         //virtual;
         {-}
     protected
     // internal methods
       {$IfDef l3CheckUnfreedResources}
       procedure CheckResources;
        {* -  Проверяет объект на предмет не освобожденных ресурсов (интерфейсов, массивов).
              Вызывается перед укладкой в кэш. Генерит Assert!! }
       function CheckUnfreedResource(aPtrToResource: Pointer): Boolean;
        virtual;
        {* -  Является ли ссылка на поле объекта правильно не освобожденным ресурсом.
              Возвращает правильно ли не освобожден инткрфейс }
       {$EndIf l3CheckUnfreedResources}
       procedure BeforeRelease;
         virtual;
         {* - функция, вызываемая при достижении счетчиком ссылок 0, перед вызовом Release (если объект не попадает в кэш).
              При этом объект еще находится в инициализированном устойчивом состоянии. }
       procedure BeforeFree;
         virtual;{!v9}
         {* - функция, вызываемая при каждом уменьшении счетчика ссылок на 1. Вернув false может запретить уничтожение объекта. }
       procedure AfterFree;
         virtual;
         {* - функция, вызываемая после каждого уменьшении счетчика ссылок на объект, не приводящего к уничтожению объекта. }
       procedure BeforeClearFields;
         virtual;
       procedure ClearFields;
         virtual;  
       procedure Cleanup;
         virtual;
         {-}
       procedure ClearBeforeAddToCache;
         {* - функция, вызываемая перед добавлением объекта в кэш повторного использования. }
       procedure BeforeAddToCache;
         virtual;
         {* - функция, вызываемая перед добавлением объекта в кэш повторного использования. }
       procedure Release;
         virtual;
         {-}
       procedure AfterDestroyCalled;
         virtual;
         {-}
       procedure CallDestroy;
         virtual;
         {-}
       class function Cacheable: Boolean;
         {* - функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
       class function IsCacheable: Boolean;
         virtual;
         {* - функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
       class function GetFromCache: _l3UnknownPrim_;
         virtual;
         {-}
       function StoreToCache: Boolean;
         {-}
       function AddToCache: Boolean;
         virtual;
         {-}
       procedure InitAfterAlloc; virtual;
         {-}  
       class function AllocInstanceMem: TObject;
         virtual;{!v7}
         {* - функция класса реально распределяющая память под объект. }
       procedure FreeInstanceMem;
         virtual;{!v8}
         {* - процедура освобождения памяти объекта. }
       procedure InitFields;
         virtual;
         {-}
       function  NeedCleanupFields: Boolean;
         virtual;
         {[$142609247]}  
       procedure CleanupFields;
         {-}   
     public
     // public methods
       class function NewInstance: TObject;
         override;
         {* - функция распределения памяти под экземпляр объекта. Перекрыта, для контроля за памятью на объекты. }
       procedure FreeInstance;
         override;
         {* - функция освобождения памяти экземпляра объекта. Перекрыта, для контроля за памятью на объекты. }
       procedure AfterConstruction;
         override;
         {-}
       procedure BeforeDestruction;
         override;
         {-}
       destructor Destroy;
         override;
         {-}
       {$IfNDef _UnknownHasQI}
       function QueryInterface(const IID: TGUID; out Obj): HResult;
         virtual;
         stdcall;
         {-}
       {$EndIf _UnknownHasQI}  
       function  Free: Pointer;
         {* - уменьшить счетчик ссылок на 1 и вернуть указатель на себя или nil. }
       function  Use: Pointer;
         {* - увеличить счетчик ссылок на 1 и вернуть указатель на себя. }
       function SetRefTo(var F): Boolean;  
     public
     // public properties
       property RefCount: Integer
         read f_RefCount;
         {-}
   end;//_l3UnknownPrim_
{$IfEnd}

{$Else  l3UnknownPrim}
{$IfNDef _Unknown_NoImpl}
// start class _l3UnknownPrim_

destructor _l3UnknownPrim_.Destroy;
  //override;
  {-}
var
 l_Decremented : Integer;
begin
 BeforeFree;
 begin
  {$IfDef _UnknownNeedL3}
  l_Decremented := l3InterlockedDecrement(f_RefCount);
  {$Else  _UnknownNeedL3}
  l_Decremented := InterlockedDecrement(f_RefCount);
  {$EndIf _UnknownNeedL3}
  if (l_Decremented = 0) then
  begin
   Inc(f_RefCount);
   if StoreToCache then
    Exit;
   try
    try
     try
      Release;
     except
      on E: Exception do
      begin
       {$IfDef _UnknownNeedL3}
       l3System.Exception2Log(E);
       {$EndIf _UnknownNeedL3}
       {$IfNDef XE}
       //Assert(false, E.Message);
       {$EndIf  XE}
      end;// E: Exception
     end;//try..except
    finally
     try
      CallDestroy;
     except
      on E: Exception do
      begin
       {$IfDef _UnknownNeedL3}
       l3System.Exception2Log(E);
       {$EndIf _UnknownNeedL3}
      end;//on E: Exception
     end;//try..except
    end;//try..finally 
   finally
    Dec(f_RefCount);
    Assert(f_RefCount = 0);
   end;{try..finally}
  end//l_Decremented = 0
  else
   Assert(l_Decremented > 0, ClassName + ' - похоже уже освобождали. Decr =' + IntToStr(l_Decremented));
 end;//BeforeFree
end;

procedure _l3UnknownPrim_.Release;
  //virtual;
  {-}
begin
 Cleanup;
end;

procedure _l3UnknownPrim_.AfterDestroyCalled;
  //virtual;
  {-}
begin
end;

{$IfDef _UnknownIsComponent}
type
  _THackComponent = class(TPersistent)
   public
     FOwner: TComponent;
     FName: TComponentName;
     FTag: {$IfDef XE}NativeInt{$Else}Longint{$EndIf};
     FComponents: TList;
     FFreeNotifies: TList;
     FDesignInfo: Longint;
     FComponentState: TComponentState;
  end;//_THackComponent
{$EndIf _UnknownIsComponent}

procedure _l3UnknownPrim_.CallDestroy;
  //virtual;
  {-}
begin
 try
  inherited Destroy;
  // - это нужно (!) чтобы предок подумал, что нас по-честному удаляют
 except
  on E: Exception do
  begin
   {$IfDef _UnknownNeedL3}
   l3System.Exception2Log(E);
   {$EndIf _UnknownNeedL3}
   {$IfNDef XE}
   //Assert(false, E.Message);
   {$EndIf  XE}
  end;// E: Exception
 end;//try..except 
 AfterDestroyCalled;
 {$IfDef _UnknownIsComponent}
 Exclude(_THackComponent(Self).FComponentState, csDestroying);
 {$EndIf _UnknownIsComponent}
end;

procedure _l3UnknownPrim_.ClearBeforeAddToCache;
  {* - функция, вызываемая перед добавлением объекта в кэш повторного использования. }
begin
 BeforeAddToCache;
 CleanupFields;
end;

procedure _l3UnknownPrim_.BeforeAddToCache;
  //virtual;{!v14}
  {* - функция, вызываемая перед добавлением объекта в кэш повторного использования. }
begin
 try
  Cleanup;
 finally
  CallDestroy;
 end;//try..finally 
 //_l3UnknownPrim_Parent_.InitInstance(Self);
 // - почистим ВСЕ поля родителя
end;

procedure _l3UnknownPrim_.BeforeRelease;
  //virtual;
  {* - функция, вызываемая при достижении счетчиком ссылок 0, перед вызовом Release (если объект не попадает в кэш).
       При этом объект еще находится в инициализированном устойчивом состоянии. }
begin
end;
       
procedure _l3UnknownPrim_.BeforeFree;
  //virtual;{!v9}
  {* - функция, вызываемая при каждом уменьшении счетчика ссылок на 1. Вернув false может запретить уничтожение объекта. }
begin
end;

procedure _l3UnknownPrim_.AfterFree;
  {virtual;{!v7}
  {-}
begin
end;

procedure _l3UnknownPrim_.BeforeClearFields;
  //virtual;
begin
end;

procedure _l3UnknownPrim_.ClearFields;
  //virtual;
begin
end;

procedure _l3UnknownPrim_.Cleanup;
  //virtual;
  {-}
begin
 BeforeClearFields;
 ClearFields;
end;

class function _l3UnknownPrim_.Cacheable: Boolean;
  {* - функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
begin
 {$IfDef DisableObjectsCache}
 Result := false;
 {$Else  DisableObjectsCache}
 {$IfDef DesignTimeLibrary}
 Result := false;
 {$Else  DesignTimeLibrary}
 {$IfDef XE}
 Result := IsCacheable;
 //Result := false;
 {$Else  XE}
 Result := IsCacheable;
 {$EndIf XE}
 {$EndIf DesignTimeLibrary}
 {$EndIf DisableObjectsCache}
end;

class function _l3UnknownPrim_.IsCacheable: Boolean;
  //virtual;
  {* - функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
begin
 Result := false;
end;

class function _l3UnknownPrim_.GetFromCache: _l3UnknownPrim_;
  {-}
begin
 {$IfDef _UnknownNeedL3}
 {$IfDef l3NoObjectCache}
 Result := nil;
 {$Else   l3NoObjectCache}
 Result := Tl3System(g_l3System).GetFromCache(GetClassCacheEntry);
 {$EndIf  l3NoObjectCache}
 {$Else  _UnknownNeedL3}
 Result := nil;
 {$EndIf _UnknownNeedL3}
end;

function _l3UnknownPrim_.StoreToCache: Boolean;
  {-}
{$IfDef _UnknownNeedL3}
var
 l_System : Tl3System;
{$EndIf _UnknownNeedL3}
begin
 if (Self = nil) then
  Result := false
 else
 begin
  {$IfDef _UnknownNeedL3}
  l_System := Tl3System(g_l3System);
  if (l_System <> nil) AND l_System.CanCache AND Cacheable then
   Result := AddToCache
  else
   Result := false;
  {$Else  _UnknownNeedL3}
  Result := false;
  {$EndIf _UnknownNeedL3}
 end;//Self = nil
end;

function _l3UnknownPrim_.AddToCache: Boolean;
  {-}
{$IfDef _UnknownNeedL3}
{$IfNDef l3NoObjectCache}
var
 l_P : Tl3CacheProcs;
 {$EndIf l3NoObjectCache}
{$EndIf _UnknownNeedL3}
begin
 {$IfDef _UnknownNeedL3}
 {$IfDef l3NoObjectCache}
 Result := false;
 {$Else  l3NoObjectCache}
 l_P.aGet := GetClassCacheEntry;
 l_P.aSet := SetClassCacheEntry;
 l_P.aBeforeAddToCache := ClearBeforeAddToCache;
 Result := Tl3System(g_l3System).AddToCache(Self, l_P);
 {$EndIf l3NoObjectCache}
 {$Else  _UnknownNeedL3}
 Result := false;
 {$EndIf _UnknownNeedL3}
end;

{$IfDef _UnknownNeedL3}
{$IfNDef l3NoObjectCache}
class function _l3UnknownPrim_.GetClassCacheEntry: Pointer;
  {-}
var
 l_Head : PPointer;
begin
 asm
  mov edx, VMTOffset _l3UnknownPrim_.CacheHeadPlacement
  add edx, eax
  mov l_Head, edx
 end;//asm
 Result := l_Head^;
 if (Result = @_l3UnknownPrim_.CacheHeadPlacement) then
  Result := nil;
end;

class procedure _l3UnknownPrim_.SetClassCacheEntry(aValue: Pointer);
  {-}
var
 l_Head : PPointer;
 l_Old  : DWORD;
 l_Old1 : DWORD;
begin
 asm
  mov edx, VMTOffset _l3UnknownPrim_.CacheHeadPlacement
  add edx, eax
  mov l_Head, edx
 end;//asm
 if (l_Head^ = @_l3UnknownPrim_.CacheHeadPlacement) then
 begin
  VirtualProtect(l_Head, 4, PAGE_EXECUTE_READWRITE, @l_Old);
  l_Head^ := aValue;
  VirtualProtect(l_Head, 4, l_Old, @l_Old1);
 end//l_Head^ = @_l3UnknownPrim_.CacheHeadPlacement
 else
  Assert(false);
end;

procedure _l3UnknownPrim_.CacheHeadPlacement;
  //virtual;
  {* - место для сохранения головы кеша свободных объектов. }
begin
end;
{$EndIf l3NoObjectCache}
{$EndIf _UnknownNeedL3}

class function _l3UnknownPrim_.AllocInstanceMem: TObject;
  //virtual;{!v7}
  {* - функция класса реально распределяющая память под объект. }
begin
 {$IfDef _UnknownNeedL3}
 if Cacheable then
 begin
  l3System.GetMM(false).GetMem(Result, Self);
  Result := InitInstance(Result);
 end//Cacheable
 else
 {$EndIf _UnknownNeedL3}
  Result := inherited NewInstance;
end;

procedure _l3UnknownPrim_.FreeInstanceMem;
  //virtual;{!v8}
  {* - процедура освобождения памяти объекта. }
begin
 {$IfDef _UnknownNeedL3}
 if Cacheable then
 begin
  CleanupInstance;
  //if not l3SystemDown then
   l3System.GetMM(true).FreeMem(Self);
 end//NeedStoreInPool
 else
 {$EndIf _UnknownNeedL3}
  inherited FreeInstance;
end;

procedure _l3UnknownPrim_.InitAfterAlloc;
  {-}
begin
end;
  
class function _l3UnknownPrim_.NewInstance: TObject;
  //override;
  {* - функция распределения памяти под экземпляр объекта. Перекрыта, для контроля за памятью на объекты. }
{$IfDef _UnknownNeedL3}
var
 l_System : Tl3System;
{$EndIf _UnknownNeedL3} 
begin
 {$IfDef _UnknownNeedL3}
 l_System := Tl3System(g_l3System);
 if (l_System = nil) then
 begin
  if not l3MemUtilsDown{l3SystemDown} then
  begin
   l_System := l3System;
//   if (l_System <> nil) then
//    l_System.Stack2Log('Возможная непарность NewInstance/FreeInatance');
  end;//not l3SystemDown
 end;//l_System = nil
 Assert((l_System <> nil) OR not Cacheable); 
 if (l_System <> nil) AND l_System.CanCache AND Cacheable then
 begin
  Result := GetFromCache;
  if (Result <> nil) then
  begin
   _l3UnknownPrim_(Result).InitAfterAlloc;
   Exit;
  end;//Result <> nil
 end;{l_System.CanCache}
 {$EndIf _UnknownNeedL3}
 Result := AllocInstanceMem;
 _l3UnknownPrim_(Result).Use;
 _l3UnknownPrim_(Result).InitAfterAlloc;
 {$IfDef _UnknownNeedL3}
 {$IfDef l3TraceObjects}
 if (l_System <> nil) then
  l_System.RegisterObject(Result, Cacheable);
 {$EndIf l3TraceObjects}
 {$EndIf _UnknownNeedL3}
end;

procedure _l3UnknownPrim_.FreeInstance;
  //override;
  {* - функция освобождения памяти экземпляра объекта. Перекрыта, для контроля за памятью на объекты. }
begin
 if (f_RefCount = 0) then
 begin
  {$IfDef _UnknownNeedL3}
  {$IfDef l3TraceObjects}
  if (g_l3System <> nil) then
   l3System.UnregisterObject(Self, Cacheable);
  {$EndIf l3TraceObjects}
  {$EndIf  _UnknownNeedL3}
  FreeInstanceMem;
 end//f_RefCount = 0
 else
  AfterFree;
end;

procedure _l3UnknownPrim_.InitFields;
  //virtual;
  {-}
begin
end;

function _l3UnknownPrim_.NeedCleanupFields: Boolean;
  //virtual;
  {-}
begin
 Result := false;
end;

procedure _l3UnknownPrim_.CleanupFields;
  {-}
var
 l_RefCount : Integer;  
begin
 if NeedCleanupFields then
 begin
  Assert(false,'Не работает !!! из-за того, что чистятся ссылки на интерфейсы');
  CleanupInstance;
  l_RefCount := f_RefCount;
  InitInstance(Self);
  // - может так заработает
(*  {$IfDef _UnknownNeedL3}
  l3FillChar((PAnsiChar(Self) + SizeOf(Pointer))^, InstanceSize - SizeOf(Pointer));
  {$Else  _UnknownNeedL3}
  FillChar((PAnsiChar(Self) + SizeOf(Pointer))^, InstanceSize - SizeOf(Pointer), 0);
  {$EndIf _UnknownNeedL3}*)
  f_RefCount := l_RefCount;
 end//NeedCleanupFields
 {$IfDef l3CheckUnfreedResources}
 else
  CheckResources
 {$EndIf l3CheckUnfreedResources}
 ;
end;
  
procedure _l3UnknownPrim_.AfterConstruction;
  //override;
  {-}
begin
 inherited;
 {$IfDef _UnknownIsComponent}
 Include(_THackComponent(Self).FComponentState, csFreeNotification);
 {$EndIf _UnknownIsComponent}
 InitFields;
end;

procedure _l3UnknownPrim_.BeforeDestruction;
  //override;
  {-}
begin
 if (f_RefCount = 1) then
 begin
  inherited BeforeDestruction;
  try
   BeforeRelease;
  except
   {$IfDef _UnknownNeedL3}
   on E: Exception do
    l3System.Exception2Log(E);
   {$Else  _UnknownNeedL3}
   raise;
   {$EndIf _UnknownNeedL3}
  end;//try..except
  //f_RefCount = 1
 end;//f_RefCount = 1
end;

{$IfNDef _UnknownHasAddRef}
function _l3UnknownPrim_._AddRef: Integer;
  //stdcall;
  {* - реализация метода _AddRef интерфейса IUnknown, увеличивает число ссылок на объект. }
begin
 Use;
 Result := f_RefCount;
end;

function _l3UnknownPrim_._Release: Integer;
  //stdcall;
  {* - реализация метода _Release интерфейса IUnknown, уменьшает число ссылок на объект и уничтожает его, если число ссылок становится = 0. }
begin
 if (Free = nil) then Result := 0 else Result := f_RefCount;
end;
{$EndIf _UnknownHasAddRef}

function _l3UnknownPrim_.CheckStamp(const aGUID: TGUID): Boolean;
  {-}
begin
 {$IfDef _UnknownNeedL3}
 if l3SystemDown then
  Result := false
 else
  Result := IsEqualGUID(l3System.GetStamp, aGUID);
 {$Else _UnknownNeedL3}
 Result := false;
 {$EndIf _UnknownNeedL3}
end;

{$IfNDef _UnknownHasQI}
function _l3UnknownPrim_.QueryInterface(const IID: TGUID; out Obj): HResult;
  //virtual;
  //stdcall;
  {-}
begin
 if TObject(Self).GetInterface(IID, Obj) then
  Result := S_Ok
 else
  Result := E_NoInterface;
end;
{$EndIf _UnknownHasQI}

function _l3UnknownPrim_.Free: Pointer;
  {-}
begin
 Result := nil;
 if (Self <> nil) then
 begin
  if (f_RefCount > 1) then Result := Self;
  inherited Free
 end;//Self <> nil
end;

function _l3UnknownPrim_.Use: Pointer;
  {-}
begin
 {$IfDef l3Unknown_NoMultiThread}
 if (Self <> nil) then Inc(f_RefCount);
 {$Else l3Unknown_NoMultiThread}
 {$IfDef _UnknownNeedL3}
 if (Self <> nil) then l3InterlockedIncrement(f_RefCount);
 {$Else  _UnknownNeedL3}
 if (Self <> nil) then InterlockedIncrement(f_RefCount);
 {$EndIf _UnknownNeedL3}
 {$EndIf l3Unknown_NoMultiThread}
 {$IfDef _UnknownHasAddRef}
 Assert(f_RefCount <= 1);
 {$EndIf _UnknownHasAddRef}
 Result := Self;
end;

function _l3UnknownPrim_.SetRefTo(var F): Boolean;
begin
 if (Pointer(F) = Self) then
  Result := false
 else
 begin
  Result := true;
  TObject(F).Free;
  Pointer(F) := Self.Use;
 end;//Pointer(F) = V
end;

{$IfDef l3CheckUnfreedResources}
const
  tkLString   = 10;
  _tkWString   = 11;
  tkVariant   = 12;
  tkArray     = 13;
  tkRecord    = 14;
  tkInterface = 15;
  tkDynArray  = 17;

type
 PPTypeInfo = ^PTypeInfo;
 PTypeInfo = ^TTypeInfo;
 TTypeInfo = packed record
  Kind: Byte;
  Name: ShortString;
  {TypeData: TTypeData}
 end;

 TFieldInfo = packed record
  TypeInfo: PPTypeInfo;
  Offset: Cardinal;
 end;

 PFieldTable = ^TFieldTable;
 TFieldTable = packed record
  X: Word;
  Size: Cardinal;
  Count: Cardinal;
  Fields: array [0..0] of TFieldInfo;
 end;

 PDynArrayTypeInfo = ^TDynArrayTypeInfo;
 {$EXTERNALSYM PDynArrayTypeInfo}
 TDynArrayTypeInfo = packed record
  kind: Byte;
  name: string[0];
  elSize: Longint;
  elType: ^PDynArrayTypeInfo;
  varType: Integer;
 end;

function DynArrayElTypeInfo(typeInfo: PDynArrayTypeInfo): PDynArrayTypeInfo;
begin
 Result := nil;
 if typeInfo <> nil then
 begin
  Inc(PAnsiChar(typeInfo), Length(typeInfo.name));
  if typeInfo.elType <> nil then
   Result := typeInfo.elType^;
 end;
end;

procedure _l3UnknownPrim_.CheckResources;
var
 ClassPtr: TClass;
 InitTable: Pointer;
begin
 ClassPtr := Self.ClassType;
 InitTable := PPointer(Integer(ClassPtr) + vmtInitTable)^;
 while (ClassPtr <> nil) do
 begin
  if InitTable <> nil then
   CheckRecord(Self, InitTable, ClassPtr);
  ClassPtr := ClassPtr.ClassParent;
  if ClassPtr <> nil then
   InitTable := PPointer(Integer(ClassPtr) + vmtInitTable)^;
 end;
end;

{$R-}
procedure _l3UnknownPrim_.CheckRecord(p: Pointer; typeInfo: Pointer; aClass: TClass);
var
 FT: PFieldTable;
 I: Cardinal;
begin
 FT := PFieldTable(Integer(typeInfo) + Byte(PTypeInfo(typeInfo).Name[0]));
 for I := 0 to FT.Count-1 do
  CheckArray(Pointer(Cardinal(P) + FT.Fields[I].Offset), FT.Fields[I].TypeInfo^, 1, aClass);
end;
{$R+}

procedure _l3UnknownPrim_.CheckArray(p: Pointer; typeInfo: Pointer; elemCount: Cardinal; aClass: TClass);
var
 FT: PFieldTable;
 DAT: PDynArrayTypeInfo;
begin
 if elemCount = 0 then Exit;
 case PTypeInfo(typeInfo).Kind of
  tkLString,
  _tkWString: ;
  tkVariant: // Варианты обрабатываем минимально (без раскрутки массивов), поскольку практически их не пользуем
   while elemCount > 0 do
   begin                                                                                             
    if ((PVarData(P)^.VType in [varUnknown, varDispatch]) and (PVarData(P)^.VDispatch<>Nil)) or
       (((PVarData(P)^.VType = varUnknown + varByRef) or (PVarData(P)^.VType = varDispatch + varByRef)) and (Pointer(PVarData(P)^.VPointer^)<>Nil)) Then
     Assert(CheckUnfreedResource(P),'Unfreed variant interface in class '+aClass.ClassName+'.');
    Inc(Integer(P), sizeof(Variant));
    Dec(elemCount);
   end;
  tkArray:
   begin
    FT := PFieldTable(Integer(typeInfo) + Byte(PTypeInfo(typeInfo).Name[0]));
    while elemCount > 0 do
    begin
     CheckArray(P, FT.Fields[0].TypeInfo^, FT.Count, aClass);
     Inc(Integer(P), FT.Size);
     Dec(elemCount);
    end;
   end;
  tkRecord:
   begin
    FT := PFieldTable(Integer(typeInfo) + Byte(PTypeInfo(typeInfo).Name[0]));
    while elemCount > 0 do
    begin
     CheckRecord(P, typeInfo, aClass);
     Inc(Integer(P), FT.Size);
     Dec(elemCount);
    end;
   end;
  tkInterface:
   while elemCount > 0 do
   begin
    If IInterface(P^) <> nil then
     Assert(CheckUnfreedResource(P),'Unfreed interface in class '+aClass.ClassName+'. Interface type '+PTypeInfo(typeInfo).Name+'.');
    Inc(Integer(P), 4);
    Dec(elemCount);
   end;
  tkDynArray:
   begin
    If (Pointer(P^)<>nil) and (PInteger(Integer(Pointer(P^))-4)^>0) then
     Assert(CheckUnfreedResource(P),'Unfreed dynamic array in class '+aClass.ClassName+'.');
    Dat := DynArrayElTypeInfo(typeInfo);
    while elemCount > 0 do
    begin
     if (Dat<>nil) and (Pointer(P^)<>nil) then
      CheckArray(P, PTypeInfo(Dat), PInteger(Integer(Pointer(P^))-4)^, aClass);
     Inc(Integer(P), 4);
     Dec(elemCount);
    end;
   end;
 else
  Assert(False,'Unknown object field kind');
 end;
end;

function _l3UnknownPrim_.CheckUnfreedResource(aPtrToResource: Pointer): Boolean;
begin
 Result := false;
end;

{$EndIf l3CheckUnfreedResources}

{$EndIf _Unknown_NoImpl}
{$EndIf l3UnknownPrim}
