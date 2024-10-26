(module $simd-da0150a226b37fa7.wasm
  (table $table0 1 1 funcref)
  (memory $memory (;0;) (export "memory") 16)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1048576))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1048576))
  (func $calc_using_simd (;0;) (export "calc_using_simd") (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    (local $var3 v128)
    (local $var4 v128)
    (local $var5 v128)
    (local $var6 v128)
    v128.const i32x4 0x00000000 0x00000003 0x00000000 0x00000001
    local.get $var0
    i32x4.replace_lane 0
    local.get $var1
    i32x4.replace_lane 2
    local.set $var3
    block $label0
      local.get $var2
      i32.eqz
      br_if $label0
      v128.const i32x4 0x00000007 0x00000000 0x00000005 0x00000000
      local.get $var1
      local.get $var0
      i32.add
      i32x4.replace_lane 1
      local.get $var1
      local.get $var0
      i32.mul
      i32x4.replace_lane 3
      local.tee $var4
      local.get $var3
      i8x16.shuffle 8 9 10 11 4 5 6 7 0 1 2 3 12 13 14 15
      local.set $var5
      local.get $var4
      local.get $var3
      i8x16.shuffle 4 5 6 7 8 9 10 11 12 13 14 15 0 1 2 3
      local.set $var6
      loop $label1
        local.get $var3
        local.get $var4
        v128.not
        i32x4.min_u
        local.get $var4
        i32x4.add
        local.get $var3
        i8x16.shuffle 0 1 2 3 12 13 14 15 8 9 10 11 4 5 6 7
        local.get $var5
        i32x4.mul
        local.get $var6
        i32x4.sub
        local.set $var3
        local.get $var2
        i32.const -1
        i32.add
        local.tee $var2
        br_if $label1
      end $label1
    end $label0
    local.get $var3
    local.get $var3
    local.get $var3
    i8x16.shuffle 8 9 10 11 12 13 14 15 0 1 2 3 0 1 2 3
    i32x4.add
    local.tee $var3
    local.get $var3
    local.get $var3
    i8x16.shuffle 4 5 6 7 0 1 2 3 0 1 2 3 0 1 2 3
    i32x4.add
    i32x4.extract_lane 0
  )
)