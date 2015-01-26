unit msRemoverIcon;

interface

uses
 msSVGShape,
 msInterfaces
 ;

type
 TmsRemoverIcon = class(TmsSVGShape)
 // - "Иконка для удаления фигур"
 protected
  function GetPolygonSVG: String; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 public
  class function IsForToolbar: Boolean; override;
 end;//TmsFolder

implementation

uses
 System.UITypes
 ;

// TmsFolder

function TmsRemoverIcon.GetPolygonSVG: String;
begin
 Result := 'M 10,30 L 30,10 L 50,30 L 70,10 L 90,30 L 70,50 L 90,70' +
           'L 70,90 L 50,70 L 30,90 L 10,70 L 30,50 L 30,50 L 10,30';
end;

class function TmsRemoverIcon.IsForToolbar: Boolean;
begin
 Result := False;
end;

procedure TmsRemoverIcon.TransformDrawOptionsContext(
  var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Mediumvioletred;
end;

end.
