program project1;
uses unitgod1;
var
  T:Triangle;

begin
     T:=CreateTriangle;


     WriteLn('Min= ',MinDistance(T):0:6);
     WriteLn('Max= ',MaxDistance(T):0:6);
     ReadLn();

end.


