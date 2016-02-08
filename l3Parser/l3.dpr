program l3;

{$AppType Console}

(*
 Ќа корень CVS должен быть смапирован диск W:
*)

(*
 ƒолжна быть определена переменна€ окружени€ binout » в ней две директории EXE и Units
*)

uses
  SysUtils,
  
  l3ProtoObject,
  l3ProtoObjectRefList,
  l3ProtoObjectPtrList,

  l3ProtoObjectRefSortableList,

  l3LongintList,
  l3Base,

  IntStack,
  StringStack
  ;

procedure TestList;
const
 cEtalon : array [0..4] of Integer = (1, 2, 3, 4, 5);

 function DoItem(pItem : PInteger; anIndex : Integer) : Boolean;
 begin
  Result := true;
  assert(pItem^ = cEtalon[anIndex]);
 end;

var
 l_L : Tl3LongintList;
 l_I : Integer;
begin
 l_L := Tl3LongintList.Create;
 try
  for l_I := Low(cEtalon) to High(cEtalon) do
   l_L.Add(cEtalon[l_I]);
  for l_I := Low(cEtalon) to High(cEtalon) do
   assert(l_L.Items[l_I] = cEtalon[l_I]);
  l_L.IterateAllF(l3L2IA(@DoItem)); 
  l_L.IterateBackF(l_L.Hi, l_L.Lo, l3L2IA(@DoItem)); 
 finally
  FreeAndNil(l_L);
 end;//try..finally
end;

var
 l_A : Tl3ProtoObject;
 l_B : Tl3ProtoObject;
 l_Refs : Tl3ProtoObjectRefList;
 l_Ptrs : Tl3ProtoObjectRefList;
begin
 TestList;
 l_Refs := Tl3ProtoObjectRefList.Create;
 try
  l_A := Tl3ProtoObject.Create;
  try
   WriteLn(l_A.RefCount);
   l_Refs.Add(l_A);
   WriteLn(l_Refs.First.RefCount);
   WriteLn(l_A.RefCount);
  finally
   FreeAndNil(l_A);
  end;//try..finally
  // - тут с l_A всЄ в пор€дке
  WriteLn(l_Refs.First.RefCount);
  l_B := Tl3ProtoObject.Create;
  try
   l_Refs.Add(l_B);
  finally
   FreeAndNil(l_B);
  end;//try..finally
  // - тут с l_B всЄ в пор€дке
 finally
  FreeAndNil(l_Refs);
 end;//try..finally
 // - список удалилс€ и за собой всЄ почистил

 l_Ptrs := Tl3ProtoObjectRefList.Create;
 try
  l_A := Tl3ProtoObject.Create;
  try
   l_Ptrs.Add(l_A);
  finally
   FreeAndNil(l_A);
  end;//try..finally
  // - тут ссылка на l_A в l_Ptrs стала невалидна
  l_B := Tl3ProtoObject.Create;
  try
   l_Ptrs.Add(l_B);
  finally
   FreeAndNil(l_B);
  end;//try..finally
  // - тут ссылка на l_B в l_Ptrs стала невалидна
 finally
  FreeAndNil(l_Ptrs);
 end;//try..finally
end.