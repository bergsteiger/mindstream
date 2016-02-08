unit l3AsyncTask;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoObject
  ;

type
 Tl3AsyncTask = class(Tl3ProtoObject)
 public
 // public methods
   procedure Exec; virtual; abstract;
     {* Сигнатура метода Exec }
 end;//Tl3AsyncTask

implementation

end.