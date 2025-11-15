(module $aes-3168faaef20b4ba8.wasm
  (table $table0 9 9 funcref)
  (memory $memory (;0;) (export "memory") 17)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 1048576))
  (global $__data_end (;1;) (export "__data_end") i32 (i32.const 1051380))
  (global $__heap_base (;2;) (export "__heap_base") i32 (i32.const 1051392))
  (elem $elem0 (i32.const 1) (ref func) (ref.func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hc1cb133d2bb82eb9E) (ref.func $_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17hd76bafbaa8ace0a4E) (ref.func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he295cab176c7f3cbE) (ref.func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17haa6b1d473c056d34E) (ref.func $_ZN4core5panic12PanicPayload6as_str17h2a2bcef846efba67E) (ref.func $_ZN93_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17hcd7d04be367d30afE) (ref.func $_ZN4core3ops8function6FnOnce9call_once17h08e67cef8bea33a6E) (ref.func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1c2574fa86a3f5d7E))
  (func $decrypt_128 (;0;) (export "decrypt_128") (param $var0 i32) (param $var1 i32) (result i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    (local $var14 i32)
    (local $var15 i32)
    (local $var16 i32)
    (local $var17 i32)
    (local $var18 i32)
    (local $var19 i32)
    (local $var20 i32)
    (local $var21 i32)
    (local $var22 i32)
    (local $var23 i32)
    (local $var24 i32)
    (local $var25 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    block $label0
      i32.const 0
      i32.load8_u offset=1050908
      i32.const 3
      i32.eq
      br_if $label0
      local.get $var2
      i32.const 1050892
      i32.store offset=80
      local.get $var2
      i32.const 80
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17heca02e7eea73bc5eE
    end $label0
    call $_ZN3std4sync6poison5mutex14Mutex$LT$T$GT$4lock17h532ecc6dcefb18a0E
    block $label2
      block $label1
        i32.const 0
        i32.load offset=1050904
        local.tee $var3
        i32.eqz
        br_if $label1
        i32.const 0
        local.set $var4
        local.get $var3
        i32.const 3
        i32.shl
        local.tee $var5
        local.set $var6
        i32.const 0
        i32.load offset=1050900
        local.tee $var7
        local.set $var3
        loop $label3
          local.get $var3
          i32.load
          local.get $var0
          i32.eq
          br_if $label2
          local.get $var4
          i32.const 1
          i32.add
          local.set $var4
          local.get $var3
          i32.const 8
          i32.add
          local.set $var3
          local.get $var6
          i32.const -8
          i32.add
          local.tee $var6
          br_if $label3
        end $label3
      end $label1
      i32.const 1050288
      i32.const 32
      i32.const 1050320
      call $_ZN4core6option13expect_failed17h146124de70c3b2b3E
      unreachable
    end $label2
    block $label4
      local.get $var7
      local.get $var4
      i32.const 3
      i32.shl
      i32.add
      local.tee $var3
      i32.load offset=4
      local.tee $var4
      i32.const 16
      i32.ne
      br_if $label4
      local.get $var2
      i32.const 8
      i32.add
      local.get $var3
      i32.load
      local.tee $var3
      i32.const 8
      i32.add
      i64.load align=1
      i64.store
      local.get $var2
      local.get $var3
      i64.load align=1
      i64.store
      i32.const 0
      local.set $var4
      local.get $var7
      local.set $var3
      block $label5
        loop $label6
          local.get $var3
          i32.load
          local.get $var1
          i32.eq
          br_if $label5
          local.get $var4
          i32.const 1
          i32.add
          local.set $var4
          local.get $var3
          i32.const 8
          i32.add
          local.set $var3
          local.get $var5
          i32.const -8
          i32.add
          local.tee $var5
          br_if $label6
        end $label6
        i32.const 1050288
        i32.const 32
        i32.const 1050320
        call $_ZN4core6option13expect_failed17h146124de70c3b2b3E
        unreachable
      end $label5
      block $label7
        local.get $var7
        local.get $var4
        i32.const 3
        i32.shl
        i32.add
        local.tee $var3
        i32.load offset=4
        local.tee $var4
        i32.const 16
        i32.ne
        br_if $label7
        local.get $var2
        i32.const 16
        i32.add
        i32.const 8
        i32.add
        local.get $var3
        i32.load
        local.tee $var3
        i32.const 8
        i32.add
        i64.load align=1
        i64.store
        local.get $var2
        local.get $var3
        i64.load align=1
        i64.store offset=16
        local.get $var2
        i32.const 32
        i32.add
        local.get $var2
        i32.const 16
        i32.add
        call $_ZN8programs3aes6cipher3Aes16with_128_bit_key17h05d5d4ed816b09b9E
        local.get $var2
        i32.const 64
        i32.add
        i32.const 8
        i32.add
        local.get $var2
        i32.const 8
        i32.add
        i64.load
        i64.store
        local.get $var2
        local.get $var2
        i64.load
        i64.store offset=64
        block $label8
          local.get $var2
          i32.load offset=44
          local.tee $var8
          local.get $var2
          i32.load offset=40
          local.tee $var9
          i32.ge_u
          br_if $label8
          local.get $var2
          i32.const 80
          i32.add
          i32.const 8
          i32.add
          local.get $var2
          i32.load offset=36
          local.tee $var10
          local.get $var8
          i32.const 4
          i32.shl
          i32.add
          local.tee $var3
          i32.const 8
          i32.add
          i64.load align=1
          i64.store
          local.get $var2
          local.get $var3
          i64.load align=1
          i64.store offset=80
          i32.const 0
          local.set $var3
          loop $label9
            local.get $var2
            i32.const 64
            i32.add
            local.get $var3
            i32.add
            local.tee $var4
            local.get $var4
            i32.load8_u
            local.get $var2
            i32.const 80
            i32.add
            local.get $var3
            i32.add
            i32.load8_u
            i32.xor
            i32.store8
            local.get $var3
            i32.const 1
            i32.add
            local.tee $var3
            i32.const 16
            i32.ne
            br_if $label9
          end $label9
          local.get $var2
          i32.const 64
          i32.add
          call $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$8backward17h9ff497399b6f7039E
          i32.const 0
          local.set $var3
          loop $label10
            local.get $var2
            i32.const 64
            i32.add
            local.get $var3
            i32.add
            local.tee $var4
            local.get $var4
            i32.load8_u
            i32.load8_u offset=1049952
            i32.store8
            local.get $var3
            i32.const 1
            i32.add
            local.tee $var3
            i32.const 16
            i32.ne
            br_if $label10
          end $label10
          block $label11
            local.get $var8
            i32.const 2
            i32.lt_u
            br_if $label11
            loop $label33
              block $label32
                block $label12
                  local.get $var8
                  i32.const -1
                  i32.add
                  local.tee $var8
                  local.get $var9
                  i32.ge_u
                  br_if $label12
                  local.get $var2
                  i32.const 80
                  i32.add
                  i32.const 8
                  i32.add
                  local.get $var10
                  local.get $var8
                  i32.const 4
                  i32.shl
                  i32.add
                  local.tee $var3
                  i32.const 8
                  i32.add
                  i64.load align=1
                  i64.store
                  local.get $var2
                  local.get $var3
                  i64.load align=1
                  i64.store offset=80
                  i32.const 0
                  local.set $var3
                  loop $label13
                    local.get $var2
                    i32.const 64
                    i32.add
                    local.get $var3
                    i32.add
                    local.tee $var4
                    local.get $var4
                    i32.load8_u
                    local.get $var2
                    i32.const 80
                    i32.add
                    local.get $var3
                    i32.add
                    i32.load8_u
                    i32.xor
                    i32.store8
                    local.get $var3
                    i32.const 1
                    i32.add
                    local.tee $var3
                    i32.const 16
                    i32.ne
                    br_if $label13
                  end $label13
                  i32.const 0
                  local.set $var11
                  loop $label30
                    i32.const 14
                    local.set $var6
                    i32.const 8
                    local.set $var5
                    local.get $var2
                    i32.const 64
                    i32.add
                    local.get $var11
                    i32.const 2
                    i32.shl
                    i32.add
                    local.tee $var12
                    i32.load8_u
                    local.tee $var3
                    local.set $var4
                    i32.const 0
                    local.set $var7
                    loop $label14
                      i32.const 0
                      local.get $var6
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var4
                      i32.and
                      local.get $var7
                      i32.xor
                      local.set $var7
                      local.get $var4
                      i32.const 1
                      i32.shl
                      local.tee $var0
                      i32.const 27
                      i32.xor
                      local.get $var0
                      local.get $var4
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var4
                      local.get $var6
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var6
                      local.get $var5
                      i32.const -1
                      i32.add
                      local.tee $var5
                      br_if $label14
                    end $label14
                    i32.const 0
                    local.set $var13
                    i32.const 11
                    local.set $var5
                    i32.const 8
                    local.set $var0
                    local.get $var12
                    i32.load8_u offset=1
                    local.tee $var4
                    local.set $var6
                    loop $label15
                      i32.const 0
                      local.get $var5
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var6
                      i32.and
                      local.get $var13
                      i32.xor
                      local.set $var13
                      local.get $var6
                      i32.const 1
                      i32.shl
                      local.tee $var1
                      i32.const 27
                      i32.xor
                      local.get $var1
                      local.get $var6
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var6
                      local.get $var5
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var5
                      local.get $var0
                      i32.const -1
                      i32.add
                      local.tee $var0
                      br_if $label15
                    end $label15
                    i32.const 0
                    local.set $var14
                    i32.const 13
                    local.set $var0
                    i32.const 8
                    local.set $var1
                    local.get $var12
                    i32.load8_u offset=2
                    local.tee $var6
                    local.set $var5
                    loop $label16
                      i32.const 0
                      local.get $var0
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var5
                      i32.and
                      local.get $var14
                      i32.xor
                      local.set $var14
                      local.get $var5
                      i32.const 1
                      i32.shl
                      local.tee $var15
                      i32.const 27
                      i32.xor
                      local.get $var15
                      local.get $var5
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var5
                      local.get $var0
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var0
                      local.get $var1
                      i32.const -1
                      i32.add
                      local.tee $var1
                      br_if $label16
                    end $label16
                    i32.const 0
                    local.set $var15
                    i32.const 9
                    local.set $var1
                    i32.const 8
                    local.set $var16
                    local.get $var12
                    i32.load8_u offset=3
                    local.tee $var5
                    local.set $var0
                    loop $label17
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var15
                      i32.xor
                      local.set $var15
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var17
                      i32.const 27
                      i32.xor
                      local.get $var17
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var16
                      i32.const -1
                      i32.add
                      local.tee $var16
                      br_if $label17
                    end $label17
                    i32.const 0
                    local.set $var16
                    i32.const 14
                    local.set $var1
                    i32.const 8
                    local.set $var17
                    local.get $var4
                    local.set $var0
                    loop $label18
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var16
                      i32.xor
                      local.set $var16
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var18
                      i32.const 27
                      i32.xor
                      local.get $var18
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var17
                      i32.const -1
                      i32.add
                      local.tee $var17
                      br_if $label18
                    end $label18
                    i32.const 0
                    local.set $var17
                    i32.const 11
                    local.set $var1
                    i32.const 8
                    local.set $var18
                    local.get $var6
                    local.set $var0
                    loop $label19
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var17
                      i32.xor
                      local.set $var17
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var19
                      i32.const 27
                      i32.xor
                      local.get $var19
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var18
                      i32.const -1
                      i32.add
                      local.tee $var18
                      br_if $label19
                    end $label19
                    i32.const 0
                    local.set $var18
                    i32.const 13
                    local.set $var1
                    i32.const 8
                    local.set $var19
                    local.get $var5
                    local.set $var0
                    loop $label20
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var18
                      i32.xor
                      local.set $var18
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var20
                      i32.const 27
                      i32.xor
                      local.get $var20
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var19
                      i32.const -1
                      i32.add
                      local.tee $var19
                      br_if $label20
                    end $label20
                    i32.const 0
                    local.set $var19
                    i32.const 9
                    local.set $var1
                    i32.const 8
                    local.set $var20
                    local.get $var3
                    local.set $var0
                    loop $label21
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var19
                      i32.xor
                      local.set $var19
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var21
                      i32.const 27
                      i32.xor
                      local.get $var21
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var20
                      i32.const -1
                      i32.add
                      local.tee $var20
                      br_if $label21
                    end $label21
                    i32.const 0
                    local.set $var20
                    i32.const 14
                    local.set $var1
                    i32.const 8
                    local.set $var21
                    local.get $var6
                    local.set $var0
                    loop $label22
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var20
                      i32.xor
                      local.set $var20
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var22
                      i32.const 27
                      i32.xor
                      local.get $var22
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var21
                      i32.const -1
                      i32.add
                      local.tee $var21
                      br_if $label22
                    end $label22
                    i32.const 0
                    local.set $var21
                    i32.const 11
                    local.set $var1
                    i32.const 8
                    local.set $var22
                    local.get $var5
                    local.set $var0
                    loop $label23
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var21
                      i32.xor
                      local.set $var21
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var23
                      i32.const 27
                      i32.xor
                      local.get $var23
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var22
                      i32.const -1
                      i32.add
                      local.tee $var22
                      br_if $label23
                    end $label23
                    i32.const 0
                    local.set $var22
                    i32.const 13
                    local.set $var1
                    i32.const 8
                    local.set $var23
                    local.get $var3
                    local.set $var0
                    loop $label24
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var22
                      i32.xor
                      local.set $var22
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var24
                      i32.const 27
                      i32.xor
                      local.get $var24
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var23
                      i32.const -1
                      i32.add
                      local.tee $var23
                      br_if $label24
                    end $label24
                    i32.const 0
                    local.set $var23
                    i32.const 9
                    local.set $var1
                    i32.const 8
                    local.set $var24
                    local.get $var4
                    local.set $var0
                    loop $label25
                      i32.const 0
                      local.get $var1
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var0
                      i32.and
                      local.get $var23
                      i32.xor
                      local.set $var23
                      local.get $var0
                      i32.const 1
                      i32.shl
                      local.tee $var25
                      i32.const 27
                      i32.xor
                      local.get $var25
                      local.get $var0
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var0
                      local.get $var1
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var1
                      local.get $var24
                      i32.const -1
                      i32.add
                      local.tee $var24
                      br_if $label25
                    end $label25
                    i32.const 0
                    local.set $var1
                    i32.const 14
                    local.set $var0
                    i32.const 8
                    local.set $var24
                    loop $label26
                      i32.const 0
                      local.get $var0
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var5
                      i32.and
                      local.get $var1
                      i32.xor
                      local.set $var1
                      local.get $var5
                      i32.const 1
                      i32.shl
                      local.tee $var25
                      i32.const 27
                      i32.xor
                      local.get $var25
                      local.get $var5
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var5
                      local.get $var0
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var0
                      local.get $var24
                      i32.const -1
                      i32.add
                      local.tee $var24
                      br_if $label26
                    end $label26
                    i32.const 0
                    local.set $var0
                    i32.const 11
                    local.set $var5
                    i32.const 8
                    local.set $var24
                    loop $label27
                      i32.const 0
                      local.get $var5
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var3
                      i32.and
                      local.get $var0
                      i32.xor
                      local.set $var0
                      local.get $var3
                      i32.const 1
                      i32.shl
                      local.tee $var25
                      i32.const 27
                      i32.xor
                      local.get $var25
                      local.get $var3
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var3
                      local.get $var5
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var5
                      local.get $var24
                      i32.const -1
                      i32.add
                      local.tee $var24
                      br_if $label27
                    end $label27
                    i32.const 0
                    local.set $var5
                    i32.const 13
                    local.set $var3
                    i32.const 8
                    local.set $var24
                    loop $label28
                      i32.const 0
                      local.get $var3
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var4
                      i32.and
                      local.get $var5
                      i32.xor
                      local.set $var5
                      local.get $var4
                      i32.const 1
                      i32.shl
                      local.tee $var25
                      i32.const 27
                      i32.xor
                      local.get $var25
                      local.get $var4
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var4
                      local.get $var3
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var3
                      local.get $var24
                      i32.const -1
                      i32.add
                      local.tee $var24
                      br_if $label28
                    end $label28
                    i32.const 0
                    local.set $var4
                    i32.const 9
                    local.set $var3
                    i32.const 8
                    local.set $var24
                    loop $label29
                      i32.const 0
                      local.get $var3
                      i32.const 1
                      i32.and
                      i32.sub
                      local.get $var6
                      i32.and
                      local.get $var4
                      i32.xor
                      local.set $var4
                      local.get $var6
                      i32.const 1
                      i32.shl
                      local.tee $var25
                      i32.const 27
                      i32.xor
                      local.get $var25
                      local.get $var6
                      i32.extend8_s
                      i32.const 0
                      i32.lt_s
                      select
                      local.set $var6
                      local.get $var3
                      i32.const 254
                      i32.and
                      i32.const 1
                      i32.shr_u
                      local.set $var3
                      local.get $var24
                      i32.const -1
                      i32.add
                      local.tee $var24
                      br_if $label29
                    end $label29
                    local.get $var12
                    local.get $var0
                    local.get $var1
                    i32.xor
                    local.get $var5
                    i32.xor
                    local.get $var4
                    i32.xor
                    i32.store8 offset=3
                    local.get $var12
                    local.get $var21
                    local.get $var20
                    i32.xor
                    local.get $var22
                    i32.xor
                    local.get $var23
                    i32.xor
                    i32.store8 offset=2
                    local.get $var12
                    local.get $var17
                    local.get $var16
                    i32.xor
                    local.get $var18
                    i32.xor
                    local.get $var19
                    i32.xor
                    i32.store8 offset=1
                    local.get $var12
                    local.get $var13
                    local.get $var7
                    i32.xor
                    local.get $var14
                    i32.xor
                    local.get $var15
                    i32.xor
                    i32.store8
                    local.get $var11
                    i32.const 1
                    i32.add
                    local.tee $var11
                    i32.const 4
                    i32.ne
                    br_if $label30
                  end $label30
                  local.get $var2
                  i32.const 64
                  i32.add
                  call $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$8backward17h9ff497399b6f7039E
                  i32.const 0
                  local.set $var3
                  loop $label31
                    local.get $var2
                    i32.const 64
                    i32.add
                    local.get $var3
                    i32.add
                    local.tee $var4
                    local.get $var4
                    i32.load8_u
                    i32.load8_u offset=1049952
                    i32.store8
                    local.get $var3
                    i32.const 1
                    i32.add
                    local.tee $var3
                    i32.const 16
                    i32.ne
                    br_if $label31
                    br $label32
                  end $label31
                end $label12
                local.get $var8
                local.get $var9
                i32.const 1050460
                call $_ZN4core9panicking18panic_bounds_check17hce40a9a02592ee3cE
                unreachable
              end $label32
              local.get $var8
              i32.const 2
              i32.ge_u
              br_if $label33
            end $label33
          end $label11
          local.get $var2
          i32.const 80
          i32.add
          i32.const 8
          i32.add
          local.get $var10
          i32.const 8
          i32.add
          i64.load align=1
          i64.store
          local.get $var2
          local.get $var10
          i64.load align=1
          i64.store offset=80
          i32.const 0
          local.set $var3
          loop $label34
            local.get $var2
            i32.const 64
            i32.add
            local.get $var3
            i32.add
            local.tee $var4
            local.get $var4
            i32.load8_u
            local.get $var2
            i32.const 80
            i32.add
            local.get $var3
            i32.add
            i32.load8_u
            i32.xor
            i32.store8
            local.get $var3
            i32.const 1
            i32.add
            local.tee $var3
            i32.const 16
            i32.ne
            br_if $label34
          end $label34
          local.get $var2
          i32.const 48
          i32.add
          i32.const 8
          i32.add
          local.get $var2
          i32.const 64
          i32.add
          i32.const 8
          i32.add
          i64.load
          i64.store
          local.get $var2
          local.get $var2
          i64.load offset=64
          i64.store offset=48
          i32.const 0
          local.set $var4
          i32.const 1050896
          i32.const 16
          call $_ZN8programs3aes5Arena8allocate17hcd9b4e3abb22ef34E
          local.set $var5
          block $label36
            block $label35
              i32.const 0
              i32.load offset=1050904
              local.tee $var3
              i32.eqz
              br_if $label35
              local.get $var3
              i32.const 3
              i32.shl
              local.set $var6
              i32.const 0
              i32.load offset=1050900
              local.tee $var0
              local.set $var3
              loop $label37
                local.get $var3
                i32.load
                local.get $var5
                i32.eq
                br_if $label36
                local.get $var4
                i32.const 1
                i32.add
                local.set $var4
                local.get $var3
                i32.const 8
                i32.add
                local.set $var3
                local.get $var6
                i32.const -8
                i32.add
                local.tee $var6
                br_if $label37
              end $label37
            end $label35
            i32.const 1050288
            i32.const 32
            i32.const 1050320
            call $_ZN4core6option13expect_failed17h146124de70c3b2b3E
            unreachable
          end $label36
          block $label38
            local.get $var0
            local.get $var4
            i32.const 3
            i32.shl
            i32.add
            local.tee $var3
            i32.load offset=4
            local.tee $var4
            i32.const 16
            i32.ne
            br_if $label38
            local.get $var3
            i32.load
            local.tee $var3
            local.get $var2
            i64.load offset=48
            i64.store align=1
            local.get $var3
            i32.const 8
            i32.add
            local.get $var2
            i32.const 48
            i32.add
            i32.const 8
            i32.add
            i64.load
            i64.store align=1
            local.get $var2
            i32.load offset=32
            local.get $var10
            i32.const 16
            call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17h8d09733021fe6165E
            i32.const 0
            i32.const 0
            i32.store8 offset=1050892
            local.get $var2
            i32.const 96
            i32.add
            global.set $__stack_pointer
            local.get $var5
            return
          end $label38
          local.get $var4
          i32.const 16
          i32.const 1050208
          call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h155521667d43768eE
          unreachable
        end $label8
        local.get $var8
        local.get $var9
        i32.const 1050444
        call $_ZN4core9panicking18panic_bounds_check17hce40a9a02592ee3cE
        unreachable
      end $label7
      i32.const 16
      local.get $var4
      i32.const 1050524
      call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h155521667d43768eE
      unreachable
    end $label4
    i32.const 16
    local.get $var4
    i32.const 1050524
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h155521667d43768eE
    unreachable
  )
  (func $_ZN3std3sys4sync4once10no_threads4Once4call17heca02e7eea73bc5eE (;1;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    block $label4
      block $label5
        block $label2
          block $label3
            block $label0
              block $label1
                i32.const 0
                i32.load8_u offset=1050908
                br_table $label0 $label1 $label2 $label3 $label0
              end $label1
              i32.const 0
              i32.const 2
              i32.store8 offset=1050908
              local.get $var0
              i32.load
              local.set $var1
              local.get $var0
              i32.const 0
              i32.store
              local.get $var1
              br_if $label4
              br $label5
            end $label0
            i32.const 0
            i32.const 2
            i32.store8 offset=1050908
            local.get $var0
            i32.load
            local.set $var2
            local.get $var0
            i32.const 0
            i32.store
            local.get $var2
            i32.eqz
            br_if $label5
            local.get $var1
            i32.const 8
            i32.add
            local.get $var2
            i32.load
            call_indirect (param i32)
            local.get $var2
            i32.const 8
            i32.add
            local.get $var1
            i32.const 8
            i32.add
            i32.const 8
            i32.add
            i64.load align=4
            i64.store align=4
            local.get $var2
            local.get $var1
            i64.load offset=8 align=4
            i64.store align=4
            i32.const 0
            i32.const 3
            i32.store8 offset=1050908
          end $label3
          local.get $var1
          i32.const 32
          i32.add
          global.set $__stack_pointer
          return
        end $label2
        local.get $var1
        i32.const 0
        i32.store offset=24
        local.get $var1
        i32.const 1
        i32.store offset=12
        local.get $var1
        i32.const 1050596
        i32.store offset=8
        local.get $var1
        i64.const 4
        i64.store offset=16 align=4
        local.get $var1
        i32.const 8
        i32.add
        i32.const 1049180
        call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
        unreachable
      end $label5
      call $_ZN4core6option13unwrap_failed17hd4c633e91b0913d9E
      unreachable
    end $label4
    call $_ZN3std4sync9lazy_lock14panic_poisoned17h6cefe2c83d597906E
    unreachable
  )
  (func $_ZN3std4sync6poison5mutex14Mutex$LT$T$GT$4lock17h532ecc6dcefb18a0E (;2;)
    (local $var0 i32)
    (local $var1 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var0
    global.set $__stack_pointer
    i32.const 0
    i32.load8_u offset=1050892
    local.set $var1
    i32.const 0
    i32.const 1
    i32.store8 offset=1050892
    local.get $var0
    local.get $var1
    i32.store8 offset=7
    block $label0
      local.get $var1
      i32.const 1
      i32.ne
      br_if $label0
      local.get $var0
      i64.const 0
      i64.store offset=20 align=4
      local.get $var0
      i64.const 17179869185
      i64.store offset=12 align=4
      local.get $var0
      i32.const 1050652
      i32.store offset=8
      local.get $var0
      i32.const 7
      i32.add
      local.get $var0
      i32.const 8
      i32.add
      call $_ZN4core9panicking13assert_failed17h2a0bac4e515d97d3E
      unreachable
    end $label0
    local.get $var0
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN4core6option13expect_failed17h146124de70c3b2b3E (;3;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    local.get $var1
    i32.store offset=12
    local.get $var3
    local.get $var0
    i32.store offset=8
    local.get $var3
    i32.const 1
    i32.store offset=20
    local.get $var3
    i32.const 1048816
    i32.store offset=16
    local.get $var3
    i64.const 1
    i64.store offset=28 align=4
    local.get $var3
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $var3
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $var3
    local.get $var3
    i32.const 40
    i32.add
    i32.store offset=24
    local.get $var3
    i32.const 16
    i32.add
    local.get $var2
    call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
    unreachable
  )
  (func $_ZN8programs3aes6cipher3Aes16with_128_bit_key17h05d5d4ed816b09b9E (;4;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    global.get $__stack_pointer
    i32.const 640
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    block $label0
      i32.const 44
      i32.eqz
      br_if $label0
      local.get $var2
      i32.const 560
      i32.add
      i32.const 0
      i32.const 44
      memory.fill
    end $label0
    i32.const -11
    local.set $var3
    local.get $var2
    i32.const 560
    i32.add
    local.set $var4
    loop $label1
      local.get $var4
      local.get $var3
      i32.const 1050443
      i32.add
      i32.load8_u
      i32.store align=1
      local.get $var4
      i32.const 4
      i32.add
      local.set $var4
      local.get $var3
      i32.const 1
      i32.add
      local.tee $var3
      br_if $label1
    end $label1
    block $label2
      i32.const 512
      i32.eqz
      br_if $label2
      local.get $var2
      i32.const 4
      i32.add
      i32.const 1049696
      i32.const 512
      memory.copy
    end $label2
    block $label3
      i32.const 44
      i32.eqz
      br_if $label3
      local.get $var2
      i32.const 4
      i32.add
      i32.const 512
      i32.add
      local.get $var2
      i32.const 560
      i32.add
      i32.const 44
      memory.copy
    end $label3
    block $label4
      i32.const 16
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE
      local.tee $var5
      i32.eqz
      br_if $label4
      i32.const 0
      local.set $var3
      loop $label5
        local.get $var5
        local.get $var3
        i32.add
        local.get $var1
        local.get $var3
        i32.add
        i32.load align=1
        i32.store align=1
        local.get $var3
        i32.const 4
        i32.add
        local.tee $var3
        i32.const 16
        i32.ne
        br_if $label5
      end $label5
      local.get $var2
      i32.const 608
      i32.add
      i32.const 8
      i32.add
      local.get $var5
      i32.const 8
      i32.add
      i64.load align=1
      i64.store
      local.get $var2
      local.get $var5
      i64.load align=1
      i64.store offset=608
      block $label6
        i32.const 704
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE
        local.tee $var1
        i32.eqz
        br_if $label6
        i32.const 0
        local.set $var4
        local.get $var2
        i32.const 0
        i32.store offset=568
        local.get $var2
        local.get $var1
        i32.store offset=564
        local.get $var2
        i32.const 176
        i32.store offset=560
        i32.const 0
        local.set $var3
        loop $label11
          block $label9
            block $label7
              local.get $var3
              i32.const 4
              i32.lt_u
              br_if $label7
              local.get $var1
              local.get $var4
              i32.add
              local.tee $var6
              i32.const -4
              i32.add
              i32.load align=1
              local.set $var7
              local.get $var6
              i32.const -16
              i32.add
              i32.load align=1
              local.set $var6
              block $label8
                local.get $var3
                i32.const 3
                i32.and
                br_if $label8
                local.get $var2
                i32.const 4
                i32.add
                local.get $var3
                i32.add
                i32.const 512
                i32.add
                i32.load align=1
                local.get $var2
                i32.const 4
                i32.add
                local.get $var7
                i32.const 24
                i32.rotl
                local.tee $var7
                i32.const 8
                i32.shr_u
                i32.const 255
                i32.and
                i32.add
                i32.load8_u
                i32.const 8
                i32.shl
                local.get $var2
                i32.const 4
                i32.add
                local.get $var7
                i32.const 255
                i32.and
                i32.add
                i32.load8_u
                i32.or
                local.get $var2
                i32.const 4
                i32.add
                local.get $var7
                i32.const 16
                i32.shr_u
                i32.const 255
                i32.and
                i32.add
                i32.load8_u
                i32.const 16
                i32.shl
                i32.or
                local.get $var2
                i32.const 4
                i32.add
                local.get $var7
                i32.const 24
                i32.shr_u
                i32.add
                i32.load8_u
                i32.const 24
                i32.shl
                i32.or
                i32.xor
                local.get $var6
                i32.xor
                local.set $var6
                br $label9
              end $label8
              local.get $var7
              local.get $var6
              i32.xor
              local.set $var6
              br $label9
            end $label7
            local.get $var2
            i32.const 608
            i32.add
            local.get $var4
            i32.add
            i32.load align=1
            local.set $var6
          end $label9
          block $label10
            local.get $var3
            local.get $var2
            i32.load offset=560
            i32.ne
            br_if $label10
            local.get $var2
            i32.const 560
            i32.add
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h76d255b038f889eeE
            local.get $var2
            i32.load offset=564
            local.set $var1
          end $label10
          local.get $var1
          local.get $var4
          i32.add
          local.get $var6
          i32.store align=1
          local.get $var2
          local.get $var3
          i32.const 1
          i32.add
          local.tee $var3
          i32.store offset=568
          local.get $var4
          i32.const 4
          i32.add
          local.set $var4
          local.get $var3
          i32.const 44
          i32.ne
          br_if $label11
        end $label11
        local.get $var2
        i32.load offset=564
        local.set $var8
        local.get $var2
        i32.load offset=560
        local.set $var9
        block $label13
          block $label12
            i32.const 2816
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE
            local.tee $var10
            i32.eqz
            br_if $label12
            i32.const 0
            local.set $var6
            local.get $var2
            i32.const 0
            i32.store offset=636
            local.get $var2
            local.get $var10
            i32.store offset=632
            local.get $var2
            i32.const 176
            i32.store offset=628
            i32.const 44
            local.set $var7
            local.get $var2
            i32.const 560
            i32.add
            i32.const 8
            i32.add
            local.set $var11
            local.get $var8
            local.set $var12
            loop $label16
              local.get $var11
              i64.const 0
              i64.store
              local.get $var2
              i64.const 0
              i64.store offset=560
              local.get $var7
              local.get $var7
              i32.const 4
              local.get $var7
              i32.const 4
              i32.lt_u
              select
              local.tee $var13
              i32.sub
              local.set $var7
              local.get $var12
              local.tee $var1
              local.get $var13
              i32.const 2
              i32.shl
              local.tee $var4
              i32.add
              local.set $var12
              i32.const 0
              local.set $var3
              loop $label14
                local.get $var4
                local.get $var3
                i32.eq
                br_if $label13
                local.get $var2
                i32.const 560
                i32.add
                local.get $var3
                i32.add
                local.get $var1
                local.get $var3
                i32.add
                i32.load align=1
                i32.store align=1
                local.get $var3
                i32.const 4
                i32.add
                local.tee $var3
                i32.const 16
                i32.ne
                br_if $label14
              end $label14
              block $label15
                local.get $var6
                local.get $var2
                i32.load offset=628
                i32.ne
                br_if $label15
                local.get $var2
                i32.const 628
                i32.add
                call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17he8ad4992820ad6e0E
                local.get $var2
                i32.load offset=632
                local.set $var10
              end $label15
              local.get $var10
              local.get $var6
              i32.const 4
              i32.shl
              i32.add
              local.tee $var3
              local.get $var2
              i64.load offset=560
              i64.store align=1
              local.get $var3
              i32.const 8
              i32.add
              local.get $var11
              i64.load
              i64.store align=1
              local.get $var2
              local.get $var6
              i32.const 1
              i32.add
              local.tee $var6
              i32.store offset=636
              local.get $var6
              i32.const 11
              i32.ne
              br_if $label16
            end $label16
            local.get $var0
            local.get $var2
            i64.load offset=628 align=4
            i64.store align=4
            local.get $var0
            i32.const 8
            i32.add
            local.get $var2
            i32.const 628
            i32.add
            i32.const 8
            i32.add
            i32.load
            i32.store
            local.get $var9
            local.get $var8
            i32.const 4
            call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17h8d09733021fe6165E
            i32.const 4
            local.get $var5
            i32.const 4
            call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17h8d09733021fe6165E
            local.get $var0
            i32.const 10
            i32.store offset=12
            local.get $var2
            i32.const 640
            i32.add
            global.set $__stack_pointer
            return
          end $label12
          i32.const 1
          i32.const 2816
          i32.const 1050352
          call $_ZN5alloc7raw_vec12handle_error17hc5314d3208d911b6E
          unreachable
        end $label13
        local.get $var13
        local.get $var13
        i32.const 1050384
        call $_ZN4core9panicking18panic_bounds_check17hce40a9a02592ee3cE
        unreachable
      end $label6
      i32.const 1
      i32.const 704
      i32.const 1050400
      call $_ZN5alloc7raw_vec12handle_error17hc5314d3208d911b6E
      unreachable
    end $label4
    i32.const 1
    i32.const 16
    i32.const 1049680
    call $_ZN5alloc7raw_vec12handle_error17hc5314d3208d911b6E
    unreachable
  )
  (func $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$8backward17h9ff497399b6f7039E (;5;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    local.get $var0
    i32.load8_u offset=1
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label0
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 1
      i32.add
      local.get $var3
      i32.const 5
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label0
    end $label0
    local.get $var0
    local.get $var1
    i32.store8 offset=13
    local.get $var0
    i32.load8_u offset=1
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label1
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 1
      i32.add
      local.get $var3
      i32.const 5
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label1
    end $label1
    local.get $var0
    local.get $var1
    i32.store8 offset=13
    local.get $var0
    i32.load8_u offset=1
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label2
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 1
      i32.add
      local.get $var3
      i32.const 5
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label2
    end $label2
    local.get $var0
    local.get $var1
    i32.store8 offset=13
    local.get $var0
    i32.load8_u offset=2
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label3
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 2
      i32.add
      local.get $var3
      i32.const 6
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label3
    end $label3
    local.get $var0
    local.get $var1
    i32.store8 offset=14
    local.get $var0
    i32.load8_u offset=2
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label4
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 2
      i32.add
      local.get $var3
      i32.const 6
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label4
    end $label4
    local.get $var0
    local.get $var1
    i32.store8 offset=14
    local.get $var0
    i32.load8_u offset=3
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label5
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 3
      i32.add
      local.get $var3
      i32.const 7
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label5
    end $label5
    local.get $var0
    local.get $var1
    i32.store8 offset=15
  )
  (func $_ZN4core9panicking18panic_bounds_check17hce40a9a02592ee3cE (;6;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    (local $var4 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    local.get $var1
    i32.store offset=4
    local.get $var3
    local.get $var0
    i32.store
    local.get $var3
    i32.const 2
    i32.store offset=12
    local.get $var3
    i32.const 1049028
    i32.store offset=8
    local.get $var3
    i64.const 2
    i64.store offset=20 align=4
    local.get $var3
    i32.const 2
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $var4
    local.get $var3
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $var3
    local.get $var4
    local.get $var3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get $var3
    local.get $var3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get $var3
    i32.const 8
    i32.add
    local.get $var2
    call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
    unreachable
  )
  (func $_ZN8programs3aes5Arena8allocate17hcd9b4e3abb22ef34E (;7;) (param $var0 i32) (param $var1 i32) (result i32)
    (local $var2 i32)
    (local $var3 i32)
    i32.const 0
    local.set $var2
    block $label2
      block $label3
        block $label0
          local.get $var1
          i32.const 0
          i32.lt_s
          br_if $label0
          block $label1
            local.get $var1
            br_if $label1
            i32.const 0
            local.set $var1
            i32.const 1
            local.set $var2
            br $label2
          end $label1
          local.get $var1
          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE
          local.tee $var2
          br_if $label3
          i32.const 1
          local.set $var2
        end $label0
        local.get $var2
        local.get $var1
        i32.const 1049680
        call $_ZN5alloc7raw_vec12handle_error17hc5314d3208d911b6E
        unreachable
      end $label3
      local.get $var1
      i32.eqz
      br_if $label2
      local.get $var2
      i32.const 0
      local.get $var1
      memory.fill
    end $label2
    block $label4
      local.get $var0
      i32.load offset=8
      local.tee $var3
      local.get $var0
      i32.load
      i32.ne
      br_if $label4
      local.get $var0
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h8b3d2745a7a8cbbeE
    end $label4
    local.get $var0
    local.get $var3
    i32.const 1
    i32.add
    i32.store offset=8
    local.get $var0
    i32.load offset=4
    local.get $var3
    i32.const 3
    i32.shl
    i32.add
    local.tee $var0
    local.get $var1
    i32.store offset=4
    local.get $var0
    local.get $var2
    i32.store
    local.get $var2
  )
  (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17h8d09733021fe6165E (;8;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    block $label1
      block $label0
        local.get $var0
        br_if $label0
        i32.const 0
        local.set $var0
        local.get $var3
        i32.const 12
        i32.add
        local.set $var2
        br $label1
      end $label0
      local.get $var3
      i32.const 1
      i32.store offset=12
      local.get $var0
      local.get $var2
      i32.mul
      local.set $var0
      local.get $var3
      i32.const 8
      i32.add
      local.set $var2
    end $label1
    local.get $var2
    local.get $var0
    i32.store
    block $label2
      local.get $var3
      i32.load offset=12
      local.tee $var0
      i32.eqz
      br_if $label2
      local.get $var3
      i32.load offset=8
      local.tee $var2
      i32.eqz
      br_if $label2
      local.get $var1
      local.get $var2
      local.get $var0
      call $_RNvCskK8ZSUeDzDN_7___rustc14___rust_dealloc
    end $label2
    local.get $var3
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h155521667d43768eE (;9;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    local.get $var1
    local.get $var0
    local.get $var2
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail8do_panic7runtime17h7796e94a8ae679c1E
    unreachable
  )
  (func $drop_array (;10;) (export "drop_array") (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    block $label0
      i32.const 0
      i32.load8_u offset=1050908
      i32.const 3
      i32.eq
      br_if $label0
      local.get $var1
      i32.const 1050892
      i32.store offset=12
      local.get $var1
      i32.const 12
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17heca02e7eea73bc5eE
    end $label0
    call $_ZN3std4sync6poison5mutex14Mutex$LT$T$GT$4lock17h532ecc6dcefb18a0E
    block $label2
      block $label1
        i32.const 0
        i32.load offset=1050904
        local.tee $var2
        i32.eqz
        br_if $label1
        local.get $var2
        i32.const 3
        i32.shl
        local.set $var3
        i32.const 0
        local.set $var4
        i32.const 0
        i32.load offset=1050900
        local.tee $var5
        local.set $var6
        loop $label3
          local.get $var6
          i32.load
          local.get $var0
          i32.eq
          br_if $label2
          local.get $var4
          i32.const 1
          i32.add
          local.set $var4
          local.get $var6
          i32.const 8
          i32.add
          local.set $var6
          local.get $var3
          i32.const -8
          i32.add
          local.tee $var3
          br_if $label3
        end $label3
      end $label1
      i32.const 1050240
      i32.const 30
      i32.const 1050272
      call $_ZN4core6option13expect_failed17h146124de70c3b2b3E
      unreachable
    end $label2
    i32.const 0
    local.get $var2
    i32.const -1
    i32.add
    local.tee $var3
    i32.store offset=1050904
    local.get $var5
    local.get $var4
    i32.const 3
    i32.shl
    i32.add
    local.tee $var6
    i32.load offset=4
    local.set $var4
    local.get $var6
    i32.load
    local.set $var0
    local.get $var6
    local.get $var5
    local.get $var3
    i32.const 3
    i32.shl
    i32.add
    i64.load align=4
    i64.store align=4
    local.get $var4
    local.get $var0
    i32.const 1
    call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17h8d09733021fe6165E
    i32.const 0
    i32.const 0
    i32.store8 offset=1050892
    local.get $var1
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $encrypt_128 (;11;) (export "encrypt_128") (param $var0 i32) (param $var1 i32) (result i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    (local $var14 i32)
    (local $var15 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    block $label0
      i32.const 0
      i32.load8_u offset=1050908
      i32.const 3
      i32.eq
      br_if $label0
      local.get $var2
      i32.const 1050892
      i32.store offset=80
      local.get $var2
      i32.const 80
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17heca02e7eea73bc5eE
    end $label0
    call $_ZN3std4sync6poison5mutex14Mutex$LT$T$GT$4lock17h532ecc6dcefb18a0E
    block $label2
      block $label1
        i32.const 0
        i32.load offset=1050904
        local.tee $var3
        i32.eqz
        br_if $label1
        i32.const 0
        local.set $var4
        local.get $var3
        i32.const 3
        i32.shl
        local.tee $var5
        local.set $var6
        i32.const 0
        i32.load offset=1050900
        local.tee $var7
        local.set $var3
        loop $label3
          local.get $var3
          i32.load
          local.get $var0
          i32.eq
          br_if $label2
          local.get $var4
          i32.const 1
          i32.add
          local.set $var4
          local.get $var3
          i32.const 8
          i32.add
          local.set $var3
          local.get $var6
          i32.const -8
          i32.add
          local.tee $var6
          br_if $label3
        end $label3
      end $label1
      i32.const 1050288
      i32.const 32
      i32.const 1050320
      call $_ZN4core6option13expect_failed17h146124de70c3b2b3E
      unreachable
    end $label2
    block $label22
      block $label17
        block $label13
          block $label8
            block $label7
              block $label4
                local.get $var7
                local.get $var4
                i32.const 3
                i32.shl
                i32.add
                local.tee $var3
                i32.load offset=4
                local.tee $var4
                i32.const 16
                i32.ne
                br_if $label4
                local.get $var2
                i32.const 8
                i32.add
                local.get $var3
                i32.load
                local.tee $var3
                i32.const 8
                i32.add
                i64.load align=1
                i64.store
                local.get $var2
                local.get $var3
                i64.load align=1
                i64.store
                i32.const 0
                local.set $var4
                local.get $var7
                local.set $var3
                block $label5
                  loop $label6
                    local.get $var3
                    i32.load
                    local.get $var1
                    i32.eq
                    br_if $label5
                    local.get $var4
                    i32.const 1
                    i32.add
                    local.set $var4
                    local.get $var3
                    i32.const 8
                    i32.add
                    local.set $var3
                    local.get $var5
                    i32.const -8
                    i32.add
                    local.tee $var5
                    br_if $label6
                  end $label6
                  i32.const 1050288
                  i32.const 32
                  i32.const 1050320
                  call $_ZN4core6option13expect_failed17h146124de70c3b2b3E
                  unreachable
                end $label5
                local.get $var7
                local.get $var4
                i32.const 3
                i32.shl
                i32.add
                local.tee $var3
                i32.load offset=4
                local.tee $var4
                i32.const 16
                i32.ne
                br_if $label7
                local.get $var2
                i32.const 16
                i32.add
                i32.const 8
                i32.add
                local.get $var3
                i32.load
                local.tee $var3
                i32.const 8
                i32.add
                i64.load align=1
                i64.store
                local.get $var2
                local.get $var3
                i64.load align=1
                i64.store offset=16
                local.get $var2
                i32.const 32
                i32.add
                local.get $var2
                i32.const 16
                i32.add
                call $_ZN8programs3aes6cipher3Aes16with_128_bit_key17h05d5d4ed816b09b9E
                local.get $var2
                i32.const 64
                i32.add
                i32.const 8
                i32.add
                local.get $var2
                i32.const 8
                i32.add
                i64.load
                i64.store
                local.get $var2
                local.get $var2
                i64.load
                i64.store offset=64
                local.get $var2
                i32.load offset=40
                local.tee $var8
                i32.eqz
                br_if $label8
                local.get $var2
                i32.const 80
                i32.add
                i32.const 8
                i32.add
                local.get $var2
                i32.load offset=36
                local.tee $var9
                i32.const 8
                i32.add
                i64.load align=1
                i64.store
                local.get $var2
                local.get $var9
                i64.load align=1
                i64.store offset=80
                i32.const 0
                local.set $var3
                loop $label9
                  local.get $var2
                  i32.const 64
                  i32.add
                  local.get $var3
                  i32.add
                  local.tee $var4
                  local.get $var4
                  i32.load8_u
                  local.get $var2
                  i32.const 80
                  i32.add
                  local.get $var3
                  i32.add
                  i32.load8_u
                  i32.xor
                  i32.store8
                  local.get $var3
                  i32.const 1
                  i32.add
                  local.tee $var3
                  i32.const 16
                  i32.ne
                  br_if $label9
                end $label9
                block $label10
                  local.get $var2
                  i32.load offset=44
                  local.tee $var10
                  i32.const 2
                  i32.lt_u
                  br_if $label10
                  i32.const 1
                  local.set $var11
                  loop $label15
                    i32.const 0
                    local.set $var3
                    loop $label11
                      local.get $var2
                      i32.const 64
                      i32.add
                      local.get $var3
                      i32.add
                      local.tee $var4
                      local.get $var4
                      i32.load8_u
                      i32.load8_u offset=1049696
                      i32.store8
                      local.get $var3
                      i32.const 1
                      i32.add
                      local.tee $var3
                      i32.const 16
                      i32.ne
                      br_if $label11
                    end $label11
                    local.get $var2
                    i32.const 64
                    i32.add
                    call $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$7forward17h8a681fa7dfc01dc0E
                    i32.const 0
                    local.set $var1
                    loop $label12
                      local.get $var2
                      i32.const 64
                      i32.add
                      local.get $var1
                      i32.add
                      local.tee $var3
                      i32.const 3
                      i32.add
                      local.tee $var6
                      local.get $var3
                      i32.const 1
                      i32.add
                      local.tee $var7
                      i32.load8_s
                      local.tee $var5
                      local.get $var3
                      i32.load8_s
                      local.tee $var0
                      i32.xor
                      local.tee $var12
                      local.get $var3
                      i32.const 2
                      i32.add
                      local.tee $var13
                      i32.load8_s
                      local.tee $var4
                      i32.xor
                      local.get $var0
                      i32.const 7
                      i32.shr_u
                      i32.const 27
                      i32.and
                      local.get $var0
                      i32.const 1
                      i32.shl
                      i32.xor
                      local.tee $var14
                      i32.xor
                      local.get $var6
                      i32.load8_s
                      local.tee $var6
                      i32.const 7
                      i32.shr_u
                      i32.const 27
                      i32.and
                      local.get $var6
                      i32.const 1
                      i32.shl
                      i32.xor
                      local.tee $var15
                      i32.xor
                      i32.store8
                      local.get $var13
                      local.get $var12
                      local.get $var6
                      i32.xor
                      local.get $var4
                      i32.const 7
                      i32.shr_u
                      i32.const 27
                      i32.and
                      local.get $var4
                      i32.const 1
                      i32.shl
                      i32.xor
                      local.tee $var12
                      i32.xor
                      local.get $var15
                      i32.xor
                      i32.store8
                      local.get $var7
                      local.get $var6
                      local.get $var4
                      local.get $var0
                      i32.xor
                      i32.xor
                      local.get $var5
                      i32.const 7
                      i32.shr_u
                      i32.const 27
                      i32.and
                      local.get $var5
                      i32.const 1
                      i32.shl
                      i32.xor
                      local.tee $var0
                      i32.xor
                      local.get $var12
                      i32.xor
                      i32.store8
                      local.get $var3
                      local.get $var6
                      local.get $var4
                      local.get $var5
                      i32.xor
                      local.get $var14
                      i32.xor
                      i32.xor
                      local.get $var0
                      i32.xor
                      i32.store8
                      local.get $var1
                      i32.const 4
                      i32.add
                      local.tee $var1
                      i32.const 16
                      i32.ne
                      br_if $label12
                    end $label12
                    local.get $var11
                    local.get $var8
                    i32.eq
                    br_if $label13
                    local.get $var11
                    i32.const 1
                    i32.add
                    local.set $var6
                    local.get $var2
                    i32.const 80
                    i32.add
                    i32.const 8
                    i32.add
                    local.get $var9
                    local.get $var11
                    i32.const 4
                    i32.shl
                    i32.add
                    local.tee $var3
                    i32.const 8
                    i32.add
                    i64.load align=1
                    i64.store
                    local.get $var2
                    local.get $var3
                    i64.load align=1
                    i64.store offset=80
                    i32.const 0
                    local.set $var3
                    loop $label14
                      local.get $var2
                      i32.const 64
                      i32.add
                      local.get $var3
                      i32.add
                      local.tee $var4
                      local.get $var4
                      i32.load8_u
                      local.get $var2
                      i32.const 80
                      i32.add
                      local.get $var3
                      i32.add
                      i32.load8_u
                      i32.xor
                      i32.store8
                      local.get $var3
                      i32.const 1
                      i32.add
                      local.tee $var3
                      i32.const 16
                      i32.ne
                      br_if $label14
                    end $label14
                    local.get $var6
                    local.set $var11
                    local.get $var6
                    local.get $var10
                    i32.ne
                    br_if $label15
                  end $label15
                end $label10
                i32.const 0
                local.set $var3
                loop $label16
                  local.get $var2
                  i32.const 64
                  i32.add
                  local.get $var3
                  i32.add
                  local.tee $var4
                  local.get $var4
                  i32.load8_u
                  i32.load8_u offset=1049696
                  i32.store8
                  local.get $var3
                  i32.const 1
                  i32.add
                  local.tee $var3
                  i32.const 16
                  i32.ne
                  br_if $label16
                end $label16
                local.get $var2
                i32.const 64
                i32.add
                call $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$7forward17h8a681fa7dfc01dc0E
                local.get $var10
                local.get $var8
                i32.ge_u
                br_if $label17
                local.get $var2
                i32.const 80
                i32.add
                i32.const 8
                i32.add
                local.get $var9
                local.get $var10
                i32.const 4
                i32.shl
                i32.add
                local.tee $var3
                i32.const 8
                i32.add
                i64.load align=1
                i64.store
                local.get $var2
                local.get $var3
                i64.load align=1
                i64.store offset=80
                i32.const 0
                local.set $var3
                loop $label18
                  local.get $var2
                  i32.const 64
                  i32.add
                  local.get $var3
                  i32.add
                  local.tee $var4
                  local.get $var4
                  i32.load8_u
                  local.get $var2
                  i32.const 80
                  i32.add
                  local.get $var3
                  i32.add
                  i32.load8_u
                  i32.xor
                  i32.store8
                  local.get $var3
                  i32.const 1
                  i32.add
                  local.tee $var3
                  i32.const 16
                  i32.ne
                  br_if $label18
                end $label18
                local.get $var2
                i32.const 48
                i32.add
                i32.const 8
                i32.add
                local.get $var2
                i32.const 64
                i32.add
                i32.const 8
                i32.add
                i64.load
                i64.store
                local.get $var2
                local.get $var2
                i64.load offset=64
                i64.store offset=48
                i32.const 0
                local.set $var4
                i32.const 1050896
                i32.const 16
                call $_ZN8programs3aes5Arena8allocate17hcd9b4e3abb22ef34E
                local.set $var5
                block $label20
                  block $label19
                    i32.const 0
                    i32.load offset=1050904
                    local.tee $var3
                    i32.eqz
                    br_if $label19
                    local.get $var3
                    i32.const 3
                    i32.shl
                    local.set $var6
                    i32.const 0
                    i32.load offset=1050900
                    local.tee $var0
                    local.set $var3
                    loop $label21
                      local.get $var3
                      i32.load
                      local.get $var5
                      i32.eq
                      br_if $label20
                      local.get $var4
                      i32.const 1
                      i32.add
                      local.set $var4
                      local.get $var3
                      i32.const 8
                      i32.add
                      local.set $var3
                      local.get $var6
                      i32.const -8
                      i32.add
                      local.tee $var6
                      br_if $label21
                    end $label21
                  end $label19
                  i32.const 1050288
                  i32.const 32
                  i32.const 1050320
                  call $_ZN4core6option13expect_failed17h146124de70c3b2b3E
                  unreachable
                end $label20
                local.get $var0
                local.get $var4
                i32.const 3
                i32.shl
                i32.add
                local.tee $var3
                i32.load offset=4
                local.tee $var4
                i32.const 16
                i32.ne
                br_if $label22
                local.get $var3
                i32.load
                local.tee $var3
                local.get $var2
                i64.load offset=48
                i64.store align=1
                local.get $var3
                i32.const 8
                i32.add
                local.get $var2
                i32.const 48
                i32.add
                i32.const 8
                i32.add
                i64.load
                i64.store align=1
                local.get $var2
                i32.load offset=32
                local.get $var9
                i32.const 16
                call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17h8d09733021fe6165E
                i32.const 0
                i32.const 0
                i32.store8 offset=1050892
                local.get $var2
                i32.const 96
                i32.add
                global.set $__stack_pointer
                local.get $var5
                return
              end $label4
              i32.const 16
              local.get $var4
              i32.const 1050524
              call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h155521667d43768eE
              unreachable
            end $label7
            i32.const 16
            local.get $var4
            i32.const 1050524
            call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h155521667d43768eE
            unreachable
          end $label8
          i32.const 0
          i32.const 0
          i32.const 1050476
          call $_ZN4core9panicking18panic_bounds_check17hce40a9a02592ee3cE
          unreachable
        end $label13
        local.get $var8
        local.get $var8
        i32.const 1050508
        call $_ZN4core9panicking18panic_bounds_check17hce40a9a02592ee3cE
        unreachable
      end $label17
      local.get $var10
      local.get $var8
      i32.const 1050492
      call $_ZN4core9panicking18panic_bounds_check17hce40a9a02592ee3cE
      unreachable
    end $label22
    local.get $var4
    i32.const 16
    i32.const 1050224
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h155521667d43768eE
    unreachable
  )
  (func $_ZN83_$LT$programs..aes..cipher..ShiftRows$u20$as$u20$programs..aes..cipher..AesStep$GT$7forward17h8a681fa7dfc01dc0E (;12;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    local.get $var0
    i32.load8_u offset=1
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label0
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 1
      i32.add
      local.get $var3
      i32.const 5
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label0
    end $label0
    local.get $var0
    local.get $var1
    i32.store8 offset=13
    local.get $var0
    i32.load8_u offset=2
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label1
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 2
      i32.add
      local.get $var3
      i32.const 6
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label1
    end $label1
    local.get $var0
    local.get $var1
    i32.store8 offset=14
    local.get $var0
    i32.load8_u offset=2
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label2
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 2
      i32.add
      local.get $var3
      i32.const 6
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label2
    end $label2
    local.get $var0
    local.get $var1
    i32.store8 offset=14
    local.get $var0
    i32.load8_u offset=3
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label3
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 3
      i32.add
      local.get $var3
      i32.const 7
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label3
    end $label3
    local.get $var0
    local.get $var1
    i32.store8 offset=15
    local.get $var0
    i32.load8_u offset=3
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label4
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 3
      i32.add
      local.get $var3
      i32.const 7
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label4
    end $label4
    local.get $var0
    local.get $var1
    i32.store8 offset=15
    local.get $var0
    i32.load8_u offset=3
    local.set $var1
    i32.const 0
    local.set $var2
    loop $label5
      local.get $var0
      local.get $var2
      i32.add
      local.tee $var3
      i32.const 3
      i32.add
      local.get $var3
      i32.const 7
      i32.add
      i32.load8_u
      i32.store8
      local.get $var2
      i32.const 4
      i32.add
      local.tee $var2
      i32.const 12
      i32.ne
      br_if $label5
    end $label5
    local.get $var0
    local.get $var1
    i32.store8 offset=15
  )
  (func $new_array (;13;) (export "new_array") (param $var0 i32) (result i32)
    (local $var1 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    block $label0
      i32.const 0
      i32.load8_u offset=1050908
      i32.const 3
      i32.eq
      br_if $label0
      local.get $var1
      i32.const 1050892
      i32.store offset=12
      local.get $var1
      i32.const 12
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17heca02e7eea73bc5eE
    end $label0
    call $_ZN3std4sync6poison5mutex14Mutex$LT$T$GT$4lock17h532ecc6dcefb18a0E
    i32.const 1050896
    local.get $var0
    call $_ZN8programs3aes5Arena8allocate17hcd9b4e3abb22ef34E
    local.set $var0
    i32.const 0
    i32.const 0
    i32.store8 offset=1050892
    local.get $var1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get $var0
  )
  (func $_RNvCskK8ZSUeDzDN_7___rustc14___rust_dealloc (;14;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    block $label2
      block $label0
        local.get $var0
        i32.const -4
        i32.add
        i32.load
        local.tee $var3
        i32.const -8
        i32.and
        local.tee $var4
        i32.const 4
        i32.const 8
        local.get $var3
        i32.const 3
        i32.and
        local.tee $var3
        select
        local.get $var1
        i32.add
        i32.lt_u
        br_if $label0
        block $label1
          local.get $var3
          i32.eqz
          br_if $label1
          local.get $var4
          local.get $var1
          i32.const 39
          i32.add
          i32.gt_u
          br_if $label2
        end $label1
        local.get $var0
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hf5c3fb01c2333719E
        return
      end $label0
      i32.const 1050764
      i32.const 46
      i32.const 1050812
      call $_ZN4core9panicking5panic17h7520802b131436bfE
      unreachable
    end $label2
    i32.const 1050828
    i32.const 46
    i32.const 1050876
    call $_ZN4core9panicking5panic17h7520802b131436bfE
    unreachable
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hf5c3fb01c2333719E (;15;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    local.get $var0
    i32.const -8
    i32.add
    local.tee $var1
    local.get $var0
    i32.const -4
    i32.add
    i32.load
    local.tee $var2
    i32.const -8
    i32.and
    local.tee $var0
    i32.add
    local.set $var3
    block $label1
      block $label0
        local.get $var2
        i32.const 1
        i32.and
        br_if $label0
        local.get $var2
        i32.const 2
        i32.and
        i32.eqz
        br_if $label1
        local.get $var1
        i32.load
        local.tee $var2
        local.get $var0
        i32.add
        local.set $var0
        block $label2
          local.get $var1
          local.get $var2
          i32.sub
          local.tee $var1
          i32.const 0
          i32.load offset=1051336
          i32.ne
          br_if $label2
          local.get $var3
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if $label0
          i32.const 0
          local.get $var0
          i32.store offset=1051328
          local.get $var3
          local.get $var3
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get $var1
          local.get $var0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var3
          local.get $var0
          i32.store
          return
        end $label2
        local.get $var1
        local.get $var2
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E
      end $label0
      block $label11
        block $label7
          block $label5
            block $label4
              block $label6
                block $label3
                  local.get $var3
                  i32.load offset=4
                  local.tee $var2
                  i32.const 2
                  i32.and
                  br_if $label3
                  local.get $var3
                  i32.const 0
                  i32.load offset=1051340
                  i32.eq
                  br_if $label4
                  local.get $var3
                  i32.const 0
                  i32.load offset=1051336
                  i32.eq
                  br_if $label5
                  local.get $var3
                  local.get $var2
                  i32.const -8
                  i32.and
                  local.tee $var2
                  call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E
                  local.get $var1
                  local.get $var2
                  local.get $var0
                  i32.add
                  local.tee $var0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var1
                  local.get $var0
                  i32.add
                  local.get $var0
                  i32.store
                  local.get $var1
                  i32.const 0
                  i32.load offset=1051336
                  i32.ne
                  br_if $label6
                  i32.const 0
                  local.get $var0
                  i32.store offset=1051328
                  return
                end $label3
                local.get $var3
                local.get $var2
                i32.const -2
                i32.and
                i32.store offset=4
                local.get $var1
                local.get $var0
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $var1
                local.get $var0
                i32.add
                local.get $var0
                i32.store
              end $label6
              local.get $var0
              i32.const 256
              i32.lt_u
              br_if $label7
              local.get $var1
              local.get $var0
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E
              i32.const 0
              local.set $var1
              i32.const 0
              i32.const 0
              i32.load offset=1051360
              i32.const -1
              i32.add
              local.tee $var0
              i32.store offset=1051360
              local.get $var0
              br_if $label1
              block $label8
                i32.const 0
                i32.load offset=1051048
                local.tee $var0
                i32.eqz
                br_if $label8
                i32.const 0
                local.set $var1
                loop $label9
                  local.get $var1
                  i32.const 1
                  i32.add
                  local.set $var1
                  local.get $var0
                  i32.load offset=8
                  local.tee $var0
                  br_if $label9
                end $label9
              end $label8
              i32.const 0
              local.get $var1
              i32.const 4095
              local.get $var1
              i32.const 4095
              i32.gt_u
              select
              i32.store offset=1051360
              return
            end $label4
            i32.const 0
            local.get $var1
            i32.store offset=1051340
            i32.const 0
            i32.const 0
            i32.load offset=1051332
            local.get $var0
            i32.add
            local.tee $var0
            i32.store offset=1051332
            local.get $var1
            local.get $var0
            i32.const 1
            i32.or
            i32.store offset=4
            block $label10
              local.get $var1
              i32.const 0
              i32.load offset=1051336
              i32.ne
              br_if $label10
              i32.const 0
              i32.const 0
              i32.store offset=1051328
              i32.const 0
              i32.const 0
              i32.store offset=1051336
            end $label10
            local.get $var0
            i32.const 0
            i32.load offset=1051352
            local.tee $var4
            i32.le_u
            br_if $label1
            i32.const 0
            i32.load offset=1051340
            local.tee $var0
            i32.eqz
            br_if $label1
            i32.const 0
            local.set $var2
            i32.const 0
            i32.load offset=1051332
            local.tee $var5
            i32.const 41
            i32.lt_u
            br_if $label11
            i32.const 1051040
            local.set $var1
            loop $label13
              block $label12
                local.get $var1
                i32.load
                local.tee $var3
                local.get $var0
                i32.gt_u
                br_if $label12
                local.get $var0
                local.get $var3
                local.get $var1
                i32.load offset=4
                i32.add
                i32.lt_u
                br_if $label11
              end $label12
              local.get $var1
              i32.load offset=8
              local.set $var1
              br $label13
            end $label13
          end $label5
          i32.const 0
          local.get $var1
          i32.store offset=1051336
          i32.const 0
          i32.const 0
          i32.load offset=1051328
          local.get $var0
          i32.add
          local.tee $var0
          i32.store offset=1051328
          local.get $var1
          local.get $var0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var1
          local.get $var0
          i32.add
          local.get $var0
          i32.store
          return
        end $label7
        block $label15
          block $label14
            i32.const 0
            i32.load offset=1051320
            local.tee $var3
            i32.const 1
            local.get $var0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee $var2
            i32.and
            br_if $label14
            i32.const 0
            local.get $var3
            local.get $var2
            i32.or
            i32.store offset=1051320
            local.get $var0
            i32.const 248
            i32.and
            i32.const 1051056
            i32.add
            local.tee $var0
            local.set $var3
            br $label15
          end $label14
          local.get $var0
          i32.const 248
          i32.and
          local.tee $var3
          i32.const 1051056
          i32.add
          local.set $var0
          local.get $var3
          i32.const 1051064
          i32.add
          i32.load
          local.set $var3
        end $label15
        local.get $var0
        local.get $var1
        i32.store offset=8
        local.get $var3
        local.get $var1
        i32.store offset=12
        local.get $var1
        local.get $var0
        i32.store offset=12
        local.get $var1
        local.get $var3
        i32.store offset=8
        return
      end $label11
      block $label16
        i32.const 0
        i32.load offset=1051048
        local.tee $var1
        i32.eqz
        br_if $label16
        i32.const 0
        local.set $var2
        loop $label17
          local.get $var2
          i32.const 1
          i32.add
          local.set $var2
          local.get $var1
          i32.load offset=8
          local.tee $var1
          br_if $label17
        end $label17
      end $label16
      i32.const 0
      local.get $var2
      i32.const 4095
      local.get $var2
      i32.const 4095
      i32.gt_u
      select
      i32.store offset=1051360
      local.get $var5
      local.get $var4
      i32.le_u
      br_if $label1
      i32.const 0
      i32.const -1
      i32.store offset=1051352
    end $label1
  )
  (func $_ZN4core9panicking5panic17h7520802b131436bfE (;16;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    i32.const 0
    i32.store offset=16
    local.get $var3
    i32.const 1
    i32.store offset=4
    local.get $var3
    i64.const 4
    i64.store offset=8 align=4
    local.get $var3
    local.get $var1
    i32.store offset=28
    local.get $var3
    local.get $var0
    i32.store offset=24
    local.get $var3
    local.get $var3
    i32.const 24
    i32.add
    i32.store
    local.get $var3
    local.get $var2
    call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
    unreachable
  )
  (func $_RNvCskK8ZSUeDzDN_7___rustc14___rust_realloc (;17;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32) (result i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    block $label4
      block $label9
        block $label12
          block $label2
            block $label0
              local.get $var0
              i32.const -4
              i32.add
              local.tee $var4
              i32.load
              local.tee $var5
              i32.const -8
              i32.and
              local.tee $var6
              i32.const 4
              i32.const 8
              local.get $var5
              i32.const 3
              i32.and
              local.tee $var7
              select
              local.get $var1
              i32.add
              i32.lt_u
              br_if $label0
              block $label1
                local.get $var7
                i32.eqz
                br_if $label1
                local.get $var6
                local.get $var1
                i32.const 39
                i32.add
                i32.gt_u
                br_if $label2
              end $label1
              i32.const 16
              local.get $var3
              i32.const 11
              i32.add
              i32.const -8
              i32.and
              local.get $var3
              i32.const 11
              i32.lt_u
              select
              local.set $var1
              local.get $var0
              i32.const -8
              i32.add
              local.set $var8
              block $label3
                local.get $var7
                br_if $label3
                local.get $var1
                i32.const 256
                i32.lt_u
                br_if $label4
                local.get $var8
                i32.eqz
                br_if $label4
                local.get $var6
                local.get $var1
                i32.le_u
                br_if $label4
                local.get $var6
                local.get $var1
                i32.sub
                i32.const 131072
                i32.gt_u
                br_if $label4
                local.get $var0
                return
              end $label3
              local.get $var8
              local.get $var6
              i32.add
              local.set $var7
              block $label6
                block $label5
                  local.get $var6
                  local.get $var1
                  i32.ge_u
                  br_if $label5
                  local.get $var7
                  i32.const 0
                  i32.load offset=1051340
                  i32.eq
                  br_if $label6
                  block $label7
                    local.get $var7
                    i32.const 0
                    i32.load offset=1051336
                    i32.eq
                    br_if $label7
                    local.get $var7
                    i32.load offset=4
                    local.tee $var5
                    i32.const 2
                    i32.and
                    br_if $label4
                    local.get $var5
                    i32.const -8
                    i32.and
                    local.tee $var5
                    local.get $var6
                    i32.add
                    local.tee $var6
                    local.get $var1
                    i32.lt_u
                    br_if $label4
                    local.get $var7
                    local.get $var5
                    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E
                    block $label8
                      local.get $var6
                      local.get $var1
                      i32.sub
                      local.tee $var7
                      i32.const 16
                      i32.lt_u
                      br_if $label8
                      local.get $var4
                      local.get $var1
                      local.get $var4
                      i32.load
                      i32.const 1
                      i32.and
                      i32.or
                      i32.const 2
                      i32.or
                      i32.store
                      local.get $var8
                      local.get $var1
                      i32.add
                      local.tee $var1
                      local.get $var7
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get $var8
                      local.get $var6
                      i32.add
                      local.tee $var6
                      local.get $var6
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var1
                      local.get $var7
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17h95f8096f235724aeE
                      br $label9
                    end $label8
                    local.get $var4
                    local.get $var6
                    local.get $var4
                    i32.load
                    i32.const 1
                    i32.and
                    i32.or
                    i32.const 2
                    i32.or
                    i32.store
                    local.get $var8
                    local.get $var6
                    i32.add
                    local.tee $var6
                    local.get $var6
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br $label9
                  end $label7
                  i32.const 0
                  i32.load offset=1051328
                  local.get $var6
                  i32.add
                  local.tee $var6
                  local.get $var1
                  i32.lt_u
                  br_if $label4
                  block $label11
                    block $label10
                      local.get $var6
                      local.get $var1
                      i32.sub
                      local.tee $var7
                      i32.const 15
                      i32.gt_u
                      br_if $label10
                      local.get $var4
                      local.get $var5
                      i32.const 1
                      i32.and
                      local.get $var6
                      i32.or
                      i32.const 2
                      i32.or
                      i32.store
                      local.get $var8
                      local.get $var6
                      i32.add
                      local.tee $var6
                      local.get $var6
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      i32.const 0
                      local.set $var7
                      i32.const 0
                      local.set $var1
                      br $label11
                    end $label10
                    local.get $var4
                    local.get $var1
                    local.get $var5
                    i32.const 1
                    i32.and
                    i32.or
                    i32.const 2
                    i32.or
                    i32.store
                    local.get $var8
                    local.get $var1
                    i32.add
                    local.tee $var1
                    local.get $var7
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get $var8
                    local.get $var6
                    i32.add
                    local.tee $var6
                    local.get $var7
                    i32.store
                    local.get $var6
                    local.get $var6
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                  end $label11
                  i32.const 0
                  local.get $var1
                  i32.store offset=1051336
                  i32.const 0
                  local.get $var7
                  i32.store offset=1051328
                  br $label9
                end $label5
                local.get $var6
                local.get $var1
                i32.sub
                local.tee $var6
                i32.const 15
                i32.le_u
                br_if $label9
                local.get $var4
                local.get $var1
                local.get $var5
                i32.const 1
                i32.and
                i32.or
                i32.const 2
                i32.or
                i32.store
                local.get $var8
                local.get $var1
                i32.add
                local.tee $var1
                local.get $var6
                i32.const 3
                i32.or
                i32.store offset=4
                local.get $var7
                local.get $var7
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $var1
                local.get $var6
                call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17h95f8096f235724aeE
                br $label9
              end $label6
              i32.const 0
              i32.load offset=1051332
              local.get $var6
              i32.add
              local.tee $var6
              local.get $var1
              i32.gt_u
              br_if $label12
              br $label4
            end $label0
            i32.const 1050764
            i32.const 46
            i32.const 1050812
            call $_ZN4core9panicking5panic17h7520802b131436bfE
            unreachable
          end $label2
          i32.const 1050828
          i32.const 46
          i32.const 1050876
          call $_ZN4core9panicking5panic17h7520802b131436bfE
          unreachable
        end $label12
        local.get $var4
        local.get $var1
        local.get $var5
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store
        local.get $var8
        local.get $var1
        i32.add
        local.tee $var7
        local.get $var6
        local.get $var1
        i32.sub
        local.tee $var6
        i32.const 1
        i32.or
        i32.store offset=4
        i32.const 0
        local.get $var6
        i32.store offset=1051332
        i32.const 0
        local.get $var7
        i32.store offset=1051340
      end $label9
      local.get $var8
      i32.eqz
      br_if $label4
      local.get $var0
      return
    end $label4
    block $label13
      local.get $var3
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE
      local.tee $var6
      br_if $label13
      i32.const 0
      return
    end $label13
    block $label14
      local.get $var3
      i32.const -4
      i32.const -8
      local.get $var4
      i32.load
      local.tee $var1
      i32.const 3
      i32.and
      select
      local.get $var1
      i32.const -8
      i32.and
      i32.add
      local.tee $var1
      local.get $var3
      local.get $var1
      i32.lt_u
      select
      local.tee $var3
      i32.eqz
      br_if $label14
      local.get $var6
      local.get $var0
      local.get $var3
      memory.copy
    end $label14
    local.get $var0
    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hf5c3fb01c2333719E
    local.get $var6
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E (;18;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    local.get $var0
    i32.load offset=12
    local.set $var2
    block $label9
      block $label5
        block $label8
          block $label0
            local.get $var1
            i32.const 256
            i32.lt_u
            br_if $label0
            local.get $var0
            i32.load offset=24
            local.set $var3
            block $label3
              block $label2
                block $label1
                  local.get $var2
                  local.get $var0
                  i32.ne
                  br_if $label1
                  local.get $var0
                  i32.const 20
                  i32.const 16
                  local.get $var0
                  i32.load offset=20
                  local.tee $var2
                  select
                  i32.add
                  i32.load
                  local.tee $var1
                  br_if $label2
                  i32.const 0
                  local.set $var2
                  br $label3
                end $label1
                local.get $var0
                i32.load offset=8
                local.tee $var1
                local.get $var2
                i32.store offset=12
                local.get $var2
                local.get $var1
                i32.store offset=8
                br $label3
              end $label2
              local.get $var0
              i32.const 20
              i32.add
              local.get $var0
              i32.const 16
              i32.add
              local.get $var2
              select
              local.set $var4
              loop $label4
                local.get $var4
                local.set $var5
                local.get $var1
                local.tee $var2
                i32.const 20
                i32.add
                local.get $var2
                i32.const 16
                i32.add
                local.get $var2
                i32.load offset=20
                local.tee $var1
                select
                local.set $var4
                local.get $var2
                i32.const 20
                i32.const 16
                local.get $var1
                select
                i32.add
                i32.load
                local.tee $var1
                br_if $label4
              end $label4
              local.get $var5
              i32.const 0
              i32.store
            end $label3
            local.get $var3
            i32.eqz
            br_if $label5
            block $label7
              block $label6
                local.get $var0
                local.get $var0
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1050912
                i32.add
                local.tee $var1
                i32.load
                i32.eq
                br_if $label6
                local.get $var3
                i32.load offset=16
                local.get $var0
                i32.eq
                br_if $label7
                local.get $var3
                local.get $var2
                i32.store offset=20
                local.get $var2
                br_if $label8
                br $label5
              end $label6
              local.get $var1
              local.get $var2
              i32.store
              local.get $var2
              i32.eqz
              br_if $label9
              br $label8
            end $label7
            local.get $var3
            local.get $var2
            i32.store offset=16
            local.get $var2
            br_if $label8
            br $label5
          end $label0
          block $label10
            local.get $var2
            local.get $var0
            i32.load offset=8
            local.tee $var4
            i32.eq
            br_if $label10
            local.get $var4
            local.get $var2
            i32.store offset=12
            local.get $var2
            local.get $var4
            i32.store offset=8
            return
          end $label10
          i32.const 0
          i32.const 0
          i32.load offset=1051320
          i32.const -2
          local.get $var1
          i32.const 3
          i32.shr_u
          i32.rotl
          i32.and
          i32.store offset=1051320
          return
        end $label8
        local.get $var2
        local.get $var3
        i32.store offset=24
        block $label11
          local.get $var0
          i32.load offset=16
          local.tee $var1
          i32.eqz
          br_if $label11
          local.get $var2
          local.get $var1
          i32.store offset=16
          local.get $var1
          local.get $var2
          i32.store offset=24
        end $label11
        local.get $var0
        i32.load offset=20
        local.tee $var1
        i32.eqz
        br_if $label5
        local.get $var2
        local.get $var1
        i32.store offset=20
        local.get $var1
        local.get $var2
        i32.store offset=24
        return
      end $label5
      return
    end $label9
    i32.const 0
    i32.const 0
    i32.load offset=1051324
    i32.const -2
    local.get $var0
    i32.load offset=28
    i32.rotl
    i32.and
    i32.store offset=1051324
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17h95f8096f235724aeE (;19;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    local.get $var0
    local.get $var1
    i32.add
    local.set $var2
    block $label1
      block $label0
        local.get $var0
        i32.load offset=4
        local.tee $var3
        i32.const 1
        i32.and
        br_if $label0
        local.get $var3
        i32.const 2
        i32.and
        i32.eqz
        br_if $label1
        local.get $var0
        i32.load
        local.tee $var3
        local.get $var1
        i32.add
        local.set $var1
        block $label2
          local.get $var0
          local.get $var3
          i32.sub
          local.tee $var0
          i32.const 0
          i32.load offset=1051336
          i32.ne
          br_if $label2
          local.get $var2
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if $label0
          i32.const 0
          local.get $var1
          i32.store offset=1051328
          local.get $var2
          local.get $var2
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get $var0
          local.get $var1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var2
          local.get $var1
          i32.store
          br $label1
        end $label2
        local.get $var0
        local.get $var3
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E
      end $label0
      block $label5
        block $label4
          block $label6
            block $label3
              local.get $var2
              i32.load offset=4
              local.tee $var3
              i32.const 2
              i32.and
              br_if $label3
              local.get $var2
              i32.const 0
              i32.load offset=1051340
              i32.eq
              br_if $label4
              local.get $var2
              i32.const 0
              i32.load offset=1051336
              i32.eq
              br_if $label5
              local.get $var2
              local.get $var3
              i32.const -8
              i32.and
              local.tee $var3
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E
              local.get $var0
              local.get $var3
              local.get $var1
              i32.add
              local.tee $var1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var1
              i32.add
              local.get $var1
              i32.store
              local.get $var0
              i32.const 0
              i32.load offset=1051336
              i32.ne
              br_if $label6
              i32.const 0
              local.get $var1
              i32.store offset=1051328
              return
            end $label3
            local.get $var2
            local.get $var3
            i32.const -2
            i32.and
            i32.store offset=4
            local.get $var0
            local.get $var1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get $var0
            local.get $var1
            i32.add
            local.get $var1
            i32.store
          end $label6
          block $label7
            local.get $var1
            i32.const 256
            i32.lt_u
            br_if $label7
            local.get $var0
            local.get $var1
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E
            return
          end $label7
          block $label9
            block $label8
              i32.const 0
              i32.load offset=1051320
              local.tee $var2
              i32.const 1
              local.get $var1
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee $var3
              i32.and
              br_if $label8
              i32.const 0
              local.get $var2
              local.get $var3
              i32.or
              i32.store offset=1051320
              local.get $var1
              i32.const 248
              i32.and
              i32.const 1051056
              i32.add
              local.tee $var1
              local.set $var2
              br $label9
            end $label8
            local.get $var1
            i32.const 248
            i32.and
            local.tee $var2
            i32.const 1051056
            i32.add
            local.set $var1
            local.get $var2
            i32.const 1051064
            i32.add
            i32.load
            local.set $var2
          end $label9
          local.get $var1
          local.get $var0
          i32.store offset=8
          local.get $var2
          local.get $var0
          i32.store offset=12
          local.get $var0
          local.get $var1
          i32.store offset=12
          local.get $var0
          local.get $var2
          i32.store offset=8
          return
        end $label4
        i32.const 0
        local.get $var0
        i32.store offset=1051340
        i32.const 0
        i32.const 0
        i32.load offset=1051332
        local.get $var1
        i32.add
        local.tee $var1
        i32.store offset=1051332
        local.get $var0
        local.get $var1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get $var0
        i32.const 0
        i32.load offset=1051336
        i32.ne
        br_if $label1
        i32.const 0
        i32.const 0
        i32.store offset=1051328
        i32.const 0
        i32.const 0
        i32.store offset=1051336
        return
      end $label5
      i32.const 0
      local.get $var0
      i32.store offset=1051336
      i32.const 0
      i32.const 0
      i32.load offset=1051328
      local.get $var1
      i32.add
      local.tee $var1
      i32.store offset=1051328
      local.get $var0
      local.get $var1
      i32.const 1
      i32.or
      i32.store offset=4
      local.get $var0
      local.get $var1
      i32.add
      local.get $var1
      i32.store
      return
    end $label1
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE (;20;) (param $var0 i32) (result i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i64)
    block $label28
      block $label2
        block $label0
          local.get $var0
          i32.const 244
          i32.gt_u
          br_if $label0
          block $label9
            block $label13
              block $label3
                block $label1
                  i32.const 0
                  i32.load offset=1051320
                  local.tee $var1
                  i32.const 16
                  local.get $var0
                  i32.const 11
                  i32.add
                  i32.const 504
                  i32.and
                  local.get $var0
                  i32.const 11
                  i32.lt_u
                  select
                  local.tee $var2
                  i32.const 3
                  i32.shr_u
                  local.tee $var3
                  i32.shr_u
                  local.tee $var0
                  i32.const 3
                  i32.and
                  br_if $label1
                  local.get $var2
                  i32.const 0
                  i32.load offset=1051328
                  i32.le_u
                  br_if $label2
                  local.get $var0
                  br_if $label3
                  i32.const 0
                  i32.load offset=1051324
                  local.tee $var0
                  i32.eqz
                  br_if $label2
                  local.get $var0
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.const 1050912
                  i32.add
                  i32.load
                  local.tee $var4
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get $var2
                  i32.sub
                  local.set $var3
                  local.get $var4
                  local.set $var1
                  loop $label15
                    block $label4
                      local.get $var4
                      i32.load offset=16
                      local.tee $var0
                      br_if $label4
                      local.get $var4
                      i32.load offset=20
                      local.tee $var0
                      br_if $label4
                      local.get $var1
                      i32.load offset=24
                      local.set $var5
                      block $label7
                        block $label6
                          block $label5
                            local.get $var1
                            i32.load offset=12
                            local.tee $var0
                            local.get $var1
                            i32.ne
                            br_if $label5
                            local.get $var1
                            i32.const 20
                            i32.const 16
                            local.get $var1
                            i32.load offset=20
                            local.tee $var0
                            select
                            i32.add
                            i32.load
                            local.tee $var4
                            br_if $label6
                            i32.const 0
                            local.set $var0
                            br $label7
                          end $label5
                          local.get $var1
                          i32.load offset=8
                          local.tee $var4
                          local.get $var0
                          i32.store offset=12
                          local.get $var0
                          local.get $var4
                          i32.store offset=8
                          br $label7
                        end $label6
                        local.get $var1
                        i32.const 20
                        i32.add
                        local.get $var1
                        i32.const 16
                        i32.add
                        local.get $var0
                        select
                        local.set $var6
                        loop $label8
                          local.get $var6
                          local.set $var7
                          local.get $var4
                          local.tee $var0
                          i32.const 20
                          i32.add
                          local.get $var0
                          i32.const 16
                          i32.add
                          local.get $var0
                          i32.load offset=20
                          local.tee $var4
                          select
                          local.set $var6
                          local.get $var0
                          i32.const 20
                          i32.const 16
                          local.get $var4
                          select
                          i32.add
                          i32.load
                          local.tee $var4
                          br_if $label8
                        end $label8
                        local.get $var7
                        i32.const 0
                        i32.store
                      end $label7
                      local.get $var5
                      i32.eqz
                      br_if $label9
                      block $label12
                        block $label10
                          local.get $var1
                          local.get $var1
                          i32.load offset=28
                          i32.const 2
                          i32.shl
                          i32.const 1050912
                          i32.add
                          local.tee $var4
                          i32.load
                          i32.eq
                          br_if $label10
                          block $label11
                            local.get $var5
                            i32.load offset=16
                            local.get $var1
                            i32.eq
                            br_if $label11
                            local.get $var5
                            local.get $var0
                            i32.store offset=20
                            local.get $var0
                            br_if $label12
                            br $label9
                          end $label11
                          local.get $var5
                          local.get $var0
                          i32.store offset=16
                          local.get $var0
                          br_if $label12
                          br $label9
                        end $label10
                        local.get $var4
                        local.get $var0
                        i32.store
                        local.get $var0
                        i32.eqz
                        br_if $label13
                      end $label12
                      local.get $var0
                      local.get $var5
                      i32.store offset=24
                      block $label14
                        local.get $var1
                        i32.load offset=16
                        local.tee $var4
                        i32.eqz
                        br_if $label14
                        local.get $var0
                        local.get $var4
                        i32.store offset=16
                        local.get $var4
                        local.get $var0
                        i32.store offset=24
                      end $label14
                      local.get $var1
                      i32.load offset=20
                      local.tee $var4
                      i32.eqz
                      br_if $label9
                      local.get $var0
                      local.get $var4
                      i32.store offset=20
                      local.get $var4
                      local.get $var0
                      i32.store offset=24
                      br $label9
                    end $label4
                    local.get $var0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get $var2
                    i32.sub
                    local.tee $var4
                    local.get $var3
                    local.get $var4
                    local.get $var3
                    i32.lt_u
                    local.tee $var4
                    select
                    local.set $var3
                    local.get $var0
                    local.get $var1
                    local.get $var4
                    select
                    local.set $var1
                    local.get $var0
                    local.set $var4
                    br $label15
                  end $label15
                end $label1
                block $label17
                  block $label16
                    local.get $var0
                    i32.const -1
                    i32.xor
                    i32.const 1
                    i32.and
                    local.get $var3
                    i32.add
                    local.tee $var6
                    i32.const 3
                    i32.shl
                    local.tee $var0
                    i32.const 1051056
                    i32.add
                    local.tee $var2
                    local.get $var0
                    i32.const 1051064
                    i32.add
                    i32.load
                    local.tee $var3
                    i32.load offset=8
                    local.tee $var4
                    i32.eq
                    br_if $label16
                    local.get $var4
                    local.get $var2
                    i32.store offset=12
                    local.get $var2
                    local.get $var4
                    i32.store offset=8
                    br $label17
                  end $label16
                  i32.const 0
                  local.get $var1
                  i32.const -2
                  local.get $var6
                  i32.rotl
                  i32.and
                  i32.store offset=1051320
                end $label17
                local.get $var3
                local.get $var0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get $var3
                local.get $var0
                i32.add
                local.tee $var0
                local.get $var0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $var3
                i32.const 8
                i32.add
                return
              end $label3
              block $label19
                block $label18
                  local.get $var0
                  local.get $var3
                  i32.shl
                  i32.const 2
                  local.get $var3
                  i32.shl
                  local.tee $var0
                  i32.const 0
                  local.get $var0
                  i32.sub
                  i32.or
                  i32.and
                  i32.ctz
                  local.tee $var7
                  i32.const 3
                  i32.shl
                  local.tee $var3
                  i32.const 1051056
                  i32.add
                  local.tee $var4
                  local.get $var3
                  i32.const 1051064
                  i32.add
                  i32.load
                  local.tee $var0
                  i32.load offset=8
                  local.tee $var6
                  i32.eq
                  br_if $label18
                  local.get $var6
                  local.get $var4
                  i32.store offset=12
                  local.get $var4
                  local.get $var6
                  i32.store offset=8
                  br $label19
                end $label18
                i32.const 0
                local.get $var1
                i32.const -2
                local.get $var7
                i32.rotl
                i32.and
                i32.store offset=1051320
              end $label19
              local.get $var0
              local.get $var2
              i32.const 3
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var2
              i32.add
              local.tee $var1
              local.get $var3
              local.get $var2
              i32.sub
              local.tee $var2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var3
              i32.add
              local.get $var2
              i32.store
              block $label20
                i32.const 0
                i32.load offset=1051328
                local.tee $var4
                i32.eqz
                br_if $label20
                i32.const 0
                i32.load offset=1051336
                local.set $var3
                block $label22
                  block $label21
                    i32.const 0
                    i32.load offset=1051320
                    local.tee $var6
                    i32.const 1
                    local.get $var4
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee $var7
                    i32.and
                    br_if $label21
                    i32.const 0
                    local.get $var6
                    local.get $var7
                    i32.or
                    i32.store offset=1051320
                    local.get $var4
                    i32.const -8
                    i32.and
                    i32.const 1051056
                    i32.add
                    local.tee $var4
                    local.set $var6
                    br $label22
                  end $label21
                  local.get $var4
                  i32.const -8
                  i32.and
                  local.tee $var6
                  i32.const 1051056
                  i32.add
                  local.set $var4
                  local.get $var6
                  i32.const 1051064
                  i32.add
                  i32.load
                  local.set $var6
                end $label22
                local.get $var4
                local.get $var3
                i32.store offset=8
                local.get $var6
                local.get $var3
                i32.store offset=12
                local.get $var3
                local.get $var4
                i32.store offset=12
                local.get $var3
                local.get $var6
                i32.store offset=8
              end $label20
              i32.const 0
              local.get $var1
              i32.store offset=1051336
              i32.const 0
              local.get $var2
              i32.store offset=1051328
              local.get $var0
              i32.const 8
              i32.add
              return
            end $label13
            i32.const 0
            i32.const 0
            i32.load offset=1051324
            i32.const -2
            local.get $var1
            i32.load offset=28
            i32.rotl
            i32.and
            i32.store offset=1051324
          end $label9
          block $label27
            block $label24
              block $label23
                local.get $var3
                i32.const 16
                i32.lt_u
                br_if $label23
                local.get $var1
                local.get $var2
                i32.const 3
                i32.or
                i32.store offset=4
                local.get $var1
                local.get $var2
                i32.add
                local.tee $var4
                local.get $var3
                i32.const 1
                i32.or
                i32.store offset=4
                local.get $var4
                local.get $var3
                i32.add
                local.get $var3
                i32.store
                i32.const 0
                i32.load offset=1051328
                local.tee $var6
                i32.eqz
                br_if $label24
                i32.const 0
                i32.load offset=1051336
                local.set $var0
                block $label26
                  block $label25
                    i32.const 0
                    i32.load offset=1051320
                    local.tee $var7
                    i32.const 1
                    local.get $var6
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee $var5
                    i32.and
                    br_if $label25
                    i32.const 0
                    local.get $var7
                    local.get $var5
                    i32.or
                    i32.store offset=1051320
                    local.get $var6
                    i32.const -8
                    i32.and
                    i32.const 1051056
                    i32.add
                    local.tee $var6
                    local.set $var7
                    br $label26
                  end $label25
                  local.get $var6
                  i32.const -8
                  i32.and
                  local.tee $var7
                  i32.const 1051056
                  i32.add
                  local.set $var6
                  local.get $var7
                  i32.const 1051064
                  i32.add
                  i32.load
                  local.set $var7
                end $label26
                local.get $var6
                local.get $var0
                i32.store offset=8
                local.get $var7
                local.get $var0
                i32.store offset=12
                local.get $var0
                local.get $var6
                i32.store offset=12
                local.get $var0
                local.get $var7
                i32.store offset=8
                br $label24
              end $label23
              local.get $var1
              local.get $var3
              local.get $var2
              i32.add
              local.tee $var0
              i32.const 3
              i32.or
              i32.store offset=4
              local.get $var1
              local.get $var0
              i32.add
              local.tee $var0
              local.get $var0
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              br $label27
            end $label24
            i32.const 0
            local.get $var4
            i32.store offset=1051336
            i32.const 0
            local.get $var3
            i32.store offset=1051328
          end $label27
          local.get $var1
          i32.const 8
          i32.add
          local.tee $var0
          i32.eqz
          br_if $label2
          br $label28
        end $label0
        local.get $var0
        i32.const 11
        i32.add
        local.tee $var3
        i32.const -8
        i32.and
        local.set $var2
        i32.const 0
        i32.load offset=1051324
        local.tee $var8
        i32.eqz
        br_if $label2
        i32.const 31
        local.set $var5
        block $label29
          local.get $var0
          i32.const 16777204
          i32.gt_u
          br_if $label29
          local.get $var2
          i32.const 38
          local.get $var3
          i32.const 8
          i32.shr_u
          i32.clz
          local.tee $var0
          i32.sub
          i32.shr_u
          i32.const 1
          i32.and
          local.get $var0
          i32.const 1
          i32.shl
          i32.sub
          i32.const 62
          i32.add
          local.set $var5
        end $label29
        i32.const 0
        local.get $var2
        i32.sub
        local.set $var3
        block $label36
          block $label33
            block $label31
              block $label30
                local.get $var5
                i32.const 2
                i32.shl
                i32.const 1050912
                i32.add
                i32.load
                local.tee $var1
                br_if $label30
                i32.const 0
                local.set $var0
                i32.const 0
                local.set $var4
                br $label31
              end $label30
              i32.const 0
              local.set $var0
              local.get $var2
              i32.const 0
              i32.const 25
              local.get $var5
              i32.const 1
              i32.shr_u
              i32.sub
              local.get $var5
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set $var6
              i32.const 0
              local.set $var4
              loop $label34
                block $label32
                  local.get $var1
                  local.tee $var1
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.tee $var7
                  local.get $var2
                  i32.lt_u
                  br_if $label32
                  local.get $var7
                  local.get $var2
                  i32.sub
                  local.tee $var7
                  local.get $var3
                  i32.ge_u
                  br_if $label32
                  local.get $var7
                  local.set $var3
                  local.get $var1
                  local.set $var4
                  local.get $var7
                  br_if $label32
                  i32.const 0
                  local.set $var3
                  local.get $var1
                  local.set $var4
                  local.get $var1
                  local.set $var0
                  br $label33
                end $label32
                local.get $var1
                i32.load offset=20
                local.tee $var7
                local.get $var0
                local.get $var7
                local.get $var1
                local.get $var6
                i32.const 29
                i32.shr_u
                i32.const 4
                i32.and
                i32.add
                i32.load offset=16
                local.tee $var1
                i32.ne
                select
                local.get $var0
                local.get $var7
                select
                local.set $var0
                local.get $var6
                i32.const 1
                i32.shl
                local.set $var6
                local.get $var1
                br_if $label34
              end $label34
            end $label31
            block $label35
              local.get $var0
              local.get $var4
              i32.or
              br_if $label35
              i32.const 0
              local.set $var4
              i32.const 2
              local.get $var5
              i32.shl
              local.tee $var0
              i32.const 0
              local.get $var0
              i32.sub
              i32.or
              local.get $var8
              i32.and
              local.tee $var0
              i32.eqz
              br_if $label2
              local.get $var0
              i32.ctz
              i32.const 2
              i32.shl
              i32.const 1050912
              i32.add
              i32.load
              local.set $var0
            end $label35
            local.get $var0
            i32.eqz
            br_if $label36
          end $label33
          loop $label38
            local.get $var0
            local.get $var4
            local.get $var0
            i32.load offset=4
            i32.const -8
            i32.and
            local.tee $var1
            local.get $var2
            i32.sub
            local.tee $var7
            local.get $var3
            i32.lt_u
            local.tee $var5
            select
            local.set $var8
            local.get $var1
            local.get $var2
            i32.lt_u
            local.set $var6
            local.get $var7
            local.get $var3
            local.get $var5
            select
            local.set $var7
            block $label37
              local.get $var0
              i32.load offset=16
              local.tee $var1
              br_if $label37
              local.get $var0
              i32.load offset=20
              local.set $var1
            end $label37
            local.get $var4
            local.get $var8
            local.get $var6
            select
            local.set $var4
            local.get $var3
            local.get $var7
            local.get $var6
            select
            local.set $var3
            local.get $var1
            local.set $var0
            local.get $var1
            br_if $label38
          end $label38
        end $label36
        local.get $var4
        i32.eqz
        br_if $label2
        block $label39
          i32.const 0
          i32.load offset=1051328
          local.tee $var0
          local.get $var2
          i32.lt_u
          br_if $label39
          local.get $var3
          local.get $var0
          local.get $var2
          i32.sub
          i32.ge_u
          br_if $label2
        end $label39
        local.get $var4
        i32.load offset=24
        local.set $var5
        block $label42
          block $label41
            block $label40
              local.get $var4
              i32.load offset=12
              local.tee $var0
              local.get $var4
              i32.ne
              br_if $label40
              local.get $var4
              i32.const 20
              i32.const 16
              local.get $var4
              i32.load offset=20
              local.tee $var0
              select
              i32.add
              i32.load
              local.tee $var1
              br_if $label41
              i32.const 0
              local.set $var0
              br $label42
            end $label40
            local.get $var4
            i32.load offset=8
            local.tee $var1
            local.get $var0
            i32.store offset=12
            local.get $var0
            local.get $var1
            i32.store offset=8
            br $label42
          end $label41
          local.get $var4
          i32.const 20
          i32.add
          local.get $var4
          i32.const 16
          i32.add
          local.get $var0
          select
          local.set $var6
          loop $label43
            local.get $var6
            local.set $var7
            local.get $var1
            local.tee $var0
            i32.const 20
            i32.add
            local.get $var0
            i32.const 16
            i32.add
            local.get $var0
            i32.load offset=20
            local.tee $var1
            select
            local.set $var6
            local.get $var0
            i32.const 20
            i32.const 16
            local.get $var1
            select
            i32.add
            i32.load
            local.tee $var1
            br_if $label43
          end $label43
          local.get $var7
          i32.const 0
          i32.store
        end $label42
        block $label44
          local.get $var5
          i32.eqz
          br_if $label44
          block $label48
            block $label47
              block $label45
                local.get $var4
                local.get $var4
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1050912
                i32.add
                local.tee $var1
                i32.load
                i32.eq
                br_if $label45
                block $label46
                  local.get $var5
                  i32.load offset=16
                  local.get $var4
                  i32.eq
                  br_if $label46
                  local.get $var5
                  local.get $var0
                  i32.store offset=20
                  local.get $var0
                  br_if $label47
                  br $label44
                end $label46
                local.get $var5
                local.get $var0
                i32.store offset=16
                local.get $var0
                br_if $label47
                br $label44
              end $label45
              local.get $var1
              local.get $var0
              i32.store
              local.get $var0
              i32.eqz
              br_if $label48
            end $label47
            local.get $var0
            local.get $var5
            i32.store offset=24
            block $label49
              local.get $var4
              i32.load offset=16
              local.tee $var1
              i32.eqz
              br_if $label49
              local.get $var0
              local.get $var1
              i32.store offset=16
              local.get $var1
              local.get $var0
              i32.store offset=24
            end $label49
            local.get $var4
            i32.load offset=20
            local.tee $var1
            i32.eqz
            br_if $label44
            local.get $var0
            local.get $var1
            i32.store offset=20
            local.get $var1
            local.get $var0
            i32.store offset=24
            br $label44
          end $label48
          i32.const 0
          i32.const 0
          i32.load offset=1051324
          i32.const -2
          local.get $var4
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1051324
        end $label44
        block $label52
          block $label50
            local.get $var3
            i32.const 16
            i32.lt_u
            br_if $label50
            local.get $var4
            local.get $var2
            i32.const 3
            i32.or
            i32.store offset=4
            local.get $var4
            local.get $var2
            i32.add
            local.tee $var0
            local.get $var3
            i32.const 1
            i32.or
            i32.store offset=4
            local.get $var0
            local.get $var3
            i32.add
            local.get $var3
            i32.store
            block $label51
              local.get $var3
              i32.const 256
              i32.lt_u
              br_if $label51
              local.get $var0
              local.get $var3
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E
              br $label52
            end $label51
            block $label54
              block $label53
                i32.const 0
                i32.load offset=1051320
                local.tee $var1
                i32.const 1
                local.get $var3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee $var6
                i32.and
                br_if $label53
                i32.const 0
                local.get $var1
                local.get $var6
                i32.or
                i32.store offset=1051320
                local.get $var3
                i32.const 248
                i32.and
                i32.const 1051056
                i32.add
                local.tee $var3
                local.set $var1
                br $label54
              end $label53
              local.get $var3
              i32.const 248
              i32.and
              local.tee $var1
              i32.const 1051056
              i32.add
              local.set $var3
              local.get $var1
              i32.const 1051064
              i32.add
              i32.load
              local.set $var1
            end $label54
            local.get $var3
            local.get $var0
            i32.store offset=8
            local.get $var1
            local.get $var0
            i32.store offset=12
            local.get $var0
            local.get $var3
            i32.store offset=12
            local.get $var0
            local.get $var1
            i32.store offset=8
            br $label52
          end $label50
          local.get $var4
          local.get $var3
          local.get $var2
          i32.add
          local.tee $var0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get $var4
          local.get $var0
          i32.add
          local.tee $var0
          local.get $var0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
        end $label52
        local.get $var4
        i32.const 8
        i32.add
        local.tee $var0
        br_if $label28
      end $label2
      block $label64
        block $label81
          block $label78
            block $label77
              block $label65
                block $label55
                  i32.const 0
                  i32.load offset=1051328
                  local.tee $var0
                  local.get $var2
                  i32.ge_u
                  br_if $label55
                  block $label56
                    i32.const 0
                    i32.load offset=1051332
                    local.tee $var0
                    local.get $var2
                    i32.gt_u
                    br_if $label56
                    block $label57
                      local.get $var2
                      i32.const 65583
                      i32.add
                      local.tee $var4
                      i32.const 16
                      i32.shr_u
                      memory.grow
                      local.tee $var3
                      i32.const -1
                      i32.ne
                      br_if $label57
                      i32.const 0
                      return
                    end $label57
                    i32.const 0
                    local.set $var0
                    local.get $var3
                    i32.const 16
                    i32.shl
                    local.tee $var1
                    i32.eqz
                    br_if $label28
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051344
                    local.get $var4
                    i32.const -65536
                    i32.and
                    local.tee $var0
                    i32.const -16
                    i32.add
                    local.get $var0
                    local.get $var1
                    i32.const 0
                    local.get $var0
                    i32.sub
                    i32.eq
                    select
                    local.tee $var7
                    i32.add
                    local.tee $var0
                    i32.store offset=1051344
                    i32.const 0
                    local.get $var0
                    i32.const 0
                    i32.load offset=1051348
                    local.tee $var3
                    local.get $var0
                    local.get $var3
                    i32.gt_u
                    select
                    i32.store offset=1051348
                    block $label61
                      block $label59
                        block $label58
                          i32.const 0
                          i32.load offset=1051340
                          local.tee $var3
                          i32.eqz
                          br_if $label58
                          i32.const 1051040
                          local.set $var0
                          loop $label60
                            local.get $var0
                            i32.load
                            local.tee $var4
                            local.get $var0
                            i32.load offset=4
                            local.tee $var6
                            i32.add
                            local.get $var1
                            i32.eq
                            br_if $label59
                            local.get $var0
                            i32.load offset=8
                            local.tee $var0
                            br_if $label60
                            br $label61
                          end $label60
                        end $label58
                        block $label63
                          block $label62
                            i32.const 0
                            i32.load offset=1051356
                            local.tee $var0
                            i32.eqz
                            br_if $label62
                            local.get $var0
                            local.get $var1
                            i32.le_u
                            br_if $label63
                          end $label62
                          i32.const 0
                          local.get $var1
                          i32.store offset=1051356
                        end $label63
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1051360
                        i32.const 0
                        local.get $var7
                        i32.store offset=1051044
                        i32.const 0
                        local.get $var1
                        i32.store offset=1051040
                        i32.const 0
                        i32.const 1051056
                        i32.store offset=1051068
                        i32.const 0
                        i32.const 1051064
                        i32.store offset=1051076
                        i32.const 0
                        i32.const 1051056
                        i32.store offset=1051064
                        i32.const 0
                        i32.const 1051072
                        i32.store offset=1051084
                        i32.const 0
                        i32.const 1051064
                        i32.store offset=1051072
                        i32.const 0
                        i32.const 1051080
                        i32.store offset=1051092
                        i32.const 0
                        i32.const 1051072
                        i32.store offset=1051080
                        i32.const 0
                        i32.const 1051088
                        i32.store offset=1051100
                        i32.const 0
                        i32.const 1051080
                        i32.store offset=1051088
                        i32.const 0
                        i32.const 1051096
                        i32.store offset=1051108
                        i32.const 0
                        i32.const 1051088
                        i32.store offset=1051096
                        i32.const 0
                        i32.const 1051104
                        i32.store offset=1051116
                        i32.const 0
                        i32.const 1051096
                        i32.store offset=1051104
                        i32.const 0
                        i32.const 1051112
                        i32.store offset=1051124
                        i32.const 0
                        i32.const 1051104
                        i32.store offset=1051112
                        i32.const 0
                        i32.const 0
                        i32.store offset=1051052
                        i32.const 0
                        i32.const 1051120
                        i32.store offset=1051132
                        i32.const 0
                        i32.const 1051112
                        i32.store offset=1051120
                        i32.const 0
                        i32.const 1051120
                        i32.store offset=1051128
                        i32.const 0
                        i32.const 1051128
                        i32.store offset=1051140
                        i32.const 0
                        i32.const 1051128
                        i32.store offset=1051136
                        i32.const 0
                        i32.const 1051136
                        i32.store offset=1051148
                        i32.const 0
                        i32.const 1051136
                        i32.store offset=1051144
                        i32.const 0
                        i32.const 1051144
                        i32.store offset=1051156
                        i32.const 0
                        i32.const 1051144
                        i32.store offset=1051152
                        i32.const 0
                        i32.const 1051152
                        i32.store offset=1051164
                        i32.const 0
                        i32.const 1051152
                        i32.store offset=1051160
                        i32.const 0
                        i32.const 1051160
                        i32.store offset=1051172
                        i32.const 0
                        i32.const 1051160
                        i32.store offset=1051168
                        i32.const 0
                        i32.const 1051168
                        i32.store offset=1051180
                        i32.const 0
                        i32.const 1051168
                        i32.store offset=1051176
                        i32.const 0
                        i32.const 1051176
                        i32.store offset=1051188
                        i32.const 0
                        i32.const 1051176
                        i32.store offset=1051184
                        i32.const 0
                        i32.const 1051184
                        i32.store offset=1051196
                        i32.const 0
                        i32.const 1051192
                        i32.store offset=1051204
                        i32.const 0
                        i32.const 1051184
                        i32.store offset=1051192
                        i32.const 0
                        i32.const 1051200
                        i32.store offset=1051212
                        i32.const 0
                        i32.const 1051192
                        i32.store offset=1051200
                        i32.const 0
                        i32.const 1051208
                        i32.store offset=1051220
                        i32.const 0
                        i32.const 1051200
                        i32.store offset=1051208
                        i32.const 0
                        i32.const 1051216
                        i32.store offset=1051228
                        i32.const 0
                        i32.const 1051208
                        i32.store offset=1051216
                        i32.const 0
                        i32.const 1051224
                        i32.store offset=1051236
                        i32.const 0
                        i32.const 1051216
                        i32.store offset=1051224
                        i32.const 0
                        i32.const 1051232
                        i32.store offset=1051244
                        i32.const 0
                        i32.const 1051224
                        i32.store offset=1051232
                        i32.const 0
                        i32.const 1051240
                        i32.store offset=1051252
                        i32.const 0
                        i32.const 1051232
                        i32.store offset=1051240
                        i32.const 0
                        i32.const 1051248
                        i32.store offset=1051260
                        i32.const 0
                        i32.const 1051240
                        i32.store offset=1051248
                        i32.const 0
                        i32.const 1051256
                        i32.store offset=1051268
                        i32.const 0
                        i32.const 1051248
                        i32.store offset=1051256
                        i32.const 0
                        i32.const 1051264
                        i32.store offset=1051276
                        i32.const 0
                        i32.const 1051256
                        i32.store offset=1051264
                        i32.const 0
                        i32.const 1051272
                        i32.store offset=1051284
                        i32.const 0
                        i32.const 1051264
                        i32.store offset=1051272
                        i32.const 0
                        i32.const 1051280
                        i32.store offset=1051292
                        i32.const 0
                        i32.const 1051272
                        i32.store offset=1051280
                        i32.const 0
                        i32.const 1051288
                        i32.store offset=1051300
                        i32.const 0
                        i32.const 1051280
                        i32.store offset=1051288
                        i32.const 0
                        i32.const 1051296
                        i32.store offset=1051308
                        i32.const 0
                        i32.const 1051288
                        i32.store offset=1051296
                        i32.const 0
                        i32.const 1051304
                        i32.store offset=1051316
                        i32.const 0
                        i32.const 1051296
                        i32.store offset=1051304
                        i32.const 0
                        local.get $var1
                        i32.store offset=1051340
                        i32.const 0
                        i32.const 1051304
                        i32.store offset=1051312
                        i32.const 0
                        local.get $var7
                        i32.const -40
                        i32.add
                        local.tee $var0
                        i32.store offset=1051332
                        local.get $var1
                        local.get $var0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get $var1
                        local.get $var0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 2097152
                        i32.store offset=1051352
                        br $label64
                      end $label59
                      local.get $var3
                      local.get $var1
                      i32.ge_u
                      br_if $label61
                      local.get $var4
                      local.get $var3
                      i32.gt_u
                      br_if $label61
                      local.get $var0
                      i32.load offset=12
                      i32.eqz
                      br_if $label65
                    end $label61
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051356
                    local.tee $var0
                    local.get $var1
                    local.get $var0
                    local.get $var1
                    i32.lt_u
                    select
                    i32.store offset=1051356
                    local.get $var1
                    local.get $var7
                    i32.add
                    local.set $var4
                    i32.const 1051040
                    local.set $var0
                    block $label69
                      block $label68
                        block $label66
                          loop $label67
                            local.get $var0
                            i32.load
                            local.tee $var6
                            local.get $var4
                            i32.eq
                            br_if $label66
                            local.get $var0
                            i32.load offset=8
                            local.tee $var0
                            br_if $label67
                            br $label68
                          end $label67
                        end $label66
                        local.get $var0
                        i32.load offset=12
                        i32.eqz
                        br_if $label69
                      end $label68
                      i32.const 1051040
                      local.set $var0
                      block $label71
                        loop $label72
                          block $label70
                            local.get $var0
                            i32.load
                            local.tee $var4
                            local.get $var3
                            i32.gt_u
                            br_if $label70
                            local.get $var3
                            local.get $var4
                            local.get $var0
                            i32.load offset=4
                            i32.add
                            local.tee $var4
                            i32.lt_u
                            br_if $label71
                          end $label70
                          local.get $var0
                          i32.load offset=8
                          local.set $var0
                          br $label72
                        end $label72
                      end $label71
                      i32.const 0
                      local.get $var1
                      i32.store offset=1051340
                      i32.const 0
                      local.get $var7
                      i32.const -40
                      i32.add
                      local.tee $var0
                      i32.store offset=1051332
                      local.get $var1
                      local.get $var0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var1
                      local.get $var0
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 0
                      i32.const 2097152
                      i32.store offset=1051352
                      local.get $var3
                      local.get $var4
                      i32.const -32
                      i32.add
                      i32.const -8
                      i32.and
                      i32.const -8
                      i32.add
                      local.tee $var0
                      local.get $var0
                      local.get $var3
                      i32.const 16
                      i32.add
                      i32.lt_u
                      select
                      local.tee $var6
                      i32.const 27
                      i32.store offset=4
                      i32.const 0
                      i64.load offset=1051040 align=4
                      local.set $var9
                      local.get $var6
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1051048 align=4
                      i64.store align=4
                      local.get $var6
                      i32.const 8
                      i32.add
                      local.tee $var0
                      local.get $var9
                      i64.store align=4
                      i32.const 0
                      local.get $var7
                      i32.store offset=1051044
                      i32.const 0
                      local.get $var1
                      i32.store offset=1051040
                      i32.const 0
                      local.get $var0
                      i32.store offset=1051048
                      i32.const 0
                      i32.const 0
                      i32.store offset=1051052
                      local.get $var6
                      i32.const 28
                      i32.add
                      local.set $var0
                      loop $label73
                        local.get $var0
                        i32.const 7
                        i32.store
                        local.get $var0
                        i32.const 4
                        i32.add
                        local.tee $var0
                        local.get $var4
                        i32.lt_u
                        br_if $label73
                      end $label73
                      local.get $var6
                      local.get $var3
                      i32.eq
                      br_if $label64
                      local.get $var6
                      local.get $var6
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get $var3
                      local.get $var6
                      local.get $var3
                      i32.sub
                      local.tee $var0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get $var6
                      local.get $var0
                      i32.store
                      block $label74
                        local.get $var0
                        i32.const 256
                        i32.lt_u
                        br_if $label74
                        local.get $var3
                        local.get $var0
                        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E
                        br $label64
                      end $label74
                      block $label76
                        block $label75
                          i32.const 0
                          i32.load offset=1051320
                          local.tee $var4
                          i32.const 1
                          local.get $var0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee $var1
                          i32.and
                          br_if $label75
                          i32.const 0
                          local.get $var4
                          local.get $var1
                          i32.or
                          i32.store offset=1051320
                          local.get $var0
                          i32.const 248
                          i32.and
                          i32.const 1051056
                          i32.add
                          local.tee $var0
                          local.set $var4
                          br $label76
                        end $label75
                        local.get $var0
                        i32.const 248
                        i32.and
                        local.tee $var4
                        i32.const 1051056
                        i32.add
                        local.set $var0
                        local.get $var4
                        i32.const 1051064
                        i32.add
                        i32.load
                        local.set $var4
                      end $label76
                      local.get $var0
                      local.get $var3
                      i32.store offset=8
                      local.get $var4
                      local.get $var3
                      i32.store offset=12
                      local.get $var3
                      local.get $var0
                      i32.store offset=12
                      local.get $var3
                      local.get $var4
                      i32.store offset=8
                      br $label64
                    end $label69
                    local.get $var0
                    local.get $var1
                    i32.store
                    local.get $var0
                    local.get $var0
                    i32.load offset=4
                    local.get $var7
                    i32.add
                    i32.store offset=4
                    local.get $var1
                    local.get $var2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $var6
                    i32.const 15
                    i32.add
                    i32.const -8
                    i32.and
                    i32.const -8
                    i32.add
                    local.tee $var4
                    local.get $var1
                    local.get $var2
                    i32.add
                    local.tee $var0
                    i32.sub
                    local.set $var3
                    local.get $var4
                    i32.const 0
                    i32.load offset=1051340
                    i32.eq
                    br_if $label77
                    local.get $var4
                    i32.const 0
                    i32.load offset=1051336
                    i32.eq
                    br_if $label78
                    block $label79
                      local.get $var4
                      i32.load offset=4
                      local.tee $var2
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.ne
                      br_if $label79
                      local.get $var4
                      local.get $var2
                      i32.const -8
                      i32.and
                      local.tee $var2
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17hea1d09e1f6da5f53E
                      local.get $var2
                      local.get $var3
                      i32.add
                      local.set $var3
                      local.get $var4
                      local.get $var2
                      i32.add
                      local.tee $var4
                      i32.load offset=4
                      local.set $var2
                    end $label79
                    local.get $var4
                    local.get $var2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get $var0
                    local.get $var3
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get $var0
                    local.get $var3
                    i32.add
                    local.get $var3
                    i32.store
                    block $label80
                      local.get $var3
                      i32.const 256
                      i32.lt_u
                      br_if $label80
                      local.get $var0
                      local.get $var3
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E
                      br $label81
                    end $label80
                    block $label83
                      block $label82
                        i32.const 0
                        i32.load offset=1051320
                        local.tee $var2
                        i32.const 1
                        local.get $var3
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee $var4
                        i32.and
                        br_if $label82
                        i32.const 0
                        local.get $var2
                        local.get $var4
                        i32.or
                        i32.store offset=1051320
                        local.get $var3
                        i32.const 248
                        i32.and
                        i32.const 1051056
                        i32.add
                        local.tee $var3
                        local.set $var2
                        br $label83
                      end $label82
                      local.get $var3
                      i32.const 248
                      i32.and
                      local.tee $var2
                      i32.const 1051056
                      i32.add
                      local.set $var3
                      local.get $var2
                      i32.const 1051064
                      i32.add
                      i32.load
                      local.set $var2
                    end $label83
                    local.get $var3
                    local.get $var0
                    i32.store offset=8
                    local.get $var2
                    local.get $var0
                    i32.store offset=12
                    local.get $var0
                    local.get $var3
                    i32.store offset=12
                    local.get $var0
                    local.get $var2
                    i32.store offset=8
                    br $label81
                  end $label56
                  i32.const 0
                  local.get $var0
                  local.get $var2
                  i32.sub
                  local.tee $var3
                  i32.store offset=1051332
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051340
                  local.tee $var0
                  local.get $var2
                  i32.add
                  local.tee $var4
                  i32.store offset=1051340
                  local.get $var4
                  local.get $var3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var0
                  local.get $var2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get $var0
                  i32.const 8
                  i32.add
                  local.set $var0
                  br $label28
                end $label55
                i32.const 0
                i32.load offset=1051336
                local.set $var3
                block $label85
                  block $label84
                    local.get $var0
                    local.get $var2
                    i32.sub
                    local.tee $var4
                    i32.const 15
                    i32.gt_u
                    br_if $label84
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051336
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051328
                    local.get $var3
                    local.get $var0
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get $var3
                    local.get $var0
                    i32.add
                    local.tee $var0
                    local.get $var0
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br $label85
                  end $label84
                  i32.const 0
                  local.get $var4
                  i32.store offset=1051328
                  i32.const 0
                  local.get $var3
                  local.get $var2
                  i32.add
                  local.tee $var1
                  i32.store offset=1051336
                  local.get $var1
                  local.get $var4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get $var3
                  local.get $var0
                  i32.add
                  local.get $var4
                  i32.store
                  local.get $var3
                  local.get $var2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                end $label85
                local.get $var3
                i32.const 8
                i32.add
                return
              end $label65
              local.get $var0
              local.get $var6
              local.get $var7
              i32.add
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=1051340
              local.tee $var0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee $var3
              i32.const -8
              i32.add
              local.tee $var4
              i32.store offset=1051340
              i32.const 0
              local.get $var0
              local.get $var3
              i32.sub
              i32.const 0
              i32.load offset=1051332
              local.get $var7
              i32.add
              local.tee $var3
              i32.add
              i32.const 8
              i32.add
              local.tee $var1
              i32.store offset=1051332
              local.get $var4
              local.get $var1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get $var0
              local.get $var3
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 0
              i32.const 2097152
              i32.store offset=1051352
              br $label64
            end $label77
            i32.const 0
            local.get $var0
            i32.store offset=1051340
            i32.const 0
            i32.const 0
            i32.load offset=1051332
            local.get $var3
            i32.add
            local.tee $var3
            i32.store offset=1051332
            local.get $var0
            local.get $var3
            i32.const 1
            i32.or
            i32.store offset=4
            br $label81
          end $label78
          i32.const 0
          local.get $var0
          i32.store offset=1051336
          i32.const 0
          i32.const 0
          i32.load offset=1051328
          local.get $var3
          i32.add
          local.tee $var3
          i32.store offset=1051328
          local.get $var0
          local.get $var3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get $var0
          local.get $var3
          i32.add
          local.get $var3
          i32.store
        end $label81
        local.get $var1
        i32.const 8
        i32.add
        return
      end $label64
      i32.const 0
      local.set $var0
      i32.const 0
      i32.load offset=1051332
      local.tee $var3
      local.get $var2
      i32.le_u
      br_if $label28
      i32.const 0
      local.get $var3
      local.get $var2
      i32.sub
      local.tee $var3
      i32.store offset=1051332
      i32.const 0
      i32.const 0
      i32.load offset=1051340
      local.tee $var0
      local.get $var2
      i32.add
      local.tee $var4
      i32.store offset=1051340
      local.get $var4
      local.get $var3
      i32.const 1
      i32.or
      i32.store offset=4
      local.get $var0
      local.get $var2
      i32.const 3
      i32.or
      i32.store offset=4
      local.get $var0
      i32.const 8
      i32.add
      return
    end $label28
    local.get $var0
  )
  (func $_ZN5alloc7raw_vec12handle_error17hc5314d3208d911b6E (;21;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    block $label0
      local.get $var0
      i32.eqz
      br_if $label0
      unreachable
    end $label0
    local.get $var2
    call $_ZN5alloc7raw_vec17capacity_overflow17h0ec5122e7c26b53fE
    unreachable
  )
  (func $_ZN5alloc7raw_vec17capacity_overflow17h0ec5122e7c26b53fE (;22;) (param $var0 i32)
    (local $var1 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var1
    i32.const 0
    i32.store offset=24
    local.get $var1
    i32.const 1
    i32.store offset=12
    local.get $var1
    i32.const 1048596
    i32.store offset=8
    local.get $var1
    i64.const 4
    i64.store offset=16 align=4
    local.get $var1
    i32.const 8
    i32.add
    local.get $var0
    call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
    unreachable
  )
  (func $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E (;23;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    local.get $var2
    i32.const 1
    i32.store16 offset=12
    local.get $var2
    local.get $var1
    i32.store offset=8
    local.get $var2
    local.get $var0
    i32.store offset=4
    local.get $var2
    i32.const 4
    i32.add
    call $_RNvCskK8ZSUeDzDN_7___rustc17rust_begin_unwind
    unreachable
  )
  (func $_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17hd76bafbaa8ace0a4E (;24;) (param $var0 i32) (param $var1 i32) (result i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    i32.const 10
    local.set $var3
    local.get $var0
    i32.load
    local.tee $var4
    local.set $var5
    block $label0
      local.get $var4
      i32.const 1000
      i32.lt_u
      br_if $label0
      i32.const 10
      local.set $var3
      local.get $var4
      local.set $var0
      loop $label1
        local.get $var2
        i32.const 6
        i32.add
        local.get $var3
        i32.add
        local.tee $var6
        i32.const -4
        i32.add
        local.get $var0
        local.get $var0
        i32.const 10000
        i32.div_u
        local.tee $var5
        i32.const 10000
        i32.mul
        i32.sub
        local.tee $var7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee $var8
        i32.const 1
        i32.shl
        i32.load16_u offset=1048613 align=1
        i32.store16 align=1
        local.get $var6
        i32.const -2
        i32.add
        local.get $var7
        local.get $var8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.load16_u offset=1048613 align=1
        i32.store16 align=1
        local.get $var3
        i32.const -4
        i32.add
        local.set $var3
        local.get $var0
        i32.const 9999999
        i32.gt_u
        local.set $var6
        local.get $var5
        local.set $var0
        local.get $var6
        br_if $label1
      end $label1
    end $label0
    block $label3
      block $label2
        local.get $var5
        i32.const 9
        i32.gt_u
        br_if $label2
        local.get $var5
        local.set $var0
        br $label3
      end $label2
      local.get $var2
      i32.const 6
      i32.add
      local.get $var3
      i32.const -2
      i32.add
      local.tee $var3
      i32.add
      local.get $var5
      local.get $var5
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee $var0
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.load16_u offset=1048613 align=1
      i32.store16 align=1
    end $label3
    block $label5
      block $label4
        local.get $var4
        i32.eqz
        br_if $label4
        local.get $var0
        i32.eqz
        br_if $label5
      end $label4
      local.get $var2
      i32.const 6
      i32.add
      local.get $var3
      i32.const -1
      i32.add
      local.tee $var3
      i32.add
      local.get $var0
      i32.const 1
      i32.shl
      i32.load8_u offset=1048614
      i32.store8
    end $label5
    i32.const 43
    i32.const 1114112
    local.get $var1
    i32.load offset=8
    local.tee $var5
    i32.const 2097152
    i32.and
    local.tee $var0
    select
    local.set $var4
    local.get $var5
    i32.const 8388608
    i32.and
    i32.const 23
    i32.shr_u
    local.set $var9
    local.get $var2
    i32.const 6
    i32.add
    local.get $var3
    i32.add
    local.set $var10
    block $label13
      block $label6
        local.get $var0
        i32.const 21
        i32.shr_u
        i32.const 10
        local.get $var3
        i32.sub
        local.tee $var11
        i32.add
        local.tee $var7
        local.get $var1
        i32.load16_u offset=12
        local.tee $var8
        i32.ge_u
        br_if $label6
        block $label14
          block $label11
            block $label7
              local.get $var5
              i32.const 16777216
              i32.and
              br_if $label7
              local.get $var8
              local.get $var7
              i32.sub
              local.set $var12
              i32.const 0
              local.set $var0
              i32.const 0
              local.set $var8
              block $label8
                block $label10
                  block $label9
                    local.get $var5
                    i32.const 29
                    i32.shr_u
                    i32.const 3
                    i32.and
                    br_table $label8 $label9 $label10 $label9 $label8
                  end $label9
                  local.get $var12
                  local.set $var8
                  br $label8
                end $label10
                local.get $var12
                i32.const 65534
                i32.and
                i32.const 1
                i32.shr_u
                local.set $var8
              end $label8
              local.get $var5
              i32.const 2097151
              i32.and
              local.set $var7
              local.get $var1
              i32.load offset=4
              local.set $var6
              local.get $var1
              i32.load
              local.set $var5
              loop $label12
                local.get $var0
                i32.const 65535
                i32.and
                local.get $var8
                i32.const 65535
                i32.and
                i32.ge_u
                br_if $label11
                i32.const 1
                local.set $var3
                local.get $var0
                i32.const 1
                i32.add
                local.set $var0
                local.get $var5
                local.get $var7
                local.get $var6
                i32.load offset=16
                call_indirect (param i32 i32) (result i32)
                i32.eqz
                br_if $label12
                br $label13
              end $label12
            end $label7
            local.get $var1
            local.get $var1
            i64.load offset=8 align=4
            local.tee $var13
            i32.wrap_i64
            i32.const -1612709888
            i32.and
            i32.const 536870960
            i32.or
            i32.store offset=8
            i32.const 1
            local.set $var3
            local.get $var1
            i32.load
            local.tee $var5
            local.get $var1
            i32.load offset=4
            local.tee $var6
            local.get $var4
            local.get $var9
            call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h658e263000386c8dE
            br_if $label13
            i32.const 0
            local.set $var0
            local.get $var8
            local.get $var7
            i32.sub
            i32.const 65535
            i32.and
            local.set $var7
            loop $label15
              local.get $var0
              i32.const 65535
              i32.and
              local.get $var7
              i32.ge_u
              br_if $label14
              i32.const 1
              local.set $var3
              local.get $var0
              i32.const 1
              i32.add
              local.set $var0
              local.get $var5
              i32.const 48
              local.get $var6
              i32.load offset=16
              call_indirect (param i32 i32) (result i32)
              i32.eqz
              br_if $label15
              br $label13
            end $label15
          end $label11
          i32.const 1
          local.set $var3
          local.get $var5
          local.get $var6
          local.get $var4
          local.get $var9
          call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h658e263000386c8dE
          br_if $label13
          local.get $var5
          local.get $var10
          local.get $var11
          local.get $var6
          i32.load offset=12
          call_indirect (param i32 i32 i32) (result i32)
          br_if $label13
          local.get $var12
          local.get $var8
          i32.sub
          i32.const 65535
          i32.and
          local.set $var8
          i32.const 0
          local.set $var0
          loop $label17
            block $label16
              local.get $var0
              i32.const 65535
              i32.and
              local.get $var8
              i32.lt_u
              br_if $label16
              i32.const 0
              local.set $var3
              br $label13
            end $label16
            i32.const 1
            local.set $var3
            local.get $var0
            i32.const 1
            i32.add
            local.set $var0
            local.get $var5
            local.get $var7
            local.get $var6
            i32.load offset=16
            call_indirect (param i32 i32) (result i32)
            i32.eqz
            br_if $label17
            br $label13
          end $label17
        end $label14
        i32.const 1
        local.set $var3
        local.get $var5
        local.get $var10
        local.get $var11
        local.get $var6
        i32.load offset=12
        call_indirect (param i32 i32 i32) (result i32)
        br_if $label13
        local.get $var1
        local.get $var13
        i64.store offset=8 align=4
        i32.const 0
        local.set $var3
        br $label13
      end $label6
      i32.const 1
      local.set $var3
      local.get $var1
      i32.load
      local.tee $var0
      local.get $var1
      i32.load offset=4
      local.tee $var5
      local.get $var4
      local.get $var9
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h658e263000386c8dE
      br_if $label13
      local.get $var0
      local.get $var10
      local.get $var11
      local.get $var5
      i32.load offset=12
      call_indirect (param i32 i32 i32) (result i32)
      local.set $var3
    end $label13
    local.get $var2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get $var3
  )
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h658e263000386c8dE (;25;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32) (result i32)
    block $label0
      local.get $var2
      i32.const 1114112
      i32.eq
      br_if $label0
      local.get $var0
      local.get $var2
      local.get $var1
      i32.load offset=16
      call_indirect (param i32 i32) (result i32)
      i32.eqz
      br_if $label0
      i32.const 1
      return
    end $label0
    block $label1
      local.get $var3
      br_if $label1
      i32.const 0
      return
    end $label1
    local.get $var0
    local.get $var3
    i32.const 0
    local.get $var1
    i32.load offset=12
    call_indirect (param i32 i32 i32) (result i32)
  )
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hc1cb133d2bb82eb9E (;26;) (param $var0 i32) (param $var1 i32) (result i32)
    local.get $var1
    local.get $var0
    i32.load
    local.get $var0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17hc9ee21a24ccd870cE
  )
  (func $_ZN4core3fmt9Formatter3pad17hc9ee21a24ccd870cE (;27;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    (local $var11 i32)
    (local $var12 i32)
    (local $var13 i32)
    block $label27
      block $label0
        local.get $var0
        i32.load offset=8
        local.tee $var3
        i32.const 402653184
        i32.and
        i32.eqz
        br_if $label0
        block $label9
          block $label17
            block $label3
              block $label2
                block $label1
                  local.get $var3
                  i32.const 268435456
                  i32.and
                  i32.eqz
                  br_if $label1
                  local.get $var0
                  i32.load16_u offset=14
                  local.tee $var4
                  br_if $label2
                  i32.const 0
                  local.set $var2
                  br $label3
                end $label1
                block $label4
                  local.get $var2
                  i32.const 16
                  i32.lt_u
                  br_if $label4
                  local.get $var2
                  local.get $var1
                  local.get $var1
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.tee $var5
                  i32.sub
                  local.tee $var6
                  i32.add
                  local.tee $var7
                  i32.const 3
                  i32.and
                  local.set $var8
                  i32.const 0
                  local.set $var9
                  i32.const 0
                  local.set $var4
                  block $label5
                    local.get $var1
                    local.get $var5
                    i32.eq
                    br_if $label5
                    i32.const 0
                    local.set $var4
                    local.get $var1
                    local.set $var10
                    loop $label6
                      local.get $var4
                      local.get $var10
                      i32.load8_s
                      i32.const -65
                      i32.gt_s
                      i32.add
                      local.set $var4
                      local.get $var10
                      i32.const 1
                      i32.add
                      local.set $var10
                      local.get $var6
                      i32.const 1
                      i32.add
                      local.tee $var6
                      br_if $label6
                    end $label6
                  end $label5
                  block $label7
                    local.get $var8
                    i32.eqz
                    br_if $label7
                    local.get $var5
                    local.get $var7
                    i32.const -4
                    i32.and
                    i32.add
                    local.set $var10
                    i32.const 0
                    local.set $var9
                    loop $label8
                      local.get $var9
                      local.get $var10
                      i32.load8_s
                      i32.const -65
                      i32.gt_s
                      i32.add
                      local.set $var9
                      local.get $var10
                      i32.const 1
                      i32.add
                      local.set $var10
                      local.get $var8
                      i32.const -1
                      i32.add
                      local.tee $var8
                      br_if $label8
                    end $label8
                  end $label7
                  local.get $var7
                  i32.const 2
                  i32.shr_u
                  local.set $var6
                  local.get $var9
                  local.get $var4
                  i32.add
                  local.set $var4
                  loop $label13
                    local.get $var5
                    local.set $var7
                    local.get $var6
                    i32.eqz
                    br_if $label9
                    local.get $var6
                    i32.const 192
                    local.get $var6
                    i32.const 192
                    i32.lt_u
                    select
                    local.tee $var11
                    i32.const 3
                    i32.and
                    local.set $var12
                    block $label11
                      block $label10
                        local.get $var11
                        i32.const 2
                        i32.shl
                        local.tee $var13
                        i32.const 1008
                        i32.and
                        local.tee $var10
                        br_if $label10
                        i32.const 0
                        local.set $var9
                        br $label11
                      end $label10
                      local.get $var7
                      local.get $var10
                      i32.add
                      local.set $var5
                      i32.const 0
                      local.set $var9
                      local.get $var7
                      local.set $var10
                      loop $label12
                        local.get $var10
                        i32.const 12
                        i32.add
                        i32.load
                        local.tee $var8
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get $var8
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get $var10
                        i32.const 8
                        i32.add
                        i32.load
                        local.tee $var8
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get $var8
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get $var10
                        i32.const 4
                        i32.add
                        i32.load
                        local.tee $var8
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get $var8
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get $var10
                        i32.load
                        local.tee $var8
                        i32.const -1
                        i32.xor
                        i32.const 7
                        i32.shr_u
                        local.get $var8
                        i32.const 6
                        i32.shr_u
                        i32.or
                        i32.const 16843009
                        i32.and
                        local.get $var9
                        i32.add
                        i32.add
                        i32.add
                        i32.add
                        local.set $var9
                        local.get $var10
                        i32.const 16
                        i32.add
                        local.tee $var10
                        local.get $var5
                        i32.ne
                        br_if $label12
                      end $label12
                    end $label11
                    local.get $var6
                    local.get $var11
                    i32.sub
                    local.set $var6
                    local.get $var7
                    local.get $var13
                    i32.add
                    local.set $var5
                    local.get $var9
                    i32.const 8
                    i32.shr_u
                    i32.const 16711935
                    i32.and
                    local.get $var9
                    i32.const 16711935
                    i32.and
                    i32.add
                    i32.const 65537
                    i32.mul
                    i32.const 16
                    i32.shr_u
                    local.get $var4
                    i32.add
                    local.set $var4
                    local.get $var12
                    i32.eqz
                    br_if $label13
                  end $label13
                  local.get $var12
                  i32.const 2
                  i32.shl
                  local.set $var8
                  local.get $var7
                  local.get $var11
                  i32.const 252
                  i32.and
                  i32.const 2
                  i32.shl
                  i32.add
                  local.set $var10
                  i32.const 0
                  local.set $var9
                  loop $label14
                    local.get $var10
                    i32.load
                    local.tee $var5
                    i32.const -1
                    i32.xor
                    i32.const 7
                    i32.shr_u
                    local.get $var5
                    i32.const 6
                    i32.shr_u
                    i32.or
                    i32.const 16843009
                    i32.and
                    local.get $var9
                    i32.add
                    local.set $var9
                    local.get $var10
                    i32.const 4
                    i32.add
                    local.set $var10
                    local.get $var8
                    i32.const -4
                    i32.add
                    local.tee $var8
                    br_if $label14
                  end $label14
                  local.get $var9
                  i32.const 8
                  i32.shr_u
                  i32.const 16711935
                  i32.and
                  local.get $var9
                  i32.const 16711935
                  i32.and
                  i32.add
                  i32.const 65537
                  i32.mul
                  i32.const 16
                  i32.shr_u
                  local.get $var4
                  i32.add
                  local.set $var4
                  br $label9
                end $label4
                block $label15
                  local.get $var2
                  br_if $label15
                  i32.const 0
                  local.set $var2
                  i32.const 0
                  local.set $var4
                  br $label9
                end $label15
                i32.const 0
                local.set $var4
                i32.const 0
                local.set $var10
                loop $label16
                  local.get $var4
                  local.get $var1
                  local.get $var10
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.set $var4
                  local.get $var2
                  local.get $var10
                  i32.const 1
                  i32.add
                  local.tee $var10
                  i32.ne
                  br_if $label16
                  br $label9
                end $label16
              end $label2
              local.get $var1
              local.get $var2
              i32.add
              local.set $var5
              i32.const 0
              local.set $var2
              local.get $var1
              local.set $var9
              local.get $var4
              local.set $var8
              loop $label22
                local.get $var9
                local.tee $var10
                local.get $var5
                i32.eq
                br_if $label17
                block $label19
                  block $label18
                    local.get $var10
                    i32.load8_s
                    local.tee $var9
                    i32.const -1
                    i32.le_s
                    br_if $label18
                    local.get $var10
                    i32.const 1
                    i32.add
                    local.set $var9
                    br $label19
                  end $label18
                  block $label20
                    local.get $var9
                    i32.const -32
                    i32.ge_u
                    br_if $label20
                    local.get $var10
                    i32.const 2
                    i32.add
                    local.set $var9
                    br $label19
                  end $label20
                  block $label21
                    local.get $var9
                    i32.const -16
                    i32.ge_u
                    br_if $label21
                    local.get $var10
                    i32.const 3
                    i32.add
                    local.set $var9
                    br $label19
                  end $label21
                  local.get $var10
                  i32.const 4
                  i32.add
                  local.set $var9
                end $label19
                local.get $var9
                local.get $var10
                i32.sub
                local.get $var2
                i32.add
                local.set $var2
                local.get $var8
                i32.const -1
                i32.add
                local.tee $var8
                br_if $label22
              end $label22
            end $label3
            i32.const 0
            local.set $var8
          end $label17
          local.get $var4
          local.get $var8
          i32.sub
          local.set $var4
        end $label9
        local.get $var4
        local.get $var0
        i32.load16_u offset=12
        local.tee $var10
        i32.ge_u
        br_if $label0
        local.get $var10
        local.get $var4
        i32.sub
        local.set $var7
        i32.const 0
        local.set $var10
        i32.const 0
        local.set $var6
        block $label23
          block $label25
            block $label24
              local.get $var3
              i32.const 29
              i32.shr_u
              i32.const 3
              i32.and
              br_table $label23 $label24 $label25 $label23 $label23
            end $label24
            local.get $var7
            local.set $var6
            br $label23
          end $label25
          local.get $var7
          i32.const 65534
          i32.and
          i32.const 1
          i32.shr_u
          local.set $var6
        end $label23
        local.get $var3
        i32.const 2097151
        i32.and
        local.set $var4
        local.get $var0
        i32.load offset=4
        local.set $var8
        local.get $var0
        i32.load
        local.set $var5
        block $label26
          loop $label28
            local.get $var10
            i32.const 65535
            i32.and
            local.get $var6
            i32.const 65535
            i32.and
            i32.ge_u
            br_if $label26
            i32.const 1
            local.set $var9
            local.get $var10
            i32.const 1
            i32.add
            local.set $var10
            local.get $var5
            local.get $var4
            local.get $var8
            i32.load offset=16
            call_indirect (param i32 i32) (result i32)
            br_if $label27
            br $label28
          end $label28
        end $label26
        i32.const 1
        local.set $var9
        local.get $var5
        local.get $var1
        local.get $var2
        local.get $var8
        i32.load offset=12
        call_indirect (param i32 i32 i32) (result i32)
        br_if $label27
        local.get $var7
        local.get $var6
        i32.sub
        i32.const 65535
        i32.and
        local.set $var6
        i32.const 0
        local.set $var10
        loop $label30
          block $label29
            local.get $var10
            i32.const 65535
            i32.and
            local.get $var6
            i32.lt_u
            br_if $label29
            i32.const 0
            return
          end $label29
          i32.const 1
          local.set $var9
          local.get $var10
          i32.const 1
          i32.add
          local.set $var10
          local.get $var5
          local.get $var4
          local.get $var8
          i32.load offset=16
          call_indirect (param i32 i32) (result i32)
          br_if $label27
          br $label30
        end $label30
      end $label0
      local.get $var0
      i32.load
      local.get $var1
      local.get $var2
      local.get $var0
      i32.load offset=4
      i32.load offset=12
      call_indirect (param i32 i32 i32) (result i32)
      local.set $var9
    end $label27
    local.get $var9
  )
  (func $_RNvCskK8ZSUeDzDN_7___rustc17rust_begin_unwind (;28;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var0
    i64.load align=4
    local.set $var2
    local.get $var1
    local.get $var0
    i32.store offset=12
    local.get $var1
    local.get $var2
    i64.store offset=4 align=4
    local.get $var1
    i32.const 4
    i32.add
    call $_ZN3std3sys9backtrace26__rust_end_short_backtrace17h734c0aa87b6cc954E
    unreachable
  )
  (func $_ZN4core6option13unwrap_failed17hd4c633e91b0913d9E (;29;)
    i32.const 1048932
    i32.const 43
    i32.const 1050604
    call $_ZN4core9panicking5panic17h7520802b131436bfE
    unreachable
  )
  (func $_ZN4core9panicking19assert_failed_inner17h2607d5185a549b79E (;30;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    (local $var4 i64)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    i32.const 1050748
    i32.store offset=12
    local.get $var3
    local.get $var0
    i32.store offset=8
    local.get $var3
    i32.const 1050748
    i32.store offset=20
    local.get $var3
    local.get $var1
    i32.store offset=16
    local.get $var3
    i32.const 2
    i32.store offset=28
    local.get $var3
    i32.const 1049044
    i32.store offset=24
    block $label0
      local.get $var2
      i32.load
      i32.eqz
      br_if $label0
      local.get $var3
      i32.const 32
      i32.add
      i32.const 16
      i32.add
      local.get $var2
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get $var3
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      local.get $var2
      i32.const 8
      i32.add
      i64.load align=4
      i64.store
      local.get $var3
      local.get $var2
      i64.load align=4
      i64.store offset=32
      local.get $var3
      i32.const 4
      i32.store offset=92
      local.get $var3
      i32.const 1049148
      i32.store offset=88
      local.get $var3
      i64.const 4
      i64.store offset=100 align=4
      local.get $var3
      i32.const 3
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee $var4
      local.get $var3
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=80
      local.get $var3
      local.get $var4
      local.get $var3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=72
      local.get $var3
      i32.const 4
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get $var3
      i32.const 32
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=64
      local.get $var3
      i32.const 1
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get $var3
      i32.const 24
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get $var3
      local.get $var3
      i32.const 56
      i32.add
      i32.store offset=96
      local.get $var3
      i32.const 88
      i32.add
      i32.const 1050660
      call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
      unreachable
    end $label0
    local.get $var3
    i32.const 3
    i32.store offset=92
    local.get $var3
    i32.const 1049096
    i32.store offset=88
    local.get $var3
    i64.const 3
    i64.store offset=100 align=4
    local.get $var3
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $var4
    local.get $var3
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get $var3
    local.get $var4
    local.get $var3
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=64
    local.get $var3
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get $var3
    i32.const 24
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get $var3
    local.get $var3
    i32.const 56
    i32.add
    i32.store offset=96
    local.get $var3
    i32.const 88
    i32.add
    i32.const 1050660
    call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
    unreachable
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he295cab176c7f3cbE (;31;) (param $var0 i32) (param $var1 i32) (result i32)
    local.get $var0
    i32.load
    local.get $var1
    local.get $var0
    i32.load offset=4
    i32.load offset=12
    call_indirect (param i32 i32) (result i32)
  )
  (func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17haa6b1d473c056d34E (;32;) (param $var0 i32) (param $var1 i32) (result i32)
    local.get $var1
    i32.load
    local.get $var1
    i32.load offset=4
    local.get $var0
    call $_ZN4core3fmt5write17h1d876ccae7634b9bE
  )
  (func $_ZN4core3fmt5write17h1d876ccae7634b9bE (;33;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (result i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i32)
    (local $var10 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    local.get $var1
    i32.store offset=4
    local.get $var3
    local.get $var0
    i32.store
    local.get $var3
    i64.const 3758096416
    i64.store offset=8 align=4
    block $label4
      block $label6
        block $label2
          block $label1
            block $label0
              local.get $var2
              i32.load offset=16
              local.tee $var4
              i32.eqz
              br_if $label0
              local.get $var2
              i32.load offset=20
              local.tee $var1
              br_if $label1
              br $label2
            end $label0
            local.get $var2
            i32.load offset=12
            local.tee $var0
            i32.eqz
            br_if $label2
            local.get $var2
            i32.load offset=8
            local.tee $var1
            local.get $var0
            i32.const 3
            i32.shl
            local.tee $var0
            i32.add
            local.set $var5
            local.get $var0
            i32.const -8
            i32.add
            i32.const 3
            i32.shr_u
            i32.const 1
            i32.add
            local.set $var6
            local.get $var2
            i32.load
            local.set $var0
            loop $label7
              block $label3
                local.get $var0
                i32.const 4
                i32.add
                i32.load
                local.tee $var7
                i32.eqz
                br_if $label3
                local.get $var3
                i32.load
                local.get $var0
                i32.load
                local.get $var7
                local.get $var3
                i32.load offset=4
                i32.load offset=12
                call_indirect (param i32 i32 i32) (result i32)
                i32.eqz
                br_if $label3
                i32.const 1
                local.set $var1
                br $label4
              end $label3
              block $label5
                local.get $var1
                i32.load
                local.get $var3
                local.get $var1
                i32.const 4
                i32.add
                i32.load
                call_indirect (param i32 i32) (result i32)
                i32.eqz
                br_if $label5
                i32.const 1
                local.set $var1
                br $label4
              end $label5
              local.get $var0
              i32.const 8
              i32.add
              local.set $var0
              local.get $var1
              i32.const 8
              i32.add
              local.tee $var1
              local.get $var5
              i32.eq
              br_if $label6
              br $label7
            end $label7
          end $label1
          local.get $var1
          i32.const 24
          i32.mul
          local.set $var8
          local.get $var1
          i32.const -1
          i32.add
          i32.const 536870911
          i32.and
          i32.const 1
          i32.add
          local.set $var6
          local.get $var2
          i32.load offset=8
          local.set $var9
          local.get $var2
          i32.load
          local.set $var0
          i32.const 0
          local.set $var7
          loop $label16
            block $label8
              local.get $var0
              i32.const 4
              i32.add
              i32.load
              local.tee $var1
              i32.eqz
              br_if $label8
              local.get $var3
              i32.load
              local.get $var0
              i32.load
              local.get $var1
              local.get $var3
              i32.load offset=4
              i32.load offset=12
              call_indirect (param i32 i32 i32) (result i32)
              i32.eqz
              br_if $label8
              i32.const 1
              local.set $var1
              br $label4
            end $label8
            i32.const 0
            local.set $var5
            i32.const 0
            local.set $var10
            block $label11
              block $label10
                block $label9
                  local.get $var4
                  local.get $var7
                  i32.add
                  local.tee $var1
                  i32.const 8
                  i32.add
                  i32.load16_u
                  br_table $label9 $label10 $label11 $label9
                end $label9
                local.get $var1
                i32.const 10
                i32.add
                i32.load16_u
                local.set $var10
                br $label11
              end $label10
              local.get $var9
              local.get $var1
              i32.const 12
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              i32.load16_u offset=4
              local.set $var10
            end $label11
            block $label14
              block $label13
                block $label12
                  local.get $var1
                  i32.load16_u
                  br_table $label12 $label13 $label14 $label12
                end $label12
                local.get $var1
                i32.const 2
                i32.add
                i32.load16_u
                local.set $var5
                br $label14
              end $label13
              local.get $var9
              local.get $var1
              i32.const 4
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              i32.load16_u offset=4
              local.set $var5
            end $label14
            local.get $var3
            local.get $var5
            i32.store16 offset=14
            local.get $var3
            local.get $var10
            i32.store16 offset=12
            local.get $var3
            local.get $var1
            i32.const 20
            i32.add
            i32.load
            i32.store offset=8
            block $label15
              local.get $var9
              local.get $var1
              i32.const 16
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee $var1
              i32.load
              local.get $var3
              local.get $var1
              i32.load offset=4
              call_indirect (param i32 i32) (result i32)
              i32.eqz
              br_if $label15
              i32.const 1
              local.set $var1
              br $label4
            end $label15
            local.get $var0
            i32.const 8
            i32.add
            local.set $var0
            local.get $var8
            local.get $var7
            i32.const 24
            i32.add
            local.tee $var7
            i32.eq
            br_if $label6
            br $label16
          end $label16
        end $label2
        i32.const 0
        local.set $var6
      end $label6
      block $label17
        local.get $var6
        local.get $var2
        i32.load offset=4
        i32.ge_u
        br_if $label17
        local.get $var3
        i32.load
        local.get $var2
        i32.load
        local.get $var6
        i32.const 3
        i32.shl
        i32.add
        local.tee $var1
        i32.load
        local.get $var1
        i32.load offset=4
        local.get $var3
        i32.load offset=4
        i32.load offset=12
        call_indirect (param i32 i32 i32) (result i32)
        i32.eqz
        br_if $label17
        i32.const 1
        local.set $var1
        br $label4
      end $label17
      i32.const 0
      local.set $var1
    end $label4
    local.get $var3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get $var1
  )
  (func $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail8do_panic7runtime17h7796e94a8ae679c1E (;34;) (param $var0 i32) (param $var1 i32) (param $var2 i32)
    (local $var3 i32)
    (local $var4 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee $var3
    global.set $__stack_pointer
    local.get $var3
    local.get $var1
    i32.store offset=4
    local.get $var3
    local.get $var0
    i32.store
    local.get $var3
    i32.const 3
    i32.store offset=12
    local.get $var3
    i32.const 1048908
    i32.store offset=8
    local.get $var3
    i64.const 2
    i64.store offset=20 align=4
    local.get $var3
    i32.const 2
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee $var4
    local.get $var3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get $var3
    local.get $var4
    local.get $var3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get $var3
    local.get $var3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get $var3
    i32.const 8
    i32.add
    local.get $var2
    call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
    unreachable
  )
  (func $_ZN4core3ops8function6FnOnce9call_once17h08e67cef8bea33a6E (;35;) (param $var0 i32)
    local.get $var0
    i32.const 0
    i32.store offset=12
    local.get $var0
    i64.const 17179869184
    i64.store offset=4 align=4
    local.get $var0
    i32.const 0
    i32.store8
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h76d255b038f889eeE (;36;) (param $var0 i32)
    (local $var1 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var1
    i32.const 8
    i32.add
    local.get $var0
    local.get $var0
    i32.load
    i32.const 1
    i32.const 1
    i32.const 4
    call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17he54e03ffbc17e9e0E
    block $label0
      local.get $var1
      i32.load offset=8
      local.tee $var0
      i32.const -2147483647
      i32.eq
      br_if $label0
      local.get $var0
      local.get $var1
      i32.load offset=12
      i32.const 1050416
      call $_ZN5alloc7raw_vec12handle_error17hc5314d3208d911b6E
      unreachable
    end $label0
    local.get $var1
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17he8ad4992820ad6e0E (;37;) (param $var0 i32)
    (local $var1 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var1
    i32.const 8
    i32.add
    local.get $var0
    local.get $var0
    i32.load
    i32.const 1
    i32.const 1
    i32.const 16
    call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17he54e03ffbc17e9e0E
    block $label0
      local.get $var1
      i32.load offset=8
      local.tee $var0
      i32.const -2147483647
      i32.eq
      br_if $label0
      local.get $var0
      local.get $var1
      i32.load offset=12
      i32.const 1050368
      call $_ZN5alloc7raw_vec12handle_error17hc5314d3208d911b6E
      unreachable
    end $label0
    local.get $var1
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h8b3d2745a7a8cbbeE (;38;) (param $var0 i32)
    (local $var1 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var1
    i32.const 8
    i32.add
    local.get $var0
    local.get $var0
    i32.load
    i32.const 1
    i32.const 4
    i32.const 8
    call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17he54e03ffbc17e9e0E
    block $label0
      local.get $var1
      i32.load offset=8
      local.tee $var0
      i32.const -2147483647
      i32.eq
      br_if $label0
      local.get $var0
      local.get $var1
      i32.load offset=12
      i32.const 1050336
      call $_ZN5alloc7raw_vec12handle_error17hc5314d3208d911b6E
      unreachable
    end $label0
    local.get $var1
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17he54e03ffbc17e9e0E (;39;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32) (param $var4 i32) (param $var5 i32)
    (local $var6 i32)
    (local $var7 i32)
    (local $var8 i32)
    (local $var9 i64)
    (local $var10 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var6
    global.set $__stack_pointer
    block $label2
      block $label1
        block $label0
          local.get $var3
          local.get $var2
          i32.add
          local.tee $var2
          local.get $var3
          i32.ge_u
          br_if $label0
          i32.const 0
          local.set $var3
          br $label1
        end $label0
        i32.const 0
        local.set $var3
        local.get $var4
        local.get $var5
        i32.add
        i32.const -1
        i32.add
        i32.const 0
        local.get $var4
        i32.sub
        i32.and
        i64.extend_i32_u
        local.get $var2
        local.get $var1
        i32.load
        local.tee $var7
        i32.const 1
        i32.shl
        local.tee $var8
        local.get $var2
        local.get $var8
        i32.gt_u
        select
        local.tee $var2
        i32.const 8
        i32.const 4
        local.get $var5
        i32.const 1
        i32.eq
        select
        local.tee $var8
        local.get $var2
        local.get $var8
        i32.gt_u
        select
        local.tee $var8
        i64.extend_i32_u
        i64.mul
        local.tee $var9
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        br_if $label1
        local.get $var9
        i32.wrap_i64
        local.tee $var10
        i32.const -2147483648
        local.get $var4
        i32.sub
        i32.gt_u
        br_if $label2
        block $label4
          block $label3
            local.get $var7
            br_if $label3
            local.get $var6
            i32.const 20
            i32.add
            i32.const 4
            i32.add
            local.set $var3
            i32.const 0
            local.set $var5
            br $label4
          end $label3
          local.get $var6
          i32.const 20
          i32.add
          i32.const 8
          i32.add
          local.set $var3
          local.get $var6
          local.get $var4
          i32.store offset=24
          local.get $var6
          local.get $var1
          i32.load offset=4
          i32.store offset=20
          local.get $var7
          local.get $var5
          i32.mul
          local.set $var5
        end $label4
        local.get $var3
        local.get $var5
        i32.store
        local.get $var6
        i32.const 8
        i32.add
        local.get $var4
        local.get $var10
        local.get $var6
        i32.const 20
        i32.add
        call $_ZN5alloc7raw_vec11finish_grow17h7b9206971f688f33E
        block $label5
          local.get $var6
          i32.load offset=8
          i32.const 1
          i32.ne
          br_if $label5
          local.get $var6
          i32.load offset=16
          local.set $var2
          local.get $var6
          i32.load offset=12
          local.set $var3
          br $label2
        end $label5
        local.get $var6
        i32.load offset=12
        local.set $var4
        local.get $var1
        local.get $var8
        i32.store
        local.get $var1
        local.get $var4
        i32.store offset=4
        i32.const -2147483647
        local.set $var3
      end $label1
    end $label2
    local.get $var0
    local.get $var2
    i32.store offset=4
    local.get $var0
    local.get $var3
    i32.store
    local.get $var6
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN5alloc7raw_vec11finish_grow17h7b9206971f688f33E (;40;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32)
    (local $var4 i32)
    block $label4
      block $label3
        block $label2
          block $label0
            local.get $var3
            i32.load offset=4
            i32.eqz
            br_if $label0
            block $label1
              local.get $var3
              i32.load offset=8
              local.tee $var4
              br_if $label1
              local.get $var2
              br_if $label2
              br $label3
            end $label1
            local.get $var3
            i32.load
            local.get $var4
            local.get $var1
            local.get $var2
            call $_RNvCskK8ZSUeDzDN_7___rustc14___rust_realloc
            local.set $var3
            br $label4
          end $label0
          local.get $var2
          i32.eqz
          br_if $label3
        end $label2
        local.get $var2
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hae995e06280993bbE
        local.set $var3
        br $label4
      end $label3
      local.get $var1
      local.set $var3
    end $label4
    local.get $var0
    local.get $var2
    i32.store offset=8
    local.get $var0
    local.get $var3
    local.get $var1
    local.get $var3
    select
    i32.store offset=4
    local.get $var0
    local.get $var3
    i32.eqz
    i32.store
  )
  (func $_ZN3std4sync9lazy_lock14panic_poisoned17h6cefe2c83d597906E (;41;)
    (local $var0 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee $var0
    global.set $__stack_pointer
    local.get $var0
    i32.const 0
    i32.store offset=24
    local.get $var0
    i32.const 1
    i32.store offset=12
    local.get $var0
    i32.const 1050724
    i32.store offset=8
    local.get $var0
    i64.const 4
    i64.store offset=16 align=4
    local.get $var0
    i32.const 8
    i32.add
    i32.const 1050732
    call $_ZN4core9panicking9panic_fmt17h6c05163ecc152148E
    unreachable
  )
  (func $_ZN4core9panicking13assert_failed17h2a0bac4e515d97d3E (;42;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var2
    global.set $__stack_pointer
    local.get $var2
    i32.const 1049676
    i32.store offset=12
    local.get $var2
    local.get $var0
    i32.store offset=8
    local.get $var2
    i32.const 8
    i32.add
    local.get $var2
    i32.const 12
    i32.add
    local.get $var1
    call $_ZN4core9panicking19assert_failed_inner17h2607d5185a549b79E
    unreachable
  )
  (func $_ZN4core5panic12PanicPayload6as_str17h2a2bcef846efba67E (;43;) (param $var0 i32) (param $var1 i32)
    local.get $var0
    i32.const 0
    i32.store
  )
  (func $_ZN3std9panicking15panic_with_hook17h4682575a314a4371E (;44;) (param $var0 i32) (param $var1 i32) (param $var2 i32) (param $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var4
    global.set $__stack_pointer
    i32.const 0
    i32.const 0
    i32.load offset=1051372
    local.tee $var5
    i32.const 1
    i32.add
    i32.store offset=1051372
    block $label0
      local.get $var5
      i32.const 0
      i32.lt_s
      br_if $label0
      block $label2
        block $label1
          i32.const 0
          i32.load8_u offset=1051368
          br_if $label1
          i32.const 0
          i32.const 0
          i32.load offset=1051364
          i32.const 1
          i32.add
          i32.store offset=1051364
          i32.const 0
          i32.load offset=1051376
          i32.const -1
          i32.gt_s
          br_if $label2
          br $label0
        end $label1
        local.get $var4
        i32.const 8
        i32.add
        local.get $var0
        local.get $var1
        call_indirect (param i32 i32)
        unreachable
      end $label2
      i32.const 0
      i32.const 0
      i32.store8 offset=1051368
      local.get $var2
      i32.eqz
      br_if $label0
      call $_RNvCskK8ZSUeDzDN_7___rustc10rust_panic
      unreachable
    end $label0
    unreachable
  )
  (func $_RNvCskK8ZSUeDzDN_7___rustc10rust_panic (;45;)
    unreachable
  )
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h051afc3d5b2442d1E (;46;) (param $var0 i32) (param $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    (local $var4 i32)
    (local $var5 i32)
    i32.const 31
    local.set $var2
    block $label0
      local.get $var1
      i32.const 16777215
      i32.gt_u
      br_if $label0
      local.get $var1
      i32.const 38
      local.get $var1
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee $var2
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get $var2
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set $var2
    end $label0
    local.get $var0
    i64.const 0
    i64.store offset=16 align=4
    local.get $var0
    local.get $var2
    i32.store offset=28
    local.get $var2
    i32.const 2
    i32.shl
    i32.const 1050912
    i32.add
    local.set $var3
    block $label1
      i32.const 0
      i32.load offset=1051324
      i32.const 1
      local.get $var2
      i32.shl
      local.tee $var4
      i32.and
      br_if $label1
      local.get $var3
      local.get $var0
      i32.store
      local.get $var0
      local.get $var3
      i32.store offset=24
      local.get $var0
      local.get $var0
      i32.store offset=12
      local.get $var0
      local.get $var0
      i32.store offset=8
      i32.const 0
      i32.const 0
      i32.load offset=1051324
      local.get $var4
      i32.or
      i32.store offset=1051324
      return
    end $label1
    block $label4
      block $label3
        block $label2
          local.get $var3
          i32.load
          local.tee $var4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get $var1
          i32.ne
          br_if $label2
          local.get $var4
          local.set $var2
          br $label3
        end $label2
        local.get $var1
        i32.const 0
        i32.const 25
        local.get $var2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get $var2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set $var3
        loop $label5
          local.get $var4
          local.get $var3
          i32.const 29
          i32.shr_u
          i32.const 4
          i32.and
          i32.add
          local.tee $var5
          i32.load offset=16
          local.tee $var2
          i32.eqz
          br_if $label4
          local.get $var3
          i32.const 1
          i32.shl
          local.set $var3
          local.get $var2
          local.set $var4
          local.get $var2
          i32.load offset=4
          i32.const -8
          i32.and
          local.get $var1
          i32.ne
          br_if $label5
        end $label5
      end $label3
      local.get $var2
      i32.load offset=8
      local.tee $var3
      local.get $var0
      i32.store offset=12
      local.get $var2
      local.get $var0
      i32.store offset=8
      local.get $var0
      i32.const 0
      i32.store offset=24
      local.get $var0
      local.get $var2
      i32.store offset=12
      local.get $var0
      local.get $var3
      i32.store offset=8
      return
    end $label4
    local.get $var5
    i32.const 16
    i32.add
    local.get $var0
    i32.store
    local.get $var0
    local.get $var4
    i32.store offset=24
    local.get $var0
    local.get $var0
    i32.store offset=12
    local.get $var0
    local.get $var0
    i32.store offset=8
  )
  (func $_ZN3std3sys9backtrace26__rust_end_short_backtrace17h734c0aa87b6cc954E (;47;) (param $var0 i32)
    local.get $var0
    call $_ZN3std9panicking13panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17hd7acda208ec7abafE
    unreachable
  )
  (func $_ZN3std9panicking13panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17hd7acda208ec7abafE (;48;) (param $var0 i32)
    (local $var1 i32)
    (local $var2 i32)
    (local $var3 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee $var1
    global.set $__stack_pointer
    local.get $var0
    i32.load
    local.tee $var2
    i32.load offset=12
    local.set $var3
    block $label3
      block $label2
        block $label1
          block $label0
            local.get $var2
            i32.load offset=4
            br_table $label0 $label1 $label2
          end $label0
          local.get $var3
          br_if $label2
          i32.const 1
          local.set $var2
          i32.const 0
          local.set $var3
          br $label3
        end $label1
        local.get $var3
        br_if $label2
        local.get $var2
        i32.load
        local.tee $var2
        i32.load offset=4
        local.set $var3
        local.get $var2
        i32.load
        local.set $var2
        br $label3
      end $label2
      local.get $var1
      i32.const -2147483648
      i32.store
      local.get $var1
      local.get $var0
      i32.store offset=12
      local.get $var1
      i32.const 5
      local.get $var0
      i32.load offset=8
      local.tee $var0
      i32.load8_u offset=8
      local.get $var0
      i32.load8_u offset=9
      call $_ZN3std9panicking15panic_with_hook17h4682575a314a4371E
      unreachable
    end $label3
    local.get $var1
    local.get $var3
    i32.store offset=4
    local.get $var1
    local.get $var2
    i32.store
    local.get $var1
    i32.const 6
    local.get $var0
    i32.load offset=8
    local.tee $var0
    i32.load8_u offset=8
    local.get $var0
    i32.load8_u offset=9
    call $_ZN3std9panicking15panic_with_hook17h4682575a314a4371E
    unreachable
  )
  (func $_ZN93_$LT$std..panicking..panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17hcd7d04be367d30afE (;49;) (param $var0 i32) (param $var1 i32)
    local.get $var0
    local.get $var1
    i64.load align=4
    i64.store
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1c2574fa86a3f5d7E (;50;) (param $var0 i32) (param $var1 i32) (result i32)
    block $label0
      local.get $var0
      i32.load
      i32.load8_u
      br_if $label0
      local.get $var1
      i32.const 1048604
      i32.const 5
      call $_ZN4core3fmt9Formatter3pad17hc9ee21a24ccd870cE
      return
    end $label0
    local.get $var1
    i32.const 1048609
    i32.const 4
    call $_ZN4core3fmt9Formatter3pad17hc9ee21a24ccd870cE
  )
  (data (i32.const 1048576) "capacity overflow\00\00\00\00\00\10\00\11\00\00\00falsetrue00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899)\00\00\01\00\00\00\00\00\00\00copy_from_slice: source slice length () does not match destination slice length (\00\00\00\f8\00\10\00&\00\00\00\1e\01\10\00+\00\00\00\ed\00\10\00\01\00\00\00called `Option::unwrap()` on a `None` valueindex out of bounds: the len is  but the index is \00\00\00\8f\01\10\00 \00\00\00\af\01\10\00\12\00\00\00==assertion `left  right` failed\0a  left: \0a right: \00\00\d6\01\10\00\10\00\00\00\e6\01\10\00\17\00\00\00\fd\01\10\00\09\00\00\00 right` failed: \0a  left: \00\00\00\d6\01\10\00\10\00\00\00 \02\10\00\10\00\00\000\02\10\00\09\00\00\00\fd\01\10\00\09\00\00\00\9c\03\10\00v\00\00\00\d7\00\00\00\14\00\00\00/Users/martin/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/src/rust/library/std/src/sys/sync/mutex/no_threads.rs\00/Users/martin/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/src/rust/library/core/src/iter/traits/iterator.rs\00src/aes/cipher.rs\00library/std/src/sync/lazy_lock.rs\00/Users/martin/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/src/rust/library/std/src/sync/poison/once.rs\00src/aes/mod.rs\00/rust/deps/dlmalloc-0.2.10/src/dlmalloc.rs\00\00\00\00\ec\02\10\00{\00\00\00\eb\07\00\00\09\00\00\00c|w{\f2ko\c50\01g+\fe\d7\abv\ca\82\c9}\faYG\f0\ad\d4\a2\af\9c\a4r\c0\b7\fd\93&6?\f7\cc4\a5\e5\f1q\d81\15\04\c7#\c3\18\96\05\9a\07\12\80\e2\eb'\b2u\09\83,\1a\1bnZ\a0R;\d6\b3)\e3/\84S\d1\00\ed \fc\b1[j\cb\be9JLX\cf\d0\ef\aa\fbCM3\85E\f9\02\7fP<\9f\a8Q\a3@\8f\92\9d8\f5\bc\b6\da!\10\ff\f3\d2\cd\0c\13\ec_\97D\17\c4\a7~=d]\19s`\81O\dc\22*\90\88F\ee\b8\14\de^\0b\db\e02:\0aI\06$\5c\c2\d3\acb\91\95\e4y\e7\c87m\8d\d5N\a9lV\f4\eaez\ae\08\bax%.\1c\a6\b4\c6\e8\ddt\1fK\bd\8b\8ap>\b5fH\03\f6\0ea5W\b9\86\c1\1d\9e\e1\f8\98\11i\d9\8e\94\9b\1e\87\e9\ceU(\df\8c\a1\89\0d\bf\e6BhA\99-\0f\b0T\bb\16R\09j\d506\a58\bf@\a3\9e\81\f3\d7\fb|\e39\82\9b/\ff\874\8eCD\c4\de\e9\cbT{\942\a6\c2#=\eeL\95\0bB\fa\c3N\08.\a1f(\d9$\b2v[\a2Im\8b\d1%r\f8\f6d\86h\98\16\d4\a4\5c\cc]e\b6\92lpHP\fd\ed\b9\da^\15FW\a7\8d\9d\84\90\d8\ab\00\8c\bc\d3\0a\f7\e4X\05\b8\b3E\06\d0,\1e\8f\ca?\0f\02\c1\af\bd\03\01\13\8ak:\91\11AOg\dc\ea\97\f2\cf\ce\f0\b4\e6s\96\act\22\e7\ad5\85\e2\f97\e8\1cu\dfnG\f1\1aq\1d)\c5\89o\b7b\0e\aa\18\be\1b\fcV>K\c6\d2y \9a\db\c0\fex\cdZ\f4\1f\dd\a83\88\07\c71\b1\12\10Y'\80\ec_`Q\7f\a9\19\b5J\0d-\e5z\9f\93\c9\9c\ef\a0\e0;M\ae*\f5\b0\c8\eb\bb<\83S\99a\17+\04~\baw\d6&\e1i\14cU!\0c}\13\04\10\00\0e\00\00\000\00\00\00\0b\00\00\00\13\04\10\00\0e\00\00\00 \00\00\00\0b\00\00\00cannot drop non-existent array\00\00\13\04\10\00\0e\00\00\00[\00\00\00\0e\00\00\00cannot access non-existent array\13\04\10\00\0e\00\00\00R\00\00\00\0e\00\00\00\13\04\10\00\0e\00\00\00I\00\00\00\15\00\00\00h\03\10\00\11\00\00\00@\00\00\001\00\00\00h\03\10\00\11\00\00\00H\00\00\00\1b\00\00\00h\03\10\00\11\00\00\00E\00\00\00*\00\00\00h\03\10\00\11\00\00\00S\00\00\00\15\00\00\00h\03\10\00\11\00\00\00_\00\00\00\0f\00\00\00\00\01\02\04\08\10 @\80\1b6\00h\03\10\00\11\00\00\00\ae\01\00\00\1b\00\00\00h\03\10\00\11\00\00\00\b6\01\00\00$\00\00\00h\03\10\00\11\00\00\00\96\01\00\00 \00\00\00h\03\10\00\11\00\00\00\a3\01\00\00\1b\00\00\00h\03\10\00\11\00\00\00\9c\01\00\00$\00\00\00\13\04\10\00\0e\00\00\007\00\00\00\0b\00\00\00one-time initialization may not be performed recursively\ac\07\10\008\00\00\00\9c\03\10\00v\00\00\00\d7\00\00\001\00\00\00cannot recursively acquire mutex\fc\07\10\00 \00\00\00l\02\10\00\7f\00\00\00\13\00\00\00\09\00\00\00LazyLock instance has previously been poisoned\00\004\08\10\00.\00\00\00z\03\10\00!\00\00\00\97\01\00\00\05\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\08\00\00\00assertion failed: psize >= size + min_overhead\00\00\22\04\10\00*\00\00\00\b1\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\22\04\10\00*\00\00\00\b7\04\00\00\0d\00\00\00")
  (data (i32.const 1050892) "\07\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
)