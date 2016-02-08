(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
 type
        TUnitHelper               = class(TObject)
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


         private


         protected


         public


                constructor       Create              (
                                                      );

                destructor        Destroy             (
                                                      ); override;


         end;


 var
        GUnitHelper:              TUnitHelper = nil;


// TUnitHelper.private

 function    TUnitHelper.InitProc00000001(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    InitializeCriticalSection(GRTLCriticalSection);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000001(
                                         );
 begin

  with Self do
   begin

    DeleteCriticalSection(GRTLCriticalSection);

   end;

 end;

// TUnitHelper.protected

// TUnitHelper.public

 constructor TUnitHelper.Create(
                               );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001));

 end;

 destructor  TUnitHelper.Destroy(
                                );
 begin

  m2DoneOperation(_Status,$00000001,DoneProc00000001);

  inherited Destroy();

 end;

// TUnitHelper.end


 initialization GUnitHelper:=TUnitHelper.Create();
 finalization   GUnitHelper.Free();
