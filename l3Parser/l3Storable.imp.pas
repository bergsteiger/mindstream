{$IfNDef l3Storable_imp}
 
{$Define l3Storable_imp}
 _l3Storable_ = {abstract mixin} class(_l3Storable_Parent_)
  {* Объект умеющий писать/читать себя. }
 public
 // public methods
   procedure SaveToFile(const aFileName: AnsiString);
     {* Сохранить в файл. }
   procedure SaveToStream(const aStream: IStream); overload; 
     {* Сохранить в поток. }
   procedure SaveToStream(aStream: TStream); overload;  virtual; abstract; // can raise El3Exception
     {* Сохраняет в поток. }
   procedure LoadFromFile(const aFileName: AnsiString;
    aNeedSort: Boolean = true);
     {* Загружает из файла. }
   procedure LoadFromStream(const aStream: IStream;
    aNeedSort: Boolean); overload; 
     {* Загружает из потока. }
   procedure LoadFromStream(aStream: TStream;
    aNeedSort: Boolean); overload;  virtual; abstract; // can raise El3Exception
     {* Загружает из потока. }
 end;//_l3Storable_

{$Else l3Storable_imp}

// start class _l3Storable_

procedure _l3Storable_.SaveToFile(const aFileName: AnsiString);
//#UC START# *47B17CE4033C_47B17CBC0356_var*
var
 l_Stream : TStream;
//#UC END# *47B17CE4033C_47B17CBC0356_var*
begin
//#UC START# *47B17CE4033C_47B17CBC0356_impl*
 l_Stream := Tl3TextStream.Create(aFileName, l3_fmWrite);
 try
  SaveToStream(l_Stream);
 finally
  l3Free(l_Stream);
 end;//try..finally
//#UC END# *47B17CE4033C_47B17CBC0356_impl*
end;//_l3Storable_.SaveToFile

procedure _l3Storable_.SaveToStream(const aStream: IStream);
//#UC START# *47B17D240289_47B17CBC0356_var*
var
 l_Stream : TStream;
//#UC END# *47B17D240289_47B17CBC0356_var*
begin
//#UC START# *47B17D240289_47B17CBC0356_impl*
 l3IStream2Stream(aStream, l_Stream);
 try
  SaveToStream(l_Stream);
 finally
  l3Free(l_Stream);
 end;//try..finally
//#UC END# *47B17D240289_47B17CBC0356_impl*
end;//_l3Storable_.SaveToStream

procedure _l3Storable_.LoadFromFile(const aFileName: AnsiString;
  aNeedSort: Boolean = true);
//#UC START# *47B19B0D0201_47B17CBC0356_var*
var
 l_Stream : TStream;
//#UC END# *47B19B0D0201_47B17CBC0356_var*
begin
//#UC START# *47B19B0D0201_47B17CBC0356_impl*
 try
  l_Stream := Tl3TextStream.Create(aFileName, l3_fmRead);
 except
  on EOSError do Exit;
 end;//try..except
 try
  LoadFromStream(l_Stream, aNeedSort);
 finally
  l3Free(l_Stream);
 end;//try..finally
//#UC END# *47B19B0D0201_47B17CBC0356_impl*
end;//_l3Storable_.LoadFromFile

procedure _l3Storable_.LoadFromStream(const aStream: IStream;
  aNeedSort: Boolean);
//#UC START# *47B19B58033C_47B17CBC0356_var*
var
 l_Stream : TStream;
//#UC END# *47B19B58033C_47B17CBC0356_var*
begin
//#UC START# *47B19B58033C_47B17CBC0356_impl*
 l3IStream2Stream(aStream, l_Stream);
 try
  LoadFromStream(l_Stream, aNeedSort);
 finally
  l3Free(l_Stream);
 end;//try..finally
//#UC END# *47B19B58033C_47B17CBC0356_impl*
end;//_l3Storable_.LoadFromStream

{$EndIf l3Storable_imp}
