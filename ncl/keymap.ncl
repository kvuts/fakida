let { tap, hold, td, combo, .. } = import "./fak/keycode.ncl" in
let util = import "./fak/util_functions.ncl" in

let virtual_keys' = [
] in

let key_count = 32 + std.array.length virtual_keys' in

let kc = tap.reg.kc in
let ks = tap.reg.ks in
let md = hold.reg.mod in
let tm = tap.reg.mod in
let me = tap.custom.media in
let MO = hold.reg.layer in

let ki = {
  hp = { decision = 'hold, trigger_on = 'press },
  tp = { decision = 'tap, trigger_on = 'press },
  hr = { decision = 'hold, trigger_on = 'release },
  tr = { decision = 'tap, trigger_on = 'release },
  xx = { decision = 'none },
} in

let layouts = {
  QWERTY = "QWERTYUIOPASDFGHJKLMZXCVBN",
  DVORAK = "PYFGCRLAOEUIDHTNSQJKXBMWVZ",
  COLEMAK = "QWFPGJLUYARSTDHNEIOZXCVBKM",
} in

let XXXX = tap.none & hold.none in

let L' = fun layer => 
  let filler = std.array.replicate (key_count - std.array.length layer) XXXX in
  layer @ filler
in


let alphas = fun layout => layout
  |> std.string.characters
  |> util.array.enumerate
  |> std.array.map (fun { index, value } => kc."%{value}")
in

let cu = {
  SCSH = tm.lgui & tm.lsft & kc.S,
  PWSP = tm.lgui & kc.PGDN,
  NWSP = tm.lgui & kc.PGUP,
  CT =   tm.lctl & kc.TAB,
  CST =  tm.lctl & tm.lsft & kc.TAB,
  BOOT = tap.custom.fak.BOOT,
} in

let thumb = fun i =>
  let htb_generic = {
    timeout_ms = 200,
    quick_tap_ms = 150,
    key_interrupts = std.array.replicate key_count ki.hr,
  } in
  [
    kc.ESC & md.lgui & hold.reg.behavior htb_generic,
    kc.TAB & md.lctl & hold.reg.behavior htb_generic,
    kc.SPC & MO 1 & hold.reg.behavior htb_generic,
    XXXX & MO 2 & hold.reg.behavior htb_generic, # Not used
    kc.BSPC & md.lsft & hold.reg.behavior htb_generic,
    kc.ENT & md.lalt & hold.reg.behavior htb_generic,
  ]
  |> std.array.at i
in

let keymap = {
  virtual_keys = virtual_keys',
   layers = [
    [
      kc.a, kc.b, kc.c,        kc.d,    kc.e,      kc.f,   kc.g,      kc.h,   kc.i, kc.j,
      kc.k, kc.l, kc.m,        kc.n,    kc.o,      kc.p,   kc.q,      kc.r,   kc.s, kc.t,
                  kc.u,        kc.v,    kc.w,      kc.x,   kc.y,      kc.z,
                  kc.E_ACUTE,  kc.ENT,  kc.SPC     kc.DEL, kc.APOST,  kc.TAB, 
                 
      
    ],
  ]
} in

keymap
