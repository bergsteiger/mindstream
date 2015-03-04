unit msRemoveIcon;

interface

uses
 msSVGShape,
 msInterfaces
 ;

type
 TmsRemoveIcon = class(TmsSVGShape)
 // - "Иконка для удаления фигур"
 protected
  function GetPolygonSVG: String; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsRemoveIcon

implementation

uses
 System.UITypes
 ;

// TmsRemoveIcon

function TmsRemoveIcon.GetPolygonSVG: String;
begin
 Result := 'M 10,30 L 30,10 L 50,30 L 70,10 L 90,30 L 70,50 L 90,70' +
           'L 70,90 L 50,70 L 30,90 L 10,70 L 30,50 L 30,50 L 10,30';
end;

procedure TmsRemoveIcon.TransformDrawOptionsContext(
  var theCtx: TmsDrawOptionsContext);
begin
 inherited;
end;

end.
