function fillInVals(obj, a, b, c, d)
   a.obj = obj.a
   b.obj=obj.b
   c.obj=obj.c
   d.obj=obj.c
   a = rmfield(a, 'obj')
   b = rmfield(b, 'obj')
   c=  rmfield(c, 'obj')
   d = rmfield(d, 'obj')
end