unit Drawness;

interface

uses
 FMX.Graphics, System.Types, FMX.Types, Generics.Collections, System.SysUtils, msShape;

type
 TShapeList = TObjectList<TmsShape>;

 TShapes = (sPen, sLine, sRectangle);

 TmsDrawness = class
 private
  FShapeList : TShapeList;
 public
  constructor Create;
  destructor Destroy; override;
  procedure DrawTo(const aCanvas : TCanvas);
  procedure AddPrimitive(const aShape : TmsShape);
  procedure DrawLastPrimitive(const aCanvas : TCanvas);
 end;

implementation

{ TDrawness }

procedure TmsDrawness.AddPrimitive(const aShape: TmsShape);
begin
 FShapeList.Add(aShape);
end;

constructor TmsDrawness.Create;
begin
 FShapeList := TShapeList.Create();
end;

destructor TmsDrawness.Destroy;
begin
 freeandnil(FShapeList);
 inherited;
end;

procedure TmsDrawness.DrawLastPrimitive(const aCanvas: TCanvas);
begin
 FShapeList.Last.DrawTo(aCanvas);
end;

procedure TmsDrawness.DrawTo(const aCanvas: TCanvas);
var
 i : Integer;
begin
 for i:= 0 to FShapeList.Count-1
  do FShapeList[i].DrawTo(aCanvas);
end;

end.
