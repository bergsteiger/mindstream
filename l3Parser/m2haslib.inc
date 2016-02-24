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


                function          InitProc00000002    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000002    (
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

    _AllocData16(Cm2HASVersionCRC);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000001(
                                         );
 begin

  with Self do
   begin

    _FreeData16(Cm2HASVersionCRC);

   end;

 end;

 function    TUnitHelper.InitProc00000002(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData32(Cm2HASVersionCRC);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000002(
                                         );
 begin

  with Self do
   begin

    _FreeData32(Cm2HASVersionCRC);

   end;

 end;

// TUnitHelper.protected

// TUnitHelper.public

 constructor TUnitHelper.Create(
                               );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001));
  m2InitOperation(_Status,InitProc00000002($00000002));

 end;

 destructor  TUnitHelper.Destroy(
                                );
 begin

  m2DoneOperation(_Status,$00000002,DoneProc00000002);
  m2DoneOperation(_Status,$00000001,DoneProc00000001);

  inherited Destroy();

 end;

// TUnitHelper.end


 initialization GUnitHelper:=TUnitHelper.Create();
 finalization   GUnitHelper.Free();
