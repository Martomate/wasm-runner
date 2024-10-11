(module $floats-3aaf96b80dc7af10.wasm
  (table $table0 1 1 funcref)
  (memory $memory (;0;) (export "memory") 17)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1048592))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1048592))
  (func $add_f32 (;0;) (export "add_f32") (param $var0 f32) (param $var1 f32) (result f32)
    local.get $var0
    local.get $var1
    f32.add
  )
  (func $add_f64 (;1;) (export "add_f64") (param $var0 f64) (param $var1 f64) (result f64)
    local.get $var0
    local.get $var1
    f64.add
  )
  (func $sinh (;2;) (export "sinh") (param $var0 f64) (result f64)
    local.get $var0
    call $exp
    local.get $var0
    f64.neg
    call $exp
    f64.sub
    f64.const 0.5
    f64.mul
  )
  (func $_ZN17compiler_builtins4math4libm3exp3exp17h8fb65da6e651c2d1E (;3;) (param $var0 f64) (result f64)
    (local $var1 i32)
    (local $var2 i64)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 f64)
    (local $var6 f64)
    (local $var7 f64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set $var1
    local.get $var0
    i64.reinterpret_f64
    local.tee $var2
    i64.const 63
    i64.shr_u
    i32.wrap_i64
    local.set $var3
    block $label4
      block $label7
        block $label11
          block $label8
            block $label6
              block $label2
                block $label3
                  block $label0
                    local.get $var2
                    i64.const 32
                    i64.shr_u
                    i32.wrap_i64
                    i32.const 2147483647
                    i32.and
                    local.tee $var4
                    i32.const 1082532651
                    i32.lt_u
                    br_if $label0
                    block $label1
                      local.get $var0
                      local.get $var0
                      f64.eq
                      br_if $label1
                      local.get $var0
                      return
                    end $label1
                    local.get $var0
                    f64.const 709.782712893384
                    f64.gt
                    br_if $label2
                    local.get $var0
                    f64.const -708.3964185322641
                    f64.lt
                    i32.eqz
                    br_if $label3
                    local.get $var1
                    f64.const -1.401298464324817e-45
                    local.get $var0
                    f64.div
                    f32.demote_f64
                    f32.store offset=4
                    local.get $var1
                    f32.load offset=4
                    drop
                    f64.const 0.0
                    local.set $var5
                    local.get $var0
                    f64.const -745.1332191019411
                    f64.lt
                    i32.eqz
                    br_if $label3
                    br $label4
                  end $label0
                  block $label5
                    local.get $var4
                    i32.const 1071001154
                    i32.gt_u
                    br_if $label5
                    local.get $var4
                    i32.const 1043333120
                    i32.le_u
                    br_if $label6
                    f64.const 0.0
                    local.set $var6
                    i32.const 0
                    local.set $var4
                    local.get $var0
                    local.set $var5
                    br $label7
                  end $label5
                  local.get $var4
                  i32.const 1072734897
                  i32.le_u
                  br_if $label8
                end $label3
                local.get $var0
                f64.const 1.4426950408889634
                f64.mul
                local.get $var3
                i32.const 3
                i32.shl
                i32.const 1048576
                i32.add
                f64.load
                f64.add
                local.tee $var5
                f64.const -2147483648
                f64.ge
                local.set $var4
                block $label10
                  block $label9
                    local.get $var5
                    f64.abs
                    f64.const 2147483648
                    f64.lt
                    i32.eqz
                    br_if $label9
                    local.get $var5
                    i32.trunc_f64_s
                    local.set $var3
                    br $label10
                  end $label9
                  i32.const -2147483648
                  local.set $var3
                end $label10
                i32.const 0
                i32.const 2147483647
                local.get $var3
                i32.const -2147483648
                local.get $var4
                select
                local.get $var5
                f64.const 2147483647
                f64.gt
                select
                local.get $var5
                local.get $var5
                f64.ne
                select
                local.set $var4
                br $label11
              end $label2
              local.get $var0
              f64.const 8.98846567431158e+307
              f64.mul
              return
            end $label6
            local.get $var1
            local.get $var0
            f64.const 8.98846567431158e+307
            f64.add
            f64.store offset=8
            local.get $var1
            f64.load offset=8
            drop
            local.get $var0
            f64.const 1
            f64.add
            return
          end $label8
          local.get $var3
          i32.const 1
          i32.xor
          local.get $var3
          i32.sub
          local.set $var4
        end $label11
        local.get $var0
        local.get $var4
        f64.convert_i32_s
        local.tee $var5
        f64.const -0.6931471803691238
        f64.mul
        f64.add
        local.tee $var0
        local.get $var5
        f64.const 1.9082149292705877e-10
        f64.mul
        local.tee $var6
        f64.sub
        local.set $var5
      end $label7
      local.get $var0
      local.get $var5
      local.get $var5
      local.get $var5
      local.get $var5
      f64.mul
      local.tee $var7
      local.get $var7
      local.get $var7
      local.get $var7
      local.get $var7
      f64.const 4.1381367970572385e-8
      f64.mul
      f64.const -0.0000016533902205465252
      f64.add
      f64.mul
      f64.const 0.00006613756321437934
      f64.add
      f64.mul
      f64.const -0.0027777777777015593
      f64.add
      f64.mul
      f64.const 0.16666666666666602
      f64.add
      f64.mul
      f64.sub
      local.tee $var7
      f64.mul
      f64.const 2
      local.get $var7
      f64.sub
      f64.div
      local.get $var6
      f64.sub
      f64.add
      f64.const 1
      f64.add
      local.set $var5
      local.get $var4
      i32.eqz
      br_if $label4
      block $label13
        block $label15
          block $label14
            block $label12
              local.get $var4
              i32.const 1023
              i32.gt_s
              br_if $label12
              local.get $var4
              i32.const -1022
              i32.ge_s
              br_if $label13
              local.get $var5
              f64.const 2.004168360008973e-292
              f64.mul
              local.set $var5
              local.get $var4
              i32.const -1992
              i32.le_u
              br_if $label14
              local.get $var4
              i32.const 969
              i32.add
              local.set $var4
              br $label13
            end $label12
            local.get $var5
            f64.const 8.98846567431158e+307
            f64.mul
            local.set $var5
            local.get $var4
            i32.const 2046
            i32.gt_u
            br_if $label15
            local.get $var4
            i32.const -1023
            i32.add
            local.set $var4
            br $label13
          end $label14
          local.get $var5
          f64.const 2.004168360008973e-292
          f64.mul
          local.set $var5
          local.get $var4
          i32.const -2960
          local.get $var4
          i32.const -2960
          i32.gt_s
          select
          i32.const 1938
          i32.add
          local.set $var4
          br $label13
        end $label15
        local.get $var5
        f64.const 8.98846567431158e+307
        f64.mul
        local.set $var5
        local.get $var4
        i32.const 3069
        local.get $var4
        i32.const 3069
        i32.lt_s
        select
        i32.const -2046
        i32.add
        local.set $var4
      end $label13
      local.get $var5
      local.get $var4
      i32.const 1023
      i32.add
      i64.extend_i32_u
      i64.const 52
      i64.shl
      f64.reinterpret_i64
      f64.mul
      local.set $var5
    end $label4
    local.get $var5
  )
  (func $_ZN17compiler_builtins4math3exp17h795d08a6d3d16c1fE (;4;) (param $var0 f64) (result f64)
    local.get $var0
    call $_ZN17compiler_builtins4math4libm3exp3exp17h8fb65da6e651c2d1E
  )
  (func $exp (;5;) (param $var0 f64) (result f64)
    local.get $var0
    call $_ZN17compiler_builtins4math3exp17h795d08a6d3d16c1fE
  )
  (data (i32.const 1048576) "\00\00\00\00\00\00\e0?\00\00\00\00\00\00\e0\bf")
)