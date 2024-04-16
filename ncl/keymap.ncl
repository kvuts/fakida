let { tap, .. } = import "./fak/keycode.ncl" in

let kc = tap.reg.kc in

let keymap = [
  kc.a, kc.b, kc.c,       kc.d,   kc.e,      kc.f,   kc.g,     kc.h,   kc.i, kc.j,
  kc.k, kc.l, kc.m,       kc.n,   kc.o,      kc.p,   kc.q,     kc.r,   kc.s, kc.t,
              kc.u,       kc.v,   kc.w,      kc.x,   kc.y,     kc.z,
              kc.E_ACUTE, kc.ENT, kc.SPC,    kc.DEL, kc.APOST, kc.TAB,
] in

keymap
