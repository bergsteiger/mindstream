unit k2BaseTypes;
{$Include l3Define.inc}

interface

type
 Tk2StorePropertyFlag = (
  {* Режим сохранения типов тегов. }
   l3_spfScalars
 , l3_spfObjects
 , l3_spfChildren
 , l3_spfRawData
 );//Tk2StorePropertyFlag

 Tk2StorePropertyFlags = set of Tk2StorePropertyFlag;
  {* Режимы сохранения типов тегов. }

const
 l3_spfAll = [Low(Tk2StorePropertyFlag)..High(Tk2StorePropertyFlag)];
  {* режим сохранения всех типов тегов. }
 l3_spfInner = l3_spfAll;
  {* режим сохранения всех вложенных тегов целиком. }

type
 Tk2AssignMode = (
  {* Режим копирования спецзначений тегов. }
   k2_amNull
 , k2_amTransparent
 );//Tk2AssignMode

 Tk2AssignModes = set of Tk2AssignMode;
  {* Режимы копирования спецзначений тегов. }

const
 k2_amAll = [Low(Tk2AssignMode)..High(Tk2AssignMode)];
  {* режим копирования всех значений тегов. }

implementation

end.