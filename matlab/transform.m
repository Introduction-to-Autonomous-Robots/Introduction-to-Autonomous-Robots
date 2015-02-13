function T=transform(R,t);
try,
 T=[R t;0 0 0 1];
catch
 T=[R t';0 0 0 1];
end;