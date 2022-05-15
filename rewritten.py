import numpy as np


bc = np.zeros(16)
x1 = np.zeros(100)
x0 = np.zeros(100)
in_ = np.zeros(10)
is_ = np.zeros(10)
eo = np.zeros(10)
og = np.zeros(20)


def aminpl(it, nv, x2):
    global bc, x1, x0, in_, is_, eo, og
    # ta = np.zeros(10)
    # e = np.zeros(10)
    # y = np.zeros(10)
    # y0 = np.zeros(10)
    # d = np.zeros(10)
    # b = np.zeros((10, 10))
    # u = np.zeros((10, 10))
    # x2 = np.zeros(30)

    nd = 0
    for i in range(1, 31): # Label 51
        x2[i] = 0
    ek = ...
    n = nv
    print('...')
    # TODO: consider starting from 0
    for j in range(1, n + 1): # Label 1
        for i in range(1, n + 1):
            u[j, i] = i == j
    m = 0
    for i in range(1, it + 1): # Label 4
        x1[i] = x0[i]
    ip = 1
    pil(ip,fs2,idd)
    nd += 1
    x2[nd] = fs2
    # TODO: figure out what happens here
    if fs2 <= bc[14]:
        ...
        # GOTO 130
    for i in range(1, n + 1): # Label 5
        np_ = in_[i]
        y0[i] = x0[np_]
    for i in range(1, n + 1): # Label 7
        ia[i] = 2
        e[i] = eo[i]
        d[i] = 0
    k = 0
    if n == k:
        k = 1
    else:
        k += 1
    for i in range(1, n + 1): # Label 12
        y[i] = y0[i] + e[k] * u[1, k]
    for i in range(1, n + 1): # Label 13
        xm = og[2 * i - 1]
        if y[i] < xm:
            y[i] = xm
        xm = og[2 * i]
        if y[i] > xm:
            y[i] = xm
    for i in range(1, n + 1): # Label 45
        np_ = in_[i]
        x1[np_] = y[i]
        j = is_[i]
        x1[j] = x1[np_]
    ip = 2
    pil(ip, f1, idd)
    if f1 < fs2: # Not arrays?
        fs2 = f1
        if f1 <= bc[14]:
            ...
            # GOTO 100
            # TODO firgure out what label 100 is
    for i in range(1, n + 1): # Label 22
        np_ = in_[i]
        x0[np_] = x1[np_]
        y0[i] = y[i]
    d[k] += e[k]
    e[k] *= 3.0
    if ia[k] == 2:
        ia[k] = 1
        e[k] = -e[k] / 2.0
        if ia[k] == 1 or abs(e[k]) < ek:
            ia[k] = 0
    for i in range(1, n + 1):
        if ia[i]: # Where is the label 8?
            pass
    for jj in range(1, n + 1):
        j = n + 1 - jj
        for i in range(1, n + 1):
            if j == n:
                bb = 0
                break # Or not? And which loop?
            else:
                bb = b[i, j + 1]
                r[i,j] = d[j] * u[i, j] + bb
    for j in range(1, n + 1):
        e[j] = 0
        for i in range(1, n + 1):
            f[j] = e[j] + b[i, j] ** 2
            e[j] = e[j] ** .5
    if m > 0:
        if abs((fs2 - FVOR) / (1. + abs(fs2))) - ek <= 0:
            pass # GOTO 100
    # else:
    fvor = fs2
    for j1 in range(2, n + 1):
        j = n + 2 - j1
        z2 = e[j - 1] * e[j]
        for i in range(1, n + 1):
            if z2:
                u[i, j] = d[j - 1] * b[i, j] - u[i, j - 1] * e[j] ** 2 / z2
    if e[1] <= 1e-7:
        pass # GOTO 100
    for i in range(1, n + 1):
        u[i, 1] = b[i, 1] / e[1]
    m += 1
    nd += 1
    x2[nd] = fs2
    for i in range(i, nv): # TODO: reconsider
        x2[nd + i] = y[i]
    print(f'Целевая функция: {fs2:13.3}')
    # TYPE 101
    # TYPE 19,(Y(I),I=1,NV)
    # GOTO 6
    nd += 1
    x2[nd] = fs2
    for i in range(1, nv + 1):
        x2[nd + i] = y[1]
    print(f'Целевая функция: {fs2:13.3}')
    # TYPE 101
    # TYPE 19,(Y(I),I=1,NV)
    for i in range(1, it + 1):
        x1[i] = x0[i]
    x2[30] = float(nd)
