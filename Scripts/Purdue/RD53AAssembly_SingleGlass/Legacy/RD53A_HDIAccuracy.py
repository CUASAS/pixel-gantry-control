# import ROOT
import statistics
import math

def extractLineInfo(line):
  if len(line) > 2:
    if line[27:32] == "chuck":
      fiducial = line[27:77]
      pos1 = line.find(",", 81)
      pos2 = line.find(",", pos1+1)
      pos3 = line.find(",", pos2+1)
      pos4 = line.find(",", pos3+1)
      pos5 = line.find(",", pos4+1)
      pos6 = line.find(",", pos5+1)
      pos7 = line.find(",", pos6+1)
      pos8 = line.find(",", pos7+1)
      pos9 = line.find(",", pos8+1)
      pos10 = line.find(",", pos9+1)
      pos11 = line.find(",", pos10+1)
      pos12 = line.find("}", pos11+1)
      Lx = float(line[81:pos1])
      Ly = float(line[pos1+1:pos2])
      Lz = float(line[pos2+1:pos3-1])
      Rx = float(line[pos3+3:pos4])
      Ry = float(line[pos4+1:pos5])
      Rz = float(line[pos5+1:pos6-1])
      Tx = float(line[pos6+3:pos7])
      Ty = float(line[pos7+1:pos8])
      Tz = float(line[pos8+1:pos9-1])
      Bx = float(line[pos9+3:pos10])
      By = float(line[pos10+1:pos11])
      Bz = float(line[pos11+1:pos12])
      #print (fiducial, Lx, Ly, Lz, Rx, Ry, Rz, Tx, Ty, Tz, Bx, By, Bz)
      return (fiducial, Lx, Ly, Lz, Rx, Ry, Rz, Tx, Ty, Tz, Bx, By, Bz)

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

def angleBetweenVectors(v1, v2):
  dotproduct = v1[0]*v2[0] + v1[1]*v2[1]
  norm_v1 = (v1[0]**2 + v1[1]**2)**0.5
  norm_v2 = (v2[0]**2 + v2[1]**2)**0.5
  theta = math.acos(dotproduct/(norm_v1*norm_v2))
  return theta

def diffVectors(v1, v2):
  diff = (v1[0]-v2[0], v1[1]-v2[1])
  return diff

# ===== MAIN =====
# Souvik Das
# ================

file = open("LOG_Assembly_RD53A_SingleSensor.txt")
line = file.readline()

readings = 0
v_translationX = []
v_translationY = []
v_theta = []
while line:
  if len(line) > 40:
    (fiducial, Lx, Ly, Lz, Rx, Ry, Rz, Tx, Ty, Tz, Bx, By, Bz) = extractLineInfo(line)
    if fiducial == "chuck2_x1_L, chuck2_x1_R, chuck2_x1_T, chuck2_x1_B":
      v_x = [Lx, Rx, Tx, Bx]
      v_y = [Ly, Ry, Ty, By]
      chuck2_x1 = fitCircle(v_x, v_y)
      readings = readings + 1
    if fiducial == "chuck2_x2_L, chuck2_x2_R, chuck2_x2_T, chuck2_x2_B":
      v_x = [Lx, Rx, Tx, Bx]
      v_y = [Ly, Ry, Ty, By]
      chuck2_x2 = fitCircle(v_x, v_y)
      readings = readings + 1
    if fiducial == "chuck2_x3_L, chuck2_x3_R, chuck2_x3_T, chuck2_x3_B":
      v_x = [Lx, Rx, Tx, Bx]
      v_y = [Ly, Ry, Ty, By]
      chuck2_x3 = fitCircle(v_x, v_y)
      readings = readings + 1
    if fiducial == "chuck1_x1_L, chuck1_x1_R, chuck1_x1_T, chuck1_x1_B":
      v_x = [Lx, Rx, Tx, Bx]
      v_y = [Ly, Ry, Ty, By]
      chuck1_x1 = fitCircle(v_x, v_y)
      readings = readings + 1
    if fiducial == "chuck1_x2_L, chuck1_x2_R, chuck1_x2_T, chuck1_x2_B":
      v_x = [Lx, Rx, Tx, Bx]
      v_y = [Ly, Ry, Ty, By]
      chuck1_x2 = fitCircle(v_x, v_y)
      readings = readings + 1
    if fiducial == "chuck1_x3_L, chuck1_x3_R, chuck1_x3_T, chuck1_x3_B":
      v_x = [Lx, Rx, Tx, Bx]
      v_y = [Ly, Ry, Ty, By]
      chuck1_x3 = fitCircle(v_x, v_y)
      readings = readings + 1

    if readings == 6:
      chuck2_x1x2 = ((chuck2_x1[0]+chuck2_x2[0])/2., (chuck2_x1[1]+chuck2_x2[1])/2.)
      chuck1_x1x2 = ((chuck1_x1[0]+chuck1_x2[0])/2., (chuck1_x1[1]+chuck1_x2[1])/2.)
      chuck2_dir = ((chuck2_x3[0]-chuck2_x1x2[0]), (chuck2_x3[1]-chuck2_x1x2[1]))
      chuck1_dir = ((chuck1_x3[0]-chuck1_x1x2[0]), (chuck1_x3[1]-chuck1_x1x2[1]))

      translation = (chuck1_x1x2[0]-chuck2_x1x2[0], chuck1_x1x2[1]-chuck2_x1x2[1])
      theta = angleBetweenVectors(chuck2_dir, chuck1_dir)
      diff = diffVectors(chuck1_dir, chuck2_dir)

      print ("translation, rotation = ", translation, theta)
      v_translationX.append(translation[0])
      v_translationY.append(translation[1])
      v_theta.append(theta)
      readings = 0

  line = file.readline()

print("Standard deviation of translation (x, y) is ", statistics.stdev(v_translationX), statistics.stdev(v_translationY), statistics.stdev(v_theta))
print("Mean of translation (x, y) is ", statistics.mean(v_translationX), statistics.mean(v_translationY), statistics.mean(v_theta))
