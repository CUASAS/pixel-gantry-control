# The Kasa method to fit a circle to a set of data points
# Souvik, 2022

def fitCircle(x):
    sum_x = 0
    sum_xx = 0
    sum_xxx = 0
    sum_y = 0
    sum_yy = 0
    sum_yyy = 0
    sum_xy = 0
    sum_xxy = 0
    sum_xyy = 0
    N = len(x)
    for i in range(0, N):
        sum_x += x[i][0]
        sum_xx += x[i][0]*x[i][0]
        sum_xxx += x[i][0]*x[i][0]*x[i][0]
        sum_y += x[i][1]
        sum_yy += x[i][1]*x[i][1]
        sum_yyy += x[i][1]*x[i][1]*x[i][1]
        sum_xy += x[i][0]*x[i][1]
        sum_xxy += x[i][0]*x[i][0]*x[i][1]
        sum_xyy += x[i][0]*x[i][1]*x[i][1]
    alpha = 2.*(sum_x**2 - N*sum_xx)
    beta = 2.*(sum_x*sum_y - N*sum_xy)
    gamma = 2.*(sum_y**2 - N*sum_yy)
    delta = sum_xx*sum_x - N*sum_xxx + sum_x*sum_yy - N*sum_xyy
    epsilon = sum_xx*sum_y - N*sum_yyy + sum_y*sum_yy - N*sum_xxy

    A = (delta*gamma - epsilon*beta)/(alpha*gamma - beta**2)
    B = (alpha*epsilon - beta*delta)/(alpha*gamma - beta**2)

    return (A, B)

### Main program
x = [
(571.658747,215.415003),
(571.659669,215.415565),
(571.653143,215.410154),
(571.648929,215.414674),
(571.656254,215.420062),
(571.647115,215.412940),
(571.648526,215.415716),
(571.645565,215.415820),
(571.644551,215.407116),
(571.645583,215.411839)

# Purdue's
# (571.656877,215.406269),
# (571.851583,215.607450),
# (572.003114,215.847345),
# (572.115343,216.106813),
# (572.173414,216.392337),
# (572.188375,216.671539),
# (572.149451,216.953617),
# (572.061304,217.227720),
# (571.930341,217.475137),
# (571.758121,217.703957)

]
print(fitCircle(x))
