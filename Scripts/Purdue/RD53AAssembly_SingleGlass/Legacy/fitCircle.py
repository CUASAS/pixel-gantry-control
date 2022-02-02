def fitCircle(v_x, v_y):
  n = len(v_x)
  Mx = 0
  My = 0
  Mz = 0
  Mxx = 0
  Myy = 0
  Mxy = 0
  Mxz = 0
  Myz = 0
  for i in range(0, n):
    x = v_x[i]
    y = v_y[i]
    z = x*x + y*y
    Mx = Mx + x
    My = My + y
    Mz = Mz + z
    Mxx = Mxx + x*x
    Myy = Myy + y*y
    Mxy = Mxy + x*y
    Mxz = Mxz + x*z
    Myz = Myz + y*z
  xc = 0.5 * ((n*Mxy - Mx*My)*(My*Mz - n*Myz) - (n*Myy - My**2)*(Mx*Mz - n*Mxz)) / ((n*Mxx - Mx**2)*(n*Myy - My**2) - (n*Mxy - Mx*My)**2)
  yc = 0.5 * ((n*Mxy - Mx*My)*(Mx*Mz - n*Mxz) - (n*Mxx - Mx**2)*(My*Mz - n*Myz)) / ((n*Mxx - Mx**2)*(n*Myy - My**2) - (n*Mxy - Mx*My)**2)
  return (xc, yc)

# v_x = [478.872, 479.577, 478.818, 478.083]
# v_y = [363.881, 363.127, 362.378, 363.277]
v_x = [500.244, 500.984, 501.720, 501.004]
v_y = [363.277, 362.579, 363.172, 364.078]

(xc, yc) = fitCircle(v_x, v_y)

print("xc = "+str(xc))
print("yc = "+str(yc))

tl = (439.886, 527.934)
tr = (461.121, 527.900)
tc = ((tl[0] + tr[0])/2., (tl[1] + tr[1])/2.)

print("tc = "+str(tc))

d = ((xc - tc[0])**2 + (yc - tc[1])**2)**0.5
print("d = "+str(d))
